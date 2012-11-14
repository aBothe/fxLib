module fx.net.udplistener;
import std.socket,
core.thread,
std.stdio,
std.conv,
std.string,
core.memory,
fx.myfx;

///Simple Listener for incoming UDP Packages
class UdpListener:FXObject
{
	protected:
	Socket ms;
	private:
	Address LocalEndPoint;
	Thread rth;
	bool run=true;
	void RecTh()
	{
		Address a;
		char[] buf;
		while(run)
		{
		buf=new char[packagesize];
		int r = ms.receiveFrom(buf,a);
		if(OnRecv)
			OnRecv(buf[0 .. r],a);
		delete buf;
		delete a;
		}
	}
	public:
	int Send(char[] cmd,Address to)///
	{
		int r=ms.sendTo(cmd,to);
		return r;
	}
	void broadcast(bool v)///
	{ms.setOption(SocketOptionLevel.SOCKET,SocketOption.BROADCAST,v);}
	void addressReusable(bool v)///
	{ms.setOption(SocketOptionLevel.SOCKET,SocketOption.REUSEADDR,v);}

	void Stop()///
	{if(is(rth)){ms.close(); rth.join(false);delete rth;} run=false;}
	void Run(bool threaded=true)///
	{
		ms.bind(LocalEndPoint);
		run=true;
		if(is(rth)) {rth.join(false);delete rth;}
		if(threaded)
		{
			rth=(new Thread(&RecTh));
			rth.isDaemon=true;
			rth.start();
		}else{
			RecTh();
		}
	}
	~this()
	{
		Stop();
	}
	ushort packagesize=20000;///
	void delegate(char[],Address) OnRecv=null;
	this(Address ad,void delegate(char[],Address) RecvCall)///
	{
		ms=new UdpSocket();
		ms.blocking=true;
		OnRecv=RecvCall;
		LocalEndPoint=ad;
	}
}
