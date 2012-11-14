module fx.controls.button;
import fx.fxdef;
import fx.win32;
import fx.control;
import fx.window;
import fx.event;

import std.string;

/******************************************************************************************************************
	Button cotrol
*******************************************************************************************************************/
class Button : Control
{
	public :
	static enum
	{
	BS_PUSHBUTTON =       0x00000000,///
	BS_DEFPUSHBUTTON =    0x00000001,///
	BS_CHECKBOX =         0x00000002,///
	BS_AUTOCHECKBOX =     0x00000003,///
	BS_RADIOBUTTON =      0x00000004,///
	BS_3STATE =           0x00000005,///
	BS_AUTO3STATE =       0x00000006,///
	BS_GROUPBOX =         0x00000007,///
	BS_USERBUTTON =       0x00000008,///
	BS_AUTORADIOBUTTON =  0x00000009,///
	BS_OWNERDRAW =        0x0000000B,///
	BS_LEFTTEXT =         0x00000020,///
	BS_TEXT =             0x00000000,///
	BS_ICON =             0x00000040,///
	BS_BITMAP =           0x00000080,///
	BS_LEFT =             0x00000100,///
	BS_RIGHT =            0x00000200,///
	BS_CENTER =           0x00000300,///
	BS_TOP =              0x00000400,///
	BS_BOTTOM =           0x00000800,///
	BS_VCENTER =          0x00000C00,///
	BS_PUSHLIKE =         0x00001000,///
	BS_MULTILINE =        0x00002000,///
	BS_NOTIFY =           0x00004000,///
	BS_FLAT =             0x00008000,///
	BS_RIGHTBUTTON =      BS_LEFTTEXT///

	/*
	 * User Button Notification Codes
	 */
	,BN_CLICKED    =      0
	,BN_PAINT       =     1
	,BN_HILITE      =     2
	,BN_UNHILITE   =      3
	,BN_DISABLE     =     4
	,BN_DOUBLECLICKED  =  5
	,BN_PUSHED      =     BN_HILITE
	,BN_UNPUSHED   =      BN_UNHILITE
	,BN_DBLCLK        =   BN_DOUBLECLICKED
	,BN_SETFOCUS   =      6
	,BN_KILLFOCUS   =     7

	/*
	 * Button Control Messages
	 */
	,BM_GETCHECK    =    0x00F0
	,BM_SETCHECK   =     0x00F1
	,BM_GETSTATE   =     0x00F2
	,BM_SETSTATE   =     0x00F3
	,BM_SETSTYLE   =     0x00F4
	,BM_CLICK         =  0x00F5
	,BM_GETIMAGE     =   0x00F6
	,BM_SETIMAGE      =  0x00F7
	,BM_SETDONTCLICK =   0x00F8

	,BST_UNCHECKED  =    0x0000
	,BST_CHECKED      =  0x0001
	,BST_INDETERMINATE = 0x0002
	,BST_PUSHED     =    0x0004
	,BST_FOCUS      =    0x0008
	}

	static alias EventHandler!(void) OnClickEH;
	OnClickEH OnClick///
	, OnDblClick;///

	private int OnCl(WindowEvent e)
	{
		if(LOWORD(e.wParam)!=Id) return 0;

		if(HIWORD(e.wParam)==BN_CLICKED)
			OnClick(this);

		if(HIWORD(e.wParam)==BN_DBLCLK)
			OnDblClick(this);

		return 0;
	}

	///
	this(Control par, int x,int y,int w,int h, int st=0, int exst=0) {
		this(par,"",x,y,w,h,st,exst);
	}

	///ditto
	this(Control par,wstring caption, int x,int y,int w,int h, int st=0, int exst=0) {
		super(par,"BUTTON",x,y,w,h,st,exst);
		OnClick=new OnClickEH();
		OnDblClick=new OnClickEH();
		par.AddEvent(WM_COMMAND,&OnCl);
		Text=caption;
	}

	bool isChecked()///
	{ return SendMessageA(handle,BM_GETCHECK,0,0) == BST_CHECKED;}
	void isChecked(bool v)///ditto
	{SendMessageA(handle,BM_SETCHECK,v?BST_CHECKED:BST_UNCHECKED,0);}
	void icon(HICON ico)///
	{ SendMessageA(handle,BM_SETIMAGE,1,cast(int)ico);} // 1==IMAGE_ICON; 0==IMAGE_BITMAP
	HICON icon()///ditto
	{ return cast(HICON)SendMessageA(handle,BM_GETIMAGE,1,0);}
}
