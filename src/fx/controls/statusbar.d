import fx.fxdef;
import fx.win32;
import fx.control;
import fx.window;
import fx.event;
import std.string;

/******************************************************************************************************************
	StatusBar
*******************************************************************************************************************/
class StatusBar : Control
{
	public:
	static enum{
		SB_SETTEXTA           =(WM_USER+1)
		,SB_SETTEXTW           =(WM_USER+11)
		,SB_GETTEXTA           =(WM_USER+2)
		,SB_GETTEXTW           =(WM_USER+13)
		,SB_GETTEXTLENGTHA     =(WM_USER+3)
		,SB_GETTEXTLENGTHW     =(WM_USER+12)
		,SB_SETPARTS           =(WM_USER+4)
		,SB_GETPARTS           =(WM_USER+6)
		,SB_GETBORDERS         =(WM_USER+7)
		,SB_SETMINHEIGHT       =(WM_USER+8)
		,SB_SIMPLE             =(WM_USER+9)
		,SB_GETRECT            =(WM_USER+10)
		,SB_ISSIMPLE           =(WM_USER+14)
		,SB_SETICON            =(WM_USER+15)
		,SB_SETTIPTEXTA        =(WM_USER+16)
		,SB_SETTIPTEXTW        =(WM_USER+17)
		,SB_GETTIPTEXTA        =(WM_USER+18)
		,SB_GETTIPTEXTW        =(WM_USER+19)
		,SB_GETICON            =(WM_USER+20)

		,SBT_OWNERDRAW       =     0x1000
		,SBT_NOBORDERS         =   0x0100
		,SBT_POPOUT              = 0x0200
		,SBT_RTLREADING         =  0x0400
		,SBT_NOTABPARSING     =    0x0800

		,SBARS_SIZEGRIP          =0x0100
		,SBARS_TOOLTIPS          =0x0800
	}

	this(Control par, int st=SBARS_SIZEGRIP, int exst=0) {
		super(par,"msctls_statusbar32",0,0,0,0,st,exst);
		//SendMessageA(handle,SB_SIMPLE,1,0);
		par.OnResize~=&OnSz;
	}

	private void OnSz(Object sender,uint szT,Point sz)
	{
		Size=Point(sz.x,0);
	}

	void parts(uint[] ps)	{	SendMessageA(handle,SB_SETPARTS,ps.length,cast(int)ps.ptr);	}

	void Text(ushort i,wstring t)
	{
		SendMessageA(handle,SB_SETTEXTW,i+0,cast(int)t.ptr);
	}
}