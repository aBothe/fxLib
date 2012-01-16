import core.memory;

import fx.fxdef;
import fx.win32;
import fx.event, std.utf, std.c.string, fx.string;

alias std.string.toStringz toz;

private
{
	int g_ctrlclassid=0;
}


//pragma(lib,"uxtheme.lib");

private extern(Windows) int mDoEvents(HWND h,uint msg,uint wp,int lp)
{
	return DefWindowProcA(h,msg,wp,lp);
}

static this()
{
	WNDCLASSA wc;
	char * cn=cast(char*)"mRawClass";

	wc.lpszClassName = cn;
	wc.style = CS_OWNDC;
	wc.lpfnWndProc =&mDoEvents;
	wc.hInstance = GetModuleHandleA(null);
	wc.cbClsExtra = wc.cbWndExtra = 0;
	wc.hbrBackground =CreateSolidBrush(0xFFFFFF);
	wc.hCursor = LoadCursorA(null, IDC_ARROW);
	RegisterClassA(&wc);
}

/******************************************************************************************************************
	Common control class on which all other controls base
*******************************************************************************************************************/
class Control
{
	private static int ctrlid=1000;
	public:
		HANDLE handle; ///internal control handle
		int Tag;///Instance specific tag
	public:
		/**Creates new control
		* Params:
		* parent = parent window, cannot be null
		* cls = class name
		* x = distance to left window border
		* y = distance to top window border
		* width = control width
		* height = control height
		* style = control style, e.g. WS_BORDER
		* exst = extended window style
		*/
		this(Control parent, string cls,int x,int y,int w,int h,int style=WS_BORDER,int exstyle=0)
		{	Create(parent, cls, x,y,w,h,style,exstyle);	}

		///ditto
		this(Control parent, char* cls,int x,int y,int w,int h,int style=WS_BORDER,int exstyle=0)
		{	Create(parent, cast(string) cls[0 .. strlen(cls)], x,y,w,h,style,exstyle);	}

		///ditto
		this()
		{
			mInit();
		}

		package WindowEventArray evs;

		void Font(HFONT f) ///Control font
		{
			SendMessageA(handle,WM_SETFONT,cast(uint)f,true);
		}
		HFONT Font() ///ditto
		{
			return	cast(HANDLE)	SendMessageA(handle,WM_GETFONT,0,0);
		}
	
	void EnableExplorerTheme()///
	{
		auto uxtheme=new Module("uxtheme.dll");	
		
		int function(          HWND hwnd,    LPCSTR pszSubAppName,    LPCSTR pszSubIdList) SetWinTheme=null;
		
		uxtheme.GetSymbol(SetWinTheme,"SetWindowTheme");
	
		if(SetWinTheme!=null)
			SetWinTheme(handle,    cast(char*)"Explorer",    null);
		
		uxtheme.Unload();
	}
	
		static enum
		{
			CCS_TOP                 =0x00000001L,///
			CCS_NOMOVEY             =0x00000002L,///
			CCS_BOTTOM              =0x00000003L,///
			CCS_NORESIZE            =0x00000004L,///
			CCS_NOPARENTALIGN       =0x00000008L,///
			CCS_ADJUSTABLE          =0x00000020L,///
			CCS_NODIVIDER           =0x00000040L,///
			CCS_VERT                =0x00000080L,///
			CCS_LEFT                =(CCS_VERT | CCS_TOP),///
			CCS_RIGHT               =(CCS_VERT | CCS_BOTTOM),///
			CCS_NOMOVEX             =(CCS_VERT | CCS_NOMOVEY),///

