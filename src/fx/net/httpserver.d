module fx.net.httpserver;
import std.socket,
core.thread,
std.stdio,
std.conv,
std.string,
core.memory,
fx.net.tcpserver,
fx.myfx;
public import fx.net.http;

///Encapsulates an entire HTTP server
class HTTPserver : TcpServer
{
	private:
	void Recv(Socket s, void[] data)
	{
		if(ReqCall != null)
		{
			HTTPrequest sr;
			HTTPanswer sans;
			try{
			sr=new HTTPrequest(data);
			}catch{}

			sans=ReqCall(sr);
			if(!sans) return;
			scope string ans=sans.toString;
			s.send(cast(char[]) ans);
		}
	}
	alias HTTPanswer delegate(HTTPrequest) ReqEH;
	ReqEH ReqCall=null;

	protected:
	public:

	/**Constructs a new HTTP Server
	*Params:
	*ad=Address to bind
	*ReqCallback=Callback of type HTTPanswer delegate(HTTPrequest) which receives the incoming requests
	*/
	this(Address ad,ReqEH ReqCallback)
	{
		super(ad,&Recv);
		ReqCall=ReqCallback;
	}
}
