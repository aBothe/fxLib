module fx.window;
import fx.fxdef;
import fx.win32;

import fx.control;
import fx.application;
import fx.event;

import std.string, std.conv;
import core.memory;

private
{
	alias std.string.toStringz toz;
	
	struct FLASHWINFO
	{
		uint cbSize;
		HWND hwnd;
		DWORD dwFlags;
		uint uCount;
		DWORD dwTimeout;
	}
	extern(Windows)
	{
		bool FlashWindowEx(FLASHWINFO* pfwi);
	}
	enum
	{
		FLASHW_STOP         =0
		,FLASHW_CAPTION      =0x00000001
		,FLASHW_TRAY         =0x00000002
		,FLASHW_ALL          =(FLASHW_CAPTION | FLASHW_TRAY)
		,FLASHW_TIMER        =0x00000004
		,FLASHW_TIMERNOFG    =0x0000000C
	}
}

/******************************************************************************************************************
 Window class
 *******************************************************************************************************************/
class Window:Control
{
public:
	~this()
	{
		DestroyWindow(handle);
	}
	
	void BringToFront()///
	{
		SetForegroundWindow(handle);
	}
	
	/// Window styles
	static enum
	{
		WS_OVERLAPPED =       0x00000000,///
		WS_POPUP =            0x80000000,///
		WS_CHILD =            0x40000000,///
		WS_MINIMIZE =         0x20000000,///
		WS_VISIBLE =          0x10000000,///
		WS_DISABLED =         0x08000000,///
		WS_CLIPSIBLINGS =     0x04000000,///
		WS_CLIPCHILDREN =     0x02000000,///
		WS_MAXIMIZE =         0x01000000,///
		WS_CAPTION =          0x00C00000,///
		WS_BORDER =           0x00800000,///
		WS_DLGFRAME =         0x00400000,///
		WS_VSCROLL =          0x00200000,///
		WS_HSCROLL =          0x00100000,///
		WS_SYSMENU =          0x00080000,///
		WS_THICKFRAME =       0x00040000,///
		WS_GROUP =            0x00020000,///
		WS_TABSTOP =          0x00010000,///
		WS_MINIMIZEBOX =      0x00020000,///
		WS_MAXIMIZEBOX =      0x00010000,///
		WS_TILED =            WS_OVERLAPPED,///
		WS_ICONIC =           WS_MINIMIZE,///
		WS_SIZEBOX =          WS_THICKFRAME,///
		WS_OVERLAPPEDWINDOW = (WS_OVERLAPPED |            WS_CAPTION |  WS_SYSMENU |  WS_THICKFRAME |            WS_MINIMIZEBOX |                 WS_MAXIMIZEBOX),///
		WS_TILEDWINDOW =      WS_OVERLAPPEDWINDOW,///
		WS_POPUPWINDOW = (WS_POPUP |  WS_BORDER |  WS_SYSMENU),///
		WS_CHILDWINDOW = (WS_CHILD)
	}
	
	void StartFlashing(bool entireWin=false, bool untilFocus=true, uint times=0)///
	{
		FLASHWINFO fi;
		fi.cbSize=fi.sizeof;
		fi.hwnd=handle;
		
		fi.dwFlags=FLASHW_TRAY+(entireWin?FLASHW_CAPTION:0)+( untilFocus?FLASHW_TIMERNOFG:(times<1?FLASHW_TIMER:times) );
		FlashWindowEx(&fi);
	}
	
	void StopFlashing()///
	{
		FLASHWINFO fi;
		fi.cbSize=fi.sizeof;
		fi.hwnd=handle;
		
		fi.dwFlags=FLASHW_STOP;
		FlashWindowEx(&fi);
	}
	
	this() {}
	
	this(HANDLE parent)///
	{
		super();
		
		WNDCLASSA wc;
		char * cn=cast(char*)toz("mywin"c~to!(string)(Application.OpenWins));
		Application.OpenWins++;
		
		wc.lpszClassName = cn;
		wc.style = CS_OWNDC+CS_DBLCLKS;
		wc.lpfnWndProc =&DoEvents;
		wc.hInstance = GetModuleHandleA(null);
		wc.cbClsExtra = wc.cbWndExtra = 0;
		wc.hbrBackground =cast(HBRUSH)COLOR_WINDOW;
		wc.hCursor = LoadCursorA(null, IDC_ARROW);
		RegisterClassA(&wc);
		handle=CreateWindowExA(0,cn,"Window",WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,300,400,parent,null,null,cast(void*) this);
	}
	//this(HWND h) {super(h);}
	///
	this(string cap,int x,int y,int w,int h,int style=WS_OVERLAPPEDWINDOW|WS_SYSMENU,int exst=0,
		 HANDLE Menu=null,HANDLE hIcon=LoadIconA(null, IDI_APPLICATION),
		 HBRUSH Background=cast(HBRUSH)COLOR_WINDOW,
		 HCURSOR Cursor=LoadCursorA(null, IDC_ARROW))
	{
		super();
		WNDCLASSA wc;
		char * cn=cast(char*)toz("mywin"c~to!(string)(Application.OpenWins));
		Application.OpenWins++;
		//wc.cbSize=WNDCLASSEXA.sizeof;
		wc.lpszClassName = cn;
		wc.style = CS_DBLCLKS+CS_OWNDC;
		wc.lpfnWndProc =&DoEvents;
		wc.hInstance = GetModuleHandleA(null);
		wc.hCursor = Cursor;
		wc.hbrBackground = Background;
		wc.lpszMenuName = null;
		wc.hIcon=hIcon;
		wc.cbClsExtra = wc.cbWndExtra = 0;
		RegisterClassA(&wc);
		handle=CreateWindowExA(exst,cn," ",style,x,y,w,h,null,Menu,null,cast(void*) this);
		Text=cap;
	}
	
	HANDLE MenuStrip()///Window menu
	{
		return GetMenu(handle);
	}
	void MenuStrip(HANDLE m)///ditto
	{
		SetMenu(handle,m);
		DrawMenuBar(handle);
		UpdateWindow(handle);
	}
	
	bool IsActive()///
	{
		return GetForegroundWindow()==handle;
	}
}

private static extern(Windows) int DoEvents(HWND h,uint msg,uint wp,int lp) nothrow
{
	Control    w = null;
	switch (msg)
	{
		case WM_NCCREATE:
			w = cast(Control)(cast(CREATESTRUCTA*) lp).lpCreateParams;
			w.handle=h;
			SetWindowLongA(h, GWL_USERDATA, cast(LONG) cast(void*) w);
			break;
		default:
			w = cast(Control) cast(void*) GetWindowLongA(h, GWL_USERDATA);
			break;
	}
	
	int ret=0;
	try
	{
		if (w !is null)
		{
			if (w.HasEvent(msg))
			{
				ret=w.CallEvent(WindowEvent(h,msg,wp,lp));
				if(ret!=0) return ret;
			}
		}
	}
	catch {}
	
	if(msg==WM_CLOSE)
	{
		Application.OpenWins--;
		if(Application.OpenWins<1)
			Application.Quit();
	}
	
	
	return DefWindowProcA(h,msg,wp,lp);
}













class MessageWindow : Window
{
	this()
	{
		super(HWND_MESSAGE);
	}
}
