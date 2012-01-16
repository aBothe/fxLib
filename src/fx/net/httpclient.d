import std.socket,
std.string,
std.datetime,
core.thread, fx.event,
std.c.windows.winsock,
fx.myfx, fx.file,
core.memory,
std.conv,
std.math;
public import fx.net.http;

///Class for requesting HTTP servers
class HTTPClient : FXObject
{
	public static shared void delegate(string) Log;///Log delegate
	private static this()
	{
		void mL(string msg)
		{
			try{
			std.stdio.writeln(msg);
			}catch{}
		}
		Log=&mL;
	}
	private static alias void delegate(float progress) OnProgressEH;
	private static alias void delegate(long milliseconds_used) OnCompleteEH;
	public:
	static OnProgressEH[] OnProgress;///void delegate(float progress) which is called when an incomming package gets processed
	static OnCompleteEH[] OnComplete;///void delegate(long millisecs) which is called after a request was complete

	///just send a request without waiting for an answer from the server
	static bool SendRequest(HTTPrequest req)
	{
		try{
		long before=Clock.currStdTime();

		scope Socket s=new TcpSocket();

		s.connect(new InternetAddress(req.Url.Host,80));

		auto mreq=req.toString();
		if(mreq=="") {Log("Error: Wrong HTTP Request");return false;}
		foreach(eh; OnProgress) eh(0);
		try{
		if(mreq.length<10000)
		{
			s.send(mreq);
		}else{
			int todo;

			for(int sent; sent<=mreq.length;)
			{
				todo= sent+10000;
				if(todo>=mreq.length) todo=mreq.length;
				s.send(mreq[sent .. todo]);
				foreach(eh; OnProgress) eh((cast(float)sent/cast(float)mreq.length)*100f);
				sent=todo;
				if(sent>=mreq.length) break;
			}
		}
		}catch(Exception e)
		{
			Log("Error: "~e.toString);
		}
		Memory.Free(mreq);
		s.close();
		delete s;
		long diff=(Clock.currStdTime()-before)/1000/10; // Transform hecto-nanoseconds to microseconds
		foreach(eh; OnComplete) eh(diff);
		foreach(eh; OnProgress) eh(100f);

		long th=diff/1000/60/60;
		long tm=diff/1000/60-th*60;
		double ts=cast(double)diff/1000-cast(double)tm*60;
		Log(format("Upload completed!\nTotal time needed: %s s, %s min, %s h", ts, tm, th));

		}catch (Exception e){
			Log("Error: "~e.toString());
			return false;
		}

		return true;
	}

