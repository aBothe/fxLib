module fx.net.tcpserver;
import std.socket, std.conv,
core.thread,
std.stdio,
std.conv,
std.string,
core.memory,
fx.myfx;

///A TCP/IP Server
class TcpServer:FXObject
{
	public:
	~this()
	{
		Stop();
	}
	void Stop()///
	{
		if(is(ath)){ms.close();ath.join(false);delete ath;}
		run=false;
	}
	/**Constructor
	*Params:
	*ad=Address to bind
	*OnReceive=Callback of type void delegate(Socket clientConnection, void[] data) which receives the incoming requests
	*/
	this(Address ad,shared RecvEH OnReceive)
	{
		ms=new TcpSocket();
		ms.bind(ad);
		ms.blocking=true;
		ms.listen(60);
		OnRecv=OnReceive;
	}

	void Run(bool threaded=true)///
	{
		run=true;
		if(is(ath)){ath.join(false);delete ath;}
		if(threaded)
		{
			ath=new Thread(&AccTh);
			ath.isDaemon=true;
			ath.start();
		}else{
			AccTh();
		}
	}
	private:
	Thread ath;
	shared bool run;
	Socket ms;

	alias void delegate(Socket,void[]) RecvEH;
	shared RecvEH OnRecv=null;

	Socket ss;
	void AccTh()
	{
		Thread cth;
		while(run)
		{
			ss=ms.accept();
			ss.blocking=false;
			if(is(cth))
				delete cth;
			cth=new Thread(&RecTh);
			cth.start();
			Sleep(20);
		}
	}
	void RecTh()
	{
		scope Socket s=this.ss;
		Sleep(50);
		void[] data;
		void[] raw;
		int recv;
		raw=Memory.Allocate!(void)(10000);
		try{
			while(s !is null)
			{
				recv=s.receive(raw);
				if(recv<2) break;
				data~=raw[0 .. recv];
			}
			if(OnRecv && data!=null)	OnRecv(s,data);
		}catch(Exception e){writeln("Error while receiving data: "~e.msg);}
		s.close();
		Memory.Free(raw);
		delete data;
	}
}
