module fx.controls.listbox;
import fx.win32;
import fx.control;
import std.string;
private{
import fx.event, fx.fxdef;
alias std.string.toStringz toz;
}

///
class ListBox : Control
{
	static enum
	{
LBS_NOTIFY       =0x0001L,///
LBS_SORT         =0x0002L,///
LBS_NOREDRAW     =0x0004L,///
LBS_MULTIPLESEL  =0x0008L,///
LBS_OWNERDRAWFIXED   = 0x0010L,///
LBS_OWNERDRAWVARIABLE =0x0020L,///
LBS_HASSTRINGS   =0x0040L,///
LBS_USETABSTOPS  =0x0080L,///
LBS_NOINTEGRALHEIGHT  =0x0100L,///
LBS_MULTICOLUMN  =0x0200L,///
LBS_WANTKEYBOARDINPUT =0x0400L,///
LBS_EXTENDEDSEL  =0x0800L,///
LBS_DISABLENOSCROLL   =0x1000L,///
LBS_NODATA       =0x2000L,///
LBS_NOSEL        =0x4000L,///
LBS_COMBOBOX     =0x8000L,///
LBS_STANDARD          =(LBS_NOTIFY | LBS_SORT | WS_VSCROLL | WS_BORDER),///

LBN_ERRSPACE     =   (-2),
LBN_SELCHANGE   =    1,
LBN_DBLCLK         = 2,
LBN_SELCANCEL    =   3,
LBN_SETFOCUS    =    4,
LBN_KILLFOCUS   =    5
	}
	static enum
	{
LB_ADDSTRING       =0x0180,
LB_INSERTSTRING    =0x0181,
LB_DELETESTRING    =0x0182,
LB_SELITEMRANGEEX  =0x0183,
LB_RESETCONTENT    =0x0184,
LB_SETSEL          =0x0185,
LB_SETCURSEL       =0x0186,
LB_GETSEL          =0x0187,
LB_GETCURSEL       =0x0188,
LB_GETTEXT         =0x0189,
LB_GETTEXTLEN      =0x018A,
LB_GETCOUNT        =0x018B,
LB_SELECTSTRING    =0x018C,
LB_DIR             =0x018D,
LB_GETTOPINDEX     =0x018E,
LB_FINDSTRING      =0x018F,
LB_GETSELCOUNT     =0x0190,
LB_GETSELITEMS     =0x0191,
LB_SETTABSTOPS     =0x0192,
LB_GETHORIZONTALEXTENT  =0x0193,
LB_SETHORIZONTALEXTENT  =0x0194,
LB_SETCOLUMNWIDTH  =0x0195,
LB_ADDFILE         =0x0196,
LB_SETTOPINDEX     =0x0197,
LB_GETITEMRECT     =0x0198,
LB_GETITEMDATA     =0x0199,
LB_SETITEMDATA     =0x019A,
LB_SELITEMRANGE    =0x019B,
LB_SETANCHORINDEX  =0x019C,
LB_GETANCHORINDEX  =0x019D,
LB_SETCARETINDEX   =0x019E,
LB_GETCARETINDEX   =0x019F,
LB_SETITEMHEIGHT   =0x01A0,
LB_GETITEMHEIGHT   =0x01A1,
LB_FINDSTRINGEXACT =0x01A2,
LB_SETLOCALE       =0x01A5,
LB_GETLOCALE       =0x01A6,
LB_SETCOUNT        =0x01A7,
LB_INITSTORAGE     =0x01A8,
LB_ITEMFROMPOINT   =0x01A9,
LB_MULTIPLEADDSTRING    =0x01B1
	}

	public this(Control par,int x,int y,int w,int h,int style=LBS_STANDARD|LBS_HASSTRINGS,int exst=0)///
	{
		super(par,"LISTBOX",x,y,w,h,style,exst);
		OnSelChange=new OnSelChangeEH();
		par.OnCommand~=&OnCl;
	}

	static alias EventHandler!(void) OnSelChangeEH;
	OnSelChangeEH OnSelChange;///

	private bool OnCl(Object sender,uint wParam, int lParam)
	{
		if(HIWORD(wParam)!=LBN_SELCHANGE) return false;

		OnSelChange(this);
		return false;
	}

	void Add(string text)///
	{SendMessageA(handle,LB_ADDSTRING,0,cast(int) toz(text));}
	void Add(wstring text)///ditto
	{SendMessageW(handle,LB_ADDSTRING,0,cast(int) cast(wchar*)text);}

	override void Clear()///
	{SendMessageA(handle,LB_RESETCONTENT,0,0);}

	void Insert(int i,string t)///
	{SendMessageA(handle,LB_INSERTSTRING,i,cast(int) toz(t));}
	void Insert(int i,wstring t)///ditto
	{SendMessageW(handle,LB_INSERTSTRING,i,cast(int) cast(wchar*)(t));}

	void Remove(int i)///
	{SendMessageA(handle,LB_DELETESTRING,i,0);}
	int selectedIndex()///
	{return SendMessageA(handle,LB_GETCURSEL,0,0);}
	void selectedIndex(int i)///ditto
	{SendMessageA(handle,LB_SETCURSEL,i,0); OnCl(this,MAKEWPARAM(LBN_SELCHANGE,0),0);}
	int selectionCount()///
	{return SendMessageA(handle,LB_GETSELCOUNT,0,0);}
}
