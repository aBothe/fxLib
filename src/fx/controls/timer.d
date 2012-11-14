module fx.controls.timer;
import core.memory;

import fx.fxdef;
import fx.win32;
import fx.event, std.conv;

private uint _gtid=1100;

///
class Timer{
	package:
	static Timer[] _gtimers;
	package:
	uint handle;
	uint id;
	uint ms;
	bool running;

	public:
		///
	this(uint msecs,bool enabled=false)
	{
		Tick=new OnTimerEH();
		running=false;
		_gtid++;
		id=_gtid;
		ms=msecs;
		_gtimers~=this;

		this.Enabled=enabled;
	}

	///
	void Interval(uint msecs)
	{
		bool prev=Enabled;
		ms=msecs;
		Stop();
		Enabled=prev;
	}
	///ditto
	uint Interval()
	{
		return ms;
	}

	void Start()///
	{
		if(!running)
			handle=cast(uint)SetTimer(null,id,ms,&TimerCall);
		running=true;
	}

	void Stop()///
	{
		if(running)
			KillTimer(null,handle);
		running=false;
	}

	void Enabled(bool v)///
	{
		if(v)	Start();
		else	Stop();
	}
	bool Enabled()	///
	{	return running;	}

	~this()
	{
		Stop();

		foreach(i, t; _gtimers)
		{
			if(t==this){
				if(_gtimers.length>1)
				_gtimers=_gtimers[0 .. i]~_gtimers[i+1 .. $];
				break;
			}
		}
	}

	static alias EventHandler!(void) OnTimerEH;
	OnTimerEH Tick;///void delegate()
}

private:
	extern(Windows) void TimerCall(HWND h,uint msg,uint thandle,uint startupTime) nothrow
	{
		foreach(i, t; Timer._gtimers)
		{
			if(t.handle!=thandle) 
				continue;
			try{
				t.Tick(t);
			}catch(Exception x) { MessageBox.Show(x.msg, "Exception thrown in tick handler"); }
		}
	}
