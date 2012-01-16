import fx.win32,fx.fxobject;
/**
*Represents an event handler which contains an array of delegates of type ReturnType with the calling parameters Params
*Example:
*---
*alias EventHandler!(bool,int) MyEH;
*MyEH myEH;
*
*this()
*{
*	myEH=new MyEH(); //somewhere in the super class constructor
*	myEH~=delegate bool(Object sender,int i)
*	{
*	if(i<5) return true;
*	return false;
*	};
*}
*
*void foo(int n)
*{
*	if(myEH(n))
*	{
*		//do something
*	}
*}
*---
*/
class EventHandler(ReturnType, Params ...) : FXObject
{
	protected:
		Procedure[] procs;
	public:
		int length()	{	return procs.length;	}///Count of overloaded procedures
		alias ReturnType delegate(Object,Params) Procedure;///delegate alias of type ReturnType with parameters Params

		/**Calls all event procedures and return the most undefault result*/
		ReturnType opCall(Object sender,Params args)
		{
			static if(!is(ReturnType==void))
			{
				ReturnType ret;
				foreach(eh;procs)
				{
					ReturnType tret=eh(sender,args);
					if(tret!=ret) ret=tret;
				}
				return ret;
			}else{
				foreach(eh;procs)	{	eh(sender,args);	}
			}
		}

		void opCatAssign(Procedure proc) ///Append new event listener
		{
			foreach(eh; procs)
			{
				if(eh==proc) return;
			}
			procs~=proc;
		}
}

///Represent default native window message event arguments
class WindowEvent: FXObject
{
public:
	this(HANDLE h,uint msg,uint wp=0,int lp=0)///
	{
		hwnd=h;
		message=msg;
		wParam=wp;
		lParam=lp;
	}

	this(uint msg)///ditto
	{
		message=msg;
	}

	void* reserved1=null; ///for WM_ACTION
	HANDLE hwnd;///
	uint wParam;///
	int lParam;///
	uint message;///

	WindowEvent opCall(MSG msg)///
	{
		hwnd=msg.hwnd;
		message=msg.message;
		wParam=msg.wParam;
		lParam=msg.lParam;
		return this;
	}
	
	WindowEvent opCall(HANDLE h,uint msg,uint wp=0,int lp=0)///ditto
	{
		hwnd=h;
		message=msg;
		wParam=wp;
		lParam=lp;
		return this;
	}
}


alias int delegate(WindowEvent) EVTPROC;///predefined delegate type of type int delegate(WindowEvent); needed for Control.AddEvent
class WindowEventArray: FXObject ///Contains Window Event Listeners
{
	protected:
		EVTPROC[][uint] evprocs;
	public:
		void Add(uint msg,EVTPROC ep)///
		{
			evprocs[msg]~=ep;
		}

		bool HasEvent(uint msg)///
		{
			if ((msg in evprocs)!=null) return true;
			return false;
		}

		void Remove(uint msg)///
		{
			evprocs.remove(msg);
		}

		int Call(WindowEvent e)///
		{
			EVTPROC[] evs=*(e.message in evprocs);
			if (evs==null) return 0;
			int ret=0;
			foreach(ev; evs)
			{
				if(ret==0) ret=ev(e);
				else ev(e);
			}
			return ret;
		}
}
