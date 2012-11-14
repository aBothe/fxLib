module fx.controls.progressbar;
import fx.win32;
import fx.control;
import std.string;

///
class ProgressBar : Control
{
private:
	static enum
	{
		PBM_SETRANGE =(WM_USER+1),
		PBM_SETPOS   =(WM_USER+2),
		PBM_DELTAPOS =(WM_USER+3),
		PBM_SETSTEP  =(WM_USER+4),
		PBM_STEPIT   =(WM_USER+5),
		PBM_SETRANGE32=(WM_USER+6),
		PBS_MARQUEE  =0x08,
		PBS_SMOOTH   =0x01,
		PBS_VERTICAL =0x04,
	}

		int m_val;
		int m_range;
		void SetValue(int value)			{SendMessageA(handle, PBM_SETPOS, cast(WPARAM) value, 0); m_val=value;}
		int  GetValue()						{return m_val;}
		void SetRange(int range)			{SendMessageA(handle, PBM_SETRANGE32, 0,range); m_range=range;}
		int  GetRange()						{return m_range;}
public:
	///
	this(Control par,int range,int x,int y,int w,int h,int style=0)
	{
		super(par,"msctls_progress32",x,y,w,h,style);
		SetRange(range);
	}
		int value() /***/{return GetValue();}
		int value(int value) /**ditto*/{SetValue(value); return value;}
		int range() /***/{return GetRange();}
		int range(int value) /**ditto*/{SetRange(value); return value;}
		void step(int n) /**Step by n*/{SendMessageA(handle, PBM_SETSTEP, cast(WPARAM) n, 0);}
		void StepIt() /**Step by default step size*/{SendMessageA(handle, PBM_STEPIT, 0, 0);}
		void Increment(int count=1)/***/				{if(value<range) {value=value+count;} else value=0; }
		void Decrement(int count=1)/**ditto*/				{if(value>range) {value=value-count;} else value=range; }

}