			WS_EX_DLGMODALFRAME    =0x00000001L,///
			WS_EX_NOPARENTNOTIFY   =0x00000004L,///
			WS_EX_TOPMOST          =0x00000008L,///
			WS_EX_ACCEPTFILES      =0x00000010L,///
			WS_EX_TRANSPARENT      =0x00000020L,///
			WS_EX_MDICHILD         =0x00000040L,///
			WS_EX_TOOLWINDOW       =0x00000080L,///
			WS_EX_WINDOWEDGE       =0x00000100L,///
			WS_EX_CLIENTEDGE       =0x00000200L,///
			WS_EX_CONTEXTHELP      =0x00000400L,///
			WS_EX_RIGHT            =0x00001000L,///
			WS_EX_LEFT             =0x00000000L,///
			WS_EX_RTLREADING       =0x00002000L,///
			WS_EX_LTRREADING       =0x00000000L,///
			WS_EX_LEFTSCROLLBAR    =0x00004000L,///
			WS_EX_RIGHTSCROLLBAR   =0x00000000L,///
			WS_EX_CONTROLPARENT    =0x00010000L,///
			WS_EX_STATICEDGE       =0x00020000L,///
			WS_EX_APPWINDOW        =0x00040000L,///
			WS_EX_OVERLAPPEDWINDOW =(WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE),///
			WS_EX_PALETTEWINDOW    =(WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST),///
			WS_EX_LAYERED          =0x00080000,///
			WS_EX_NOINHERITLAYOUT  =0x00100000L, /// Disable inheritence of mirroring by children
			WS_EX_LAYOUTRTL        =0x00400000L,/// Right to left mirroring
			WS_EX_COMPOSITED       =0x02000000L,///
			WS_EX_NOACTIVATE       =0x08000000L///

			/*
			 * SetWindowPos Flags
			 */
			,SWP_NOSIZE         =0x0001
			,SWP_NOMOVE         =0x0002
			,SWP_NOZORDER       =0x0004
			,SWP_NOREDRAW       =0x0008
			,SWP_NOACTIVATE     =0x0010
			,SWP_FRAMECHANGED   =0x0020  /* The frame changed: send WM_NCCALCSIZE */
			,SWP_SHOWWINDOW     =0x0040
			,SWP_HIDEWINDOW     =0x0080
			,SWP_NOCOPYBITS     =0x0100
			,SWP_NOOWNERZORDER  =0x0200  /* Don't do owner Z ordering */
			,SWP_NOSENDCHANGING =0x0400  /* Don't send WM_WINDOWPOSCHANGING */

			,SWP_DRAWFRAME       =SWP_FRAMECHANGED
			,SWP_NOREPOSITION    =SWP_NOOWNERZORDER

			,SWP_DEFERERASE     =0x2000
			,SWP_ASYNCWINDOWPOS =0x4000

			,HWND_TOP       = 0
			,HWND_BOTTOM     =1
			,HWND_TOPMOST    =-1
			,HWND_NOTOPMOST  =-2

			,WM_SETHOTKEY                    =0x0032,
			WM_GETHOTKEY                    =0x0033,
			WM_ACTION                       =0x1111,
			WM_DROPFILES                    =0x0233,
		}

		/** Redraw window
		* Params:
		* children = also redraw children
		*/
		void Redraw(bool children=false)
		{
			RedrawWindow(  handle,null,null,RDW_INVALIDATE+RDW_ERASE+RDW_INTERNALPAINT+(children?RDW_ALLCHILDREN:0)  );
		}

		int Id() ///Control ID
		{
			return GetWindowLongA(handle,GWL_ID);
		}

		int Id(int newid) ///ditto
		{
			return SetWindowLongA(handle,GWL_ID,newid);
		}

		Point Position() ///Window Position
		{
			scope RECT r;
			GetWindowRect(handle,&r);
			Point ret=Point(r.left,r.top);
			return ret;
		}

		void Position(Point npos) ///ditto
		{
			SetWindowPos(handle,cast(HWND)HWND_TOP,npos.x,npos.y,0,0,SWP_NOSIZE + SWP_NOACTIVATE);
		}

		/**
		* Add Event listener which gets fired by a window event
		* Params:
		* msg = window Message to handle
		* evth = callback delegate of type EVTPROC
		* Example:
		* ---
		* int foo(WindowEvent e)
		* {
		* 	// Do something here
		*	return 0;
		* }
		* control.AddEvent(WM_COMMAND,&foo);
		* ---
		*/
		final void AddEvent(int msg,EVTPROC evth)
		{
			evs.Add(msg,evth);
		}