	///Download a file from a server
	static void DownloadToFile(HTTPrequest req,string target, out HTTPanswer ans,bool overwrite=true)
	{
		try	{
		long before=Clock.currStdTime();
		Socket s;
		scope(exit) delete s;
		uint fsize=0;
		uint tsize=0;
		auto buf=Memory.Allocate!(void)(10_000);
		scope(exit) Memory.Free(buf);
		string tbuf="";
		int seek=0;
		ulong tchunk, tchsz;
		int readb;
		bool is_win=false; // Is Server running on Windows?
		float curpc;
		bool t_header_was_there=false;

		ChkDirExists(Path.GetDirectory(target));

		if (File.Exists(target))
			{
				if (overwrite)
					{
						File.Remove(target);
					}
				else
					{
						target=Directory.CreateTempFileName(target);
					}
			}
		
		Log("Server: \""~req.Url.Host~"\"\nRequested resource: \""~req.Url.Resource~"\"\nLocal target: \""~target~"\"");

		s=new TcpSocket();
			s.connect(new InternetAddress(req.Url.Host,80));

		auto mreq=req.toString();
		if(mreq=="") {Log("Error: Wrong HTTP Request");return;}
		s.send(mreq);
		Memory.Free(mreq);

		FileStream fs;
			fs=new FileStream(target,FileMode.Out);
		scope(exit)	fs.close();

		void wrfile(void[] buf)
		{
			fs.write(cast(ubyte[])buf);
		}

		while (s !is null)
			{
				readb=s.receive(buf);

				if (readb<=0) break;
				seek=0;
				try
					{
						if (!t_header_was_there)
							{
								// Check if server has windows OS or not
								try
								{
									is_win=(indexOf(cast(string) buf[0 .. readb],"\r\n")!=-1);
								}
								catch {is_win=false;}

								seek=indexOf(cast(string) buf[0 .. readb],is_win?"\r\n\r\n":"\n\n");
								seek+=is_win?4:2;
								// End checking

								ans=new HTTPanswer(split(cast(string) buf[0 .. seek] , is_win?"\r\n":"\n"));

								fsize=ans.ContentLength;
								if (ans.StatusNum!=200)
									{
										Log("Error: File not found on server! (Status "~to!(string)(ans.StatusNum)~" "~ans.Status~")");
										return;
									}
								if(fsize<=0 && ans.TransferEncoding=="chunked"){
									Log("Info: File transmission chunked. The final size is unknown!");
								}
								t_header_was_there=true;
							}
						if (fsize>0) // Print byte-length that has already been loaded
						{
							float ppc=cast(float)tsize*100/fsize;
							curpc=ppc;
							foreach(eh; OnProgress) eh(ppc);
						}
					}
				catch (Exception e)
					{
						Log("Error: "~e.toString());
					}

				if(ans.TransferEncoding=="chunked")
				{
					chunk:
					if(tchunk>=tchsz || tchunk==0)
					{
						int tf=String.IndexOf(cast(string)buf[seek .. readb],"\r\n");
						if(tf<0) { // if buf ends exactly at chunk length string
							tbuf~=cast(string)buf[seek .. readb]; continue;
						}else{
							tbuf~=cast(string) buf[seek .. seek+tf];
						}
						
						tchsz=HexStrToLong(tbuf);
						tbuf="";
						tchunk=0;
						Log("Chunk received! Length="~to!(string)(tchsz));
						seek+=tf+2; // also the ending CRLF

						if(tchsz==0) // 0 should be the length of last chunk!
						{
							s.close();
							delete s;
							s=null;
							break;
						}
					}

					if(readb>=(seek+tchsz)){
						wrfile(buf[seek .. cast(uint)(seek+tchsz)]);
						tchunk=tchsz;
						seek+=tchsz+2; // Trailing CRLF after each chunk
						goto chunk;
					}else{
						wrfile(buf[seek .. readb]);
						tchunk+=readb-seek;
					}
				}else{
					wrfile(buf[seek .. readb]);
					tsize=cast(uint)fs.position;
					if (tsize==fsize)
					{
						s.close();
						delete s;
						s=null;
						break;
					}
				}
			}

		long diff=(Clock.currStdTime()-before)/1000/10;
		foreach(eh; OnComplete) eh(diff);
		foreach(eh; OnProgress) eh(100f);

		long th=diff/1000/60/60;
		long tm=diff/1000/60-th*60;
		double ts=cast(double)diff/1000-cast(double)tm*60;
		Log(format("Download completed!\nTotal time needed: %s s, %s min, %s h", ts, tm, th));
		}catch (Exception e)
		{
			Log("Error: "~e.toString());
			return;
		}
	}

