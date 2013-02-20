module fx.controls.combobox;
import fx.win32;
import fx.control;
import std.string;
private{
import fx.event,std.conv, fx.fxdef, std.utf, fx.string;
alias std.string.toStringz toz;
}

/******************************************************************************************************************
	ComboBox
*******************************************************************************************************************/
class ComboBox : Control
{
	static enum
	{
/*
 * Combo Box return Values
 */
CB_OKAY            = 0
,CB_ERR           =   (-1)
,CB_ERRSPACE   =      (-2)

/*
 * Combo Box Notification Codes
 */
,CBN_ERRSPACE     =   (-1)
,CBN_SELCHANGE   =    1
,CBN_DBLCLK        =  2
,CBN_SETFOCUS    =    3
,CBN_KILLFOCUS    =   4
,CBN_EDITCHANGE  =    5
,CBN_EDITUPDATE  =    6
,CBN_DROPDOWN    =    7
,CBN_CLOSEUP       =  8
,CBN_SELENDOK     =   9
,CBN_SELENDCANCEL  =  10

/*
 * Combo Box styles
 */
,CBS_SIMPLE        =    0x0001L///
,CBS_DROPDOWN    =      0x0002L///
,CBS_DROPDOWNLIST   =   0x0003L///
,CBS_OWNERDRAWFIXED  =  0x0010L///
,CBS_OWNERDRAWVARIABLE= 0x0020L///
,CBS_AUTOHSCROLL   =    0x0040L///
,CBS_OEMCONVERT   =     0x0080L///
,CBS_SORT            =  0x0100L///
,CBS_HASSTRINGS     =   0x0200L///
,CBS_NOINTEGRALHEIGHT = 0x0400L///
,CBS_DISABLENOSCROLL  = 0x0800L///
,CBS_UPPERCASE     =    0x2000L///
,CBS_LOWERCASE     =    0x4000L///

/*
 * Combo Box messages
 */
,CB_GETEDITSEL       =        0x0140
,CB_LIMITTEXT          =      0x0141
,CB_SETEDITSEL         =      0x0142
,CB_ADDSTRING          =      0x0143
,CB_DELETESTRING      =       0x0144
,CB_DIR                 =     0x0145
,CB_GETCOUNT         =        0x0146
,CB_GETCURSEL          =      0x0147
,CB_GETLBTEXT            =    0x0148
,CB_GETLBTEXTLEN       =      0x0149
,CB_INSERTSTRING        =     0x014A
,CB_RESETCONTENT       =      0x014B
,CB_FINDSTRING             =  0x014C
,CB_SELECTSTRING      =       0x014D
,CB_SETCURSEL           =     0x014E
,CB_SHOWDROPDOWN   =          0x014F
,CB_GETITEMDATA        =      0x0150
,CB_SETITEMDATA        =      0x0151
,CB_GETDROPPEDCONTROLRECT=    0x0152
,CB_SETITEMHEIGHT     =       0x0153
,CB_GETITEMHEIGHT     =       0x0154
,CB_SETEXTENDEDUI      =      0x0155
,CB_GETEXTENDEDUI      =      0x0156
,CB_GETDROPPEDSTATE   =       0x0157
,CB_FINDSTRINGEXACT     =     0x0158
,CB_SETLOCALE           =     0x0159
,CB_GETLOCALE            =    0x015A
,CB_GETTOPINDEX         =     0x015b
,CB_SETTOPINDEX         =     0x015c
,CB_GETHORIZONTALEXTENT =     0x015d
,CB_SETHORIZONTALEXTENT   =   0x015e
,CB_GETDROPPEDWIDTH  =        0x015f
,CB_SETDROPPEDWIDTH   =       0x0160
,CB_INITSTORAGE          =    0x0161
,CB_MULTIPLEADDSTRING  =      0x0163
	}

	///
	public this(Control par,int x,int y,int w,int h,int style=CBS_HASSTRINGS | CBS_DROPDOWN,int exst=0)	{
		super(par,"COMBOBOX",x,y,w,h,style,exst);
		OnSelChange=new EventHandler!(void)();
		par.AddEvent(WM_COMMAND,&OnCmd);
	}

	EventHandler!(void) OnSelChange;///

	private int OnCmd(WindowEvent e)
	{
		if(LOWORD(e.wParam)!=Id || HIWORD(e.wParam)!=CBN_SELCHANGE) return 0;
		OnSelChange(this);
		return 0;
	}

	void Add(string t) ///
	{SendMessageA(handle,CB_ADDSTRING,0,cast(int) toz(t));}
	void Add(wstring t) ///ditto
	{if(String.EndsWith(t,"\0"w)) t~="\0"w; SendMessageW(handle,CB_ADDSTRING,0,cast(int) cast(wchar*)(t));}

	override void Clear() ///
	{SendMessageA(handle,CB_RESETCONTENT,0,0);}

	void Insert(int i,string t)///
	{SendMessageA(handle,CB_INSERTSTRING,i,cast(int) toz(t));}
	void Insert(int i,wstring t)///ditto
	{if(String.EndsWith(t,"\0"w)) t~="\0"w; SendMessageW(handle,CB_INSERTSTRING,i,cast(int) cast(wchar*)(t));}

	void Remove(int i) ///
	{SendMessageA(handle,CB_DELETESTRING,i,0);}
	int selectedIndex() ///
	{return SendMessageA(handle,CB_GETCURSEL,0,0);}
	void selectedIndex(int i) ///ditto
	{
		SendMessageA(handle,CB_SETCURSEL,i,0);
		OnSelChange(this);
		//SendMessageA(handle,WM_COMMAND,MAKEWPARAM(cast(ushort)Id(),CBN_SELCHANGE),0);
	}
}