		int CallEvent(WindowEvent event) ///Fires a native window event
		{
			return evs.Call(event);
		}

		bool HasEvent(int msg) ///Checks if control handles this event message
		{
			return evs.HasEvent(msg);
		}

		Point Size()///Entire window size
		{
			scope RECT r;
			GetClientRect(handle,&r);
			Point ret=Point(r.right,r.bottom);
			return ret;
		}

		void Size(Point s) ///ditto
		{
			SetWindowPos(handle,cast(HWND)HWND_TOP,0,0,s.x,s.y,SWP_NOMOVE + SWP_NOACTIVATE);
		}

		Point ClientSize() ///window-inner Client size
		{
			scope RECT r;
			GetClientRect(handle,&r);
			Point ret=Point(r.right-r.left,r.bottom-r.top);
			return ret;
		}

		void Update() ///Update Window
		{
			UpdateWindow(handle);
		}
		void Enabled(bool e) ///Enabled status
		{
			EnableWindow(handle,e);
		}
		bool Enabled() ///ditto
		{
			return IsWindowEnabled(handle);
		}

		void IsVisible(bool v)///Window visibility
		{
			if (v) Show();
			else Hide();
		}
		bool IsVisible()///ditto
		{
			return IsWindowVisible(handle);
		}
		void ToggleVisibility()///ditto
		{
			IsVisible=!IsVisible;
		}

		private void mInit()
		{
			evs=new WindowEventArray();

			OnResize=new OnSizeEH();
			OnActivate=new OnActivateEH();
			OnKeyDown=new OnKeyDownEH();
			OnKeyUp=new OnKeyDownEH();
			OnClose=new OnCloseEH();
			OnFocus=new OnFocusEH();
			OnCommand=new OnCommandEH();
			OnMove=new OnMoveEH();
			OnDropFiles=new OnDropEH();

			OnLButtonUp=new OnMoveEH();
			OnLButtonDown=new OnMoveEH();
			OnHotKey=new OnHotKeyEH();
			OnMouseMove=new OnMouseMoveEH();
			OnLeftButtonDblClick=new OnLeftButtonDblClickEH();

			OnPaint=new OnPaintEH();

			AddEvent(WM_SIZE,&_onsz);
			AddEvent(WM_ACTIVATE,&_onact);
			AddEvent(WM_CHAR,&_onkey);
			AddEvent(WM_KEYUP,&_onkeyup);
			AddEvent(WM_CLOSE,&_onclose);
			AddEvent(WM_SETFOCUS,&_onfocus);
			AddEvent(WM_COMMAND,&_oncmd);
			AddEvent(WM_MOVE,&_onmove);
			AddEvent(WM_DROPFILES,&_ondnd);
			AddEvent(WM_MOUSEMOVE,&_onmousemove);


			AddEvent(WM_LBUTTONUP,&_onlbuttup);
			AddEvent(WM_HOTKEY,&_onhotkey);
			AddEvent(WM_LBUTTONDOWN,&_onlbuttdown);
			AddEvent(WM_LBUTTONDBLCLK,&_onlbuttdblclk);

			AddEvent(WM_PAINT,&_onpaint);
		}

		//this(HWND h) {handle=h;UpdateWindow(handle);mInit();}

		final void Hide() ///Hide control
		{
			ShowWindow(handle,SW_HIDE);
		}

		final void Show()///Show control
		{
			ShowWindow(handle,SW_SHOWNORMAL);
		}

		/**Show control
		*Params:
		*show= kind of showing control, e.g. SW_SHOW
		*/
		final void Show(int show)
		{
			ShowWindow(handle,show);
		}

		final int Close()///
		{
			return SendMessageA(handle,WM_CLOSE,0,0);
		}

		final void Destroy()///
		{
			DestroyWindow(handle);
		}

		void ParentHandle(HWND h)///Parent handle
		{
			SetParent(handle,h);
			UpdateWindow(handle);
		}
		HWND ParentHandle()///ditto
		{
			return GetParent(handle);
		}