	///Download a file into memory
	static void[] Download(HTTPrequest req, out HTTPanswer ans)
	{
		long before=Clock.currStdTime();
		Socket s;
		void[] ret;
		int tsize=0;
		int fsize=0;
		ulong tchsz;
		bool chunked;
		void[] buf=Memory.Allocate!(void)(10000);
		scope(exit) Memory.Free(buf);
		string tbuf="";
		int readb;
		bool is_win=false; // Is Server running on Windows?
		float curpc;
		bool t_header_was_there=false;

		Log("Server: \""~req.Url.Host~"\"\nRequested resource: \""~req.Url.Resource~"\"");

		s=new TcpSocket();
		try
		{
			s.connect(new InternetAddress(req.Url.Host,80));
		}
		catch (Exception e)
		{
			Log("Error: "~e.toString());
			delete s;
			return null;
		}
		string mreq=req.toString();
		if(mreq=="") {Log("Error: Wrong HTTP Request"); return null;}
		s.send(mreq);
		//fx.file.File.Remove("raw.txt");
		while (1)
		{
			//buf=Memory.Allocate!(void)(10000);
			readb=s.receive(buf);
			//fx.file.File.AppendToFile("raw.txt",cast(void[])"[[part]]"c~buf[0 .. readb]);

			if (readb<=0) break;
			int seek=0;
			try{
				if (!t_header_was_there)
				{
					// Check if server has windows OS or not
					try
					{
						is_win=(indexOf(cast(string) buf[0 .. readb],"\r\n")!=-1);
					}
					catch {is_win=false;}

					seek=indexOf(cast(string) buf[0 .. readb],is_win?"\r\n\r\n":"\n\n");
					seek+=is_win?4:2;
					// End checking

					ans=new HTTPanswer(split(cast(string) buf[0 .. seek] , is_win?"\r\n":"\n"));

					fsize=ans.ContentLength;
					if (ans.StatusNum!=200)
					{
						Log("Error: File not found on server! (Status "~to!(string)(ans.StatusNum)~" "~ans.Status~")");
						return null;
					}
					if(ans.TransferEncoding=="chunked"){
						chunked=true;
						Log("Info: File transmission chunked. The final size is unknown!");
					}
					t_header_was_there=true;
				}
				if (fsize>0)
				{
					float ppc=cast(float)ret.length*100/fsize;
					//if (ppc>curpc)	Log(to!(string)(lrint(ppc))~"% ("~format("%.3f",cast(float)ret.length/1024/1024)~")MB");
					curpc=ppc;
					foreach(eh; OnProgress) eh(ppc);
				}
			}catch (Exception e){
				Log("Error: "~e.toString());
			}
			int ti=0;

			if(chunked)
			{
				dchunk:
				if(tchsz<=0)
				{
					int tf=String.IndexOf(cast(string)buf[seek .. readb],"\r\n");
					if(tf<0) {
						tbuf~=cast(string)buf[seek .. readb]; continue;
					}else{
						tbuf~=cast(string) buf[seek .. seek+tf];
					}
					
					tchsz=HexStrToLong(tbuf);
					//MessageBox.Show("0x"~tbuf~" => "~to!(string)(tchsz));
					tbuf="";
					//tchunk=0;
					Log("Incoming chunk with length="~to!(string)(tchsz));
					seek+=tf+2; // also skip the ending CRLF

					if(tchsz==0)
					{
						s.close();
						delete s;
						break;
					}
				}
				MessageBox.Show("got "~to!(string)(readb-seek)~" of bytes to write; "~to!(string)(tchsz)~" chunk bytes remaining");
				if(readb>=(seek+tchsz)){
					MessageBox.Show("end of chunk in sight: "~to!(string)(tchsz)~" Bytes available");
					ret~=buf[seek .. cast(uint)(seek+tchsz)];
					//tchunk=tchsz;
					tchsz=0;
					seek+=tchsz+2; // Trailing CRLF after each chunk
					goto dchunk;
				}else{
					MessageBox.Show("Gonna wait for next data..."w);
					ret~=buf[seek .. readb];
					tchsz-=readb-seek;
				}
			}else{
				ret~=(buf[seek .. readb]);
				if (ret.length==fsize)
				{
					s.close();
					delete s;
					s=null;
					break;
				}
			}
		}

		long diff=(Clock.currStdTime()-before)/10000;
		foreach(eh; OnComplete) eh(diff);
		foreach(eh; OnProgress) eh(100f);

		long th=diff/1000/60/60;
		long tm=diff/1000/60-th*60;
		double ts=cast(double)diff/1000-cast(double)tm*60;
		Log(format("Download completed!\nTotal time needed: %s s, %s min, %s h", ts, tm, th));
		return ret;
	}
}
