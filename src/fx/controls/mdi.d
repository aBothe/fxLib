module fx.controls.mdi;

import fx.win32;
import fx.control;
import fx.window;
import fx.event;
import fx.application;
import std.string;
import std.c.windows.windows;

private{
	alias std.conv.to!string tost;
	alias std.string.toStringz toz;
	void MB(char* t) {MessageBoxA(null,t," ",MB_OK);}
	void MB(const char[] t) {MessageBoxA(null,toz(t)," ",MB_OK);}
	WORD HIWORD(int l) { return cast(WORD)((l >> 16) & 0xFFFF); }
	WORD LOWORD(int l) { return cast(WORD)l; }
}

class MDIWindow : Window
{
public:
	int toppadding=0,bottompadding=0;
private:
	
	int first_id;
	
	int m_onSize(WindowEvent e)
		
	{
		auto cs = ClientSize;
		try{MoveWindow(mdiClient.handle,0,toppadding,cs.x,cs.y-toppadding-bottompadding,true);}catch{}
		
		return 0;
		
	}
	
	int m_onCmd(WindowEvent e)
		
	{
		
		if(LOWORD(e.wParam) >= first_id)DefFrameProcA(handle, mdiClient.handle, e.message, e.wParam, e.lParam);
		
		return 0;
		
	}
	
protected:
	
	MDIControl mdiClient;
	
public:

	@property MDIControl MDIPanel()
	{
		return mdiClient;
	}
	
	int firstChild()
		
	{
		
		return first_id;
		
	}
	
	this(string cap,int x,int y,int w,int h,int style=WS_OVERLAPPEDWINDOW|WS_SYSMENU,int exstyle=0,HANDLE WindowMenu=null,HANDLE ChildListMenu=null,int firstChildId=1)
		
	{
		
		super(cap,x,y,w,h,style,exstyle);
		
		first_id=firstChildId;
		
		MenuStrip=WindowMenu;
		
		mdiClient=new MDIControl(this,0,0,0,0,WS_VISIBLE,0,ChildListMenu,first_id);
		
		Application.MDIClient=mdiClient.handle;
		
		super.AddEvent(WM_SIZE,&m_onSize);
		
		super.AddEvent(WM_PAINT,&m_onSize);
		
		super.AddEvent(WM_COMMAND,&m_onCmd);
		
	}
	
	
	
	
	
}



class MDIControl : Control{
	
	
	
public:
	
	this(Window parent,int x,int y,int w,int h,int style=0,int exstyle=0,HANDLE menu=null,int FirstChildId=1)
		
	{
		
		CLIENTCREATESTRUCT ccs;
		
		
		
		// Retrieve the handle to the window menu and assign the
		
		// first child window identifier.
		
		
		
		ccs.hWindowMenu = menu;
		
		ccs.idFirstChild = FirstChildId;
		
		
		
		// Create the MDI client window.
		
		
		
		handle = CreateWindowExA(exstyle,"MDICLIENT",null,
								 
								 WS_CHILD | WS_CLIPCHILDREN | WS_VSCROLL | WS_HSCROLL|style,
								 
								 x, y, w, h, parent.handle, null, null, cast(int*) &ccs);
		
		super(handle);
		
	}
	
	void Cascade(){SendMessageA(handle,WM_MDICASCADE,0,0);}
	
	void TileHorizontal(){SendMessageA(handle,WM_MDITILE,MDITILE_HORIZONTAL,0);}
	
	void TileVertical(){SendMessageA(handle,WM_MDITILE,MDITILE_VERTICAL,0);}
	
	HANDLE activeHandle()
		
	{
		
		return cast(HANDLE)SendMessageA(handle,WM_MDIGETACTIVE,0,0);
		
	}
	
}

struct CLIENTCREATESTRUCT {
	
	HANDLE hWindowMenu;
	
	uint idFirstChild;
	
}

private extern(Windows) int childproc(HWND h,uint msg,uint wp,int lp) nothrow
	
{
	MDIClient    w = null;
	switch (msg)
	{
		case WM_NCCREATE:
			w = cast(MDIClient)(cast(CREATESTRUCTA*) lp).lpCreateParams;
			w.handle=h;
			SetWindowLongA(h, GWL_USERDATA, cast(LONG) cast(void*) w);
			break;
		default:
			w = cast(MDIClient) cast(void*) GetWindowLongA(h, GWL_USERDATA);
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

	return DefMDIChildProcA(h,msg,wp,lp);
	
}

class MDIClient : Window{

	private int idx;
public:
	
	this() {}
	
	this(HANDLE h){handle=h;}
	
	this(MDIControl parent,string cap,int x,int y,int w,int h,int style=0)
		
	{
		super();
		
		WNDCLASSA wc;

		auto cn=cast(char*)("mdiClient");
		wc.lpszClassName = cn;
		wc.style = 0;
		wc.lpfnWndProc =&childproc;
		wc.hInstance = GetModuleHandleA(null);
		wc.hbrBackground = cast(HBRUSH) (1);
		wc.lpszMenuName = null;
		wc.cbClsExtra = wc.cbWndExtra = 0;
		RegisterClassA(&wc);
		
		handle = CreateMDIWindowA(cn, toz(cap),WS_CHILD|style,x,y,w,h, parent.handle, null, cast(LONG) cast(void*) this);
		
		SetWindowLongA(handle, GWL_USERDATA,cast(LONG) cast(void*) this );// 				 cast(LONG) cast(void*) this
		Show(true);
	}
	
}