		protected:
		void Create(Control parent, string classname, int x,int y,int w,int h,int st=0,int exst=0)
		{
			mInit();
			ctrlid++;
			handle=CreateWindowExA(exst,toz(classname)," ",st|WS_CHILD|WS_VISIBLE,x,y,w,h, parent.handle ,cast(HANDLE) ctrlid,null,cast(void*) this);
			Font=GetStockObject(12);

			SetPropA(handle,cast(char*) "ctrl_inst",cast(HANDLE) this);
			origproc=cast(WNDPROC) cast(long*) SetWindowLongA(handle,GWL_WNDPROC,cast(int) cast(long*)&CtrlEvents);
		}

		public:
		string text()///Control text
		{
			int len=GetWindowTextLengthA(handle)+1;
			scope char* buffer= (new char[len]).ptr;
			GetWindowTextA(handle, buffer,len);
			return String.Remove(cast(string)buffer[0 .. len],"\0");
		}

		wstring Text()///ditto
		{
			wchar[] buffer= new wchar[GetWindowTextLengthW(handle)+1];
			GetWindowTextW(handle, buffer.ptr,GetWindowTextLengthW(handle)+1);
			if (String.EndsWith(buffer,"\0")) buffer.length=buffer.length-1;
			return cast(wstring)(buffer);
		}

		void Text(string t) ///ditto
		{
			SendMessageA(handle, WM_SETTEXT, cast(WPARAM) 0, cast(LPARAM) toz(t));
		}

		void Text(wstring t) ///ditto
		{
			if(String.EndsWith(t,"\0"w)) t~="\0"w;
			SendMessageW(handle, WM_SETTEXT, cast(WPARAM) 0, cast(LPARAM) cast(wchar*)t.ptr);
		}

		void AppendText(string s)	{	this.Text=this.text~s;	}/// Append s to current control caption
		void AppendText(wstring s)	{	this.Text=this.Text~s;	}///ditto
		void Clear()///Reset control text
		{
			this.Text=""w;
		}


		~this()
		{
			DestroyWindow(handle);
		}

		/**Set window text
		*Example:
		* ---
		*control("New window caption"c); // the same as control.text="..."c;
		* ---
		*/
		void opCall(S)(S t)		{Text(t);}

		void Focus() ///Put input focus on control
		{
			SetFocus(handle);
		}

		bool isFocused() ///ditto
		{
			return GetFocus()==handle;
		}

		int Style() ///Control style
		{
			return GetWindowLongA(handle,GWL_STYLE);
		}
		int Style(int st)///ditto
		{
			return SetWindowLongA(handle,GWL_STYLE,st);
		}

	private:
		WNDPROC origproc;
public:
		static alias EventHandler!(void,uint/* SizeType*/,Point/* Where*/) OnSizeEH;
		static alias EventHandler!(void) OnActivateEH;
		static alias EventHandler!(bool,uint/* Key*/) OnKeyDownEH;
		static alias EventHandler!(bool) OnCloseEH;
		static alias EventHandler!(void) OnFocusEH;
		static alias EventHandler!(bool,uint/* wParam*/,int/* lParam*/) OnCommandEH;
		static alias EventHandler!(void,Point) OnMoveEH;
		static alias EventHandler!(void,uint,Point) OnMouseMoveEH;
		static alias EventHandler!(void,Point,wstring[]/* Files*/) OnDropEH;

		static alias EventHandler!(void) OnLeftButtonDblClickEH;
		static alias EventHandler!(void,bool/* isWinHotKey*/,ushort/* modifier*/, ushort/* key*/) OnHotKeyEH;

		static alias EventHandler!(void,HDC/* dc*/) OnPaintEH;

	
		OnSizeEH OnResize; ///
		OnActivateEH OnActivate;///
		OnKeyDownEH OnKeyDown///
		,OnKeyUp;///
		OnCloseEH OnClose;///
		OnFocusEH OnFocus;///
		OnCommandEH OnCommand;///
		OnMoveEH OnMove;///
		OnDropEH OnDropFiles;///

		OnMoveEH OnLButtonUp///
		,OnLButtonDown;///
		OnHotKeyEH OnHotKey;///
		OnMouseMoveEH	OnMouseMove;///
		OnLeftButtonDblClickEH OnLeftButtonDblClick;///

		OnPaintEH OnPaint;///
	private:

		private int _onsz(WindowEvent e)
		{
			scope Point p;
			p.x=LOWORD(e.lParam);
			p.y=HIWORD(e.lParam);
			OnResize(this,e.wParam,p);
			return 0;
		}

		private int _onact(WindowEvent e)
		{
			OnActivate(this);
			return 0;
		}

		private int _onfocus(WindowEvent e)
		{
			OnFocus(this);
			return 0;
		}

		private int _onkey(WindowEvent e)
		{
			return cast(int)OnKeyDown(this,e.wParam);
		}

		private int _onkeyup(WindowEvent e)
		{
			return cast(int)OnKeyUp(this,e.wParam);
		}

		private int _onclose(WindowEvent e)
		{
			return cast(int)OnClose(this);
		}

		private int _oncmd(WindowEvent e)
		{
			return cast(int)OnCommand(this,e.wParam,e.lParam);
		}

		private int _onmove(WindowEvent e)
		{
			scope Point p;
			p.x=LOWORD(e.lParam);
			p.y=HIWORD(e.lParam);
			OnMove(this,p);
			return 0;
		}

		private int _ondnd(WindowEvent e)
		{
			scope HANDLE droph=cast(HANDLE)e.wParam;
			uint fcount=DragQueryFileW(droph,0xFFFFFFFF,null,0);

			scope wstring[] files;
			files.length=fcount;
			scope wchar[512] buf;
			uint bsz;

			scope POINT p;
			DragQueryPoint(droph,&p);
			scope Point tp=Point(p.x, p.y);

			for(uint i; i<fcount; i++)
			{
				bsz=DragQueryFileW(droph,i,null,0)+1; // Request filename buffer size including final \0
				DragQueryFileW(droph,i,buf.ptr,bsz);
				files[i]=cast(wstring)buf[0 .. bsz].idup;
			}
			OnDropFiles(this,tp, files);
			DragFinish(droph);
			return 0;
		}

		private int _onmousemove(WindowEvent e)
		{
			scope Point p;
			p.x=LOWORD(e.lParam);
			p.y=HIWORD(e.lParam);
			OnMouseMove(this,e.wParam,p);
			return 0;
		}

		private int _onlbuttup(WindowEvent e)
		{
			scope Point p;
			p.x=LOWORD(e.lParam);
			p.y=HIWORD(e.lParam);
			OnLButtonUp(this,p);
			return 0;
		}

		private int _onhotkey(WindowEvent e)
		{
			OnHotKey(this,e.wParam==IDHOT_SNAPWINDOW,LOWORD(e.lParam),HIWORD(e.lParam));
			return 0;
		}

		private int _onlbuttdown(WindowEvent e)
		{
			scope Point p;
			p.x=LOWORD(e.lParam);
			p.y=HIWORD(e.lParam);
			OnLButtonDown(this,p);
			return 0;
		}

		private int _onlbuttdblclk(WindowEvent e)
		{
			OnLeftButtonDblClick(this);
			return 0;
		}

		private int _onpaint(WindowEvent e)
		{
			if(OnPaint.length<1) return 0;
			scope PAINTSTRUCT ps;
			HDC h=BeginPaint(handle,&ps);
				OnPaint(this,h);
			EndPaint(handle,&ps);
			return 0;
		}
}

/***************************************************************************************************
	Messagehandling
****************************************************************************************************/
protected:
private WindowEvent wev;
extern(Windows) int CtrlEvents(HWND h,uint msg,uint wp,int lp)
{
	if(!wev) wev=new WindowEvent(msg);
	Control    w = cast(Control) GetPropA(h,cast(char*) "ctrl_inst");
	int ret=0;
	try
	{
		if (w)
		{
			if (w.evs.HasEvent(msg))
			{
				wev(h,msg,wp,lp);
				if(ret==0)
					ret=w.evs.Call(wev);
				else
					w.evs.Call(wev);
			}
		}
	}
	catch {}
	if (ret==0) ret=	CallWindowProcA(w.origproc,h,msg,wp,lp);
	return ret;
}

