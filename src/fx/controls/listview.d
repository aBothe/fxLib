module fx.controls.listview;
import fx.win32, fx.event, fx.fxdef, std.conv;
import fx.control;
import std.string;
private{
	import core.memory;
	alias std.string.toStringz toz;
}

pragma(lib,"shell32.lib");
///
class ImageList
{
	public HIMAGELIST handle;///
	public:
	this(HIMAGELIST h)///
	{
		handle=h;
	}
	this(int cx=32, int cy=32, uint type=ILC_COLOR32)///
	{
		handle=ImageList_Create(cx,cy,type,0, 256);
	}

	int AddIcon(HICON ico)	///
	{	return ImageList_ReplaceIcon(handle, -1, ico);	}

	~this()
	{
		ImageList_Destroy(handle);
	}
}


///
class ListView : Control
{
	static struct LV_ITEMW///
	{
		UINT mask;///
		int iItem;///
		int iSubItem;///
		UINT state;///
		UINT stateMask;///
		wchar* pszText;///
		int cchTextMax;///
		int iImage;///
		LPARAM lParam;///
		int iIndent;///
		int iGroupId;///
		UINT cColumns; /// tile view columns
		PUINT puColumns;///

		int* piColFmt;///
		int iGroup; /// readonly. only valid for owner data.
	}

	static struct LV_FINDINFOW///
	{
		UINT flags;///
		wchar* psz;///
		LPARAM lParam;///
		POINT pt;///
		UINT vkDirection;///
	}

	static struct LV_HITTESTINFO
	{
		POINT pt;
		UINT flags;
		int iItem;
		int iSubItem;    // this is was NOT in win95.  valid only for LVM_SUBITEMHITTEST

		int iGroup; // readonly. index of group. only valid for owner data.
		// supports single item in multiple groups.
	}
	static struct LV_TILEVIEWINFO {
		UINT cbSize;
		DWORD dwMask;
		DWORD dwFlags;
		POINT sizeTile;
		int cLines;
		RECT rcLabelMargin;
	}
	static struct LV_TILEINFO
	{
		UINT    cbSize;
		int     iItem;
		UINT    cColumns;
		PUINT   puColumns;

		int*    piColFmt;
	}

	static struct LV_COLUMNW
	{
		UINT mask;
		int fmt;
		int cx;
		wchar* pszText;
		int cchTextMax;
		int iSubItem;
		int iImage;
		int iOrder;

		int cxMin;       // min snap point
		int cxDefault;   // default snap point
		int cxIdeal;     // read only. ideal may not eqaul current width if auto sized (LVS_EX_AUTOSIZECOLUMNS) to a lesser width.
	}

	static enum
	{
LVN_FIRST             =(0U-100U)       // listview
,LVS_ICON               =0x0000///
,LVS_REPORT             =0x0001///
,LVS_SMALLICON          =0x0002///
,LVS_LIST               =0x0003///
,LVS_TYPEMASK           =0x0003///
,LVS_SINGLESEL          =0x0004///
,LVS_SHOWSELALWAYS      =0x0008///
,LVS_SORTASCENDING      =0x0010///
,LVS_SORTDESCENDING     =0x0020///
,LVS_SHAREIMAGELISTS    =0x0040///
,LVS_NOLABELWRAP        =0x0080///
,LVS_AUTOARRANGE        =0x0100///
,LVS_EDITLABELS         =0x0200///
,LVS_OWNERDATA          =0x1000///
,LVS_NOSCROLL           =0x2000///
,LVS_TYPESTYLEMASK      =0xfc00///
,LVS_ALIGNTOP           =0x0000///
,LVS_ALIGNLEFT          =0x0800///
,LVS_ALIGNMASK          =0x0c00///
,LVS_OWNERDRAWFIXED     =0x0400///
,LVS_NOCOLUMNHEADER     =0x4000///
,LVS_NOSORTHEADER       =0x8000///

,LVSIL_NORMAL       =     0
,LVSIL_SMALL          =   1
,LVSIL_STATE         =    2
,LVSIL_GROUPHEADER    =   3

,LVIF_TEXT              =0x00000001
,LVIF_IMAGE             =0x00000002
,LVIF_PARAM             =0x00000004
,LVIF_STATE             =0x00000008
,LVIF_INDENT            =0x00000010
,LVIF_NORECOMPUTE       =0x00000800
,LVIF_GROUPID           =0x00000100
,LVIF_COLUMNS           =0x00000200
,LVIF_COLFMT            =0x00010000 // The piColFmt member is valid in addition to puColumns

,LVIS_FOCUSED           =0x0001
,LVIS_SELECTED          =0x0002
,LVIS_CUT               =0x0004
,LVIS_DROPHILITED       =0x0008
,LVIS_GLOW              =0x0010
,LVIS_ACTIVATING        =0x0020
,LVIS_OVERLAYMASK       =0x0F00
,LVIS_STATEIMAGEMASK    =0xF000

,LVNI_ALL               =0x0000
,LVNI_FOCUSED           =0x0001
,LVNI_SELECTED          =0x0002
,LVNI_CUT               =0x0004
,LVNI_DROPHILITED       =0x0008
,LVNI_STATEMASK        =(LVNI_FOCUSED | LVNI_SELECTED | LVNI_CUT | LVNI_DROPHILITED)
,LVNI_VISIBLEORDER      =0x0010
,LVNI_PREVIOUS          =0x0020
,LVNI_VISIBLEONLY       =0x0040
,LVNI_SAMEGROUPONLY     =0x0080
,LVNI_ABOVE             =0x0100
,LVNI_BELOW             =0x0200
,LVNI_TOLEFT            =0x0400
,LVNI_TORIGHT           =0x0800
,LVNI_DIRECTIONMASK    =(LVNI_ABOVE | LVNI_BELOW | LVNI_TOLEFT | LVNI_TORIGHT)

,LVFI_PARAM             =0x0001
,LVFI_STRING            =0x0002
,LVFI_SUBSTRING         =0x0004  // Same as LVFI_PARTIAL
,LVFI_PARTIAL           =0x0008
,LVFI_WRAP              =0x0020
,LVFI_NEARESTXY         =0x0040

,LVIR_BOUNDS         =    0
,LVIR_ICON            =   1
,LVIR_LABEL          =    2
,LVIR_SELECTBOUNDS    =   3

,LVHT_NOWHERE           =0x00000001
,LVHT_ONITEMICON        =0x00000002
,LVHT_ONITEMLABEL       =0x00000004
,LVHT_ONITEMSTATEICON   =0x00000008
,LVHT_ONITEM           =(LVHT_ONITEMICON | LVHT_ONITEMLABEL | LVHT_ONITEMSTATEICON)
,LVHT_ABOVE             =0x00000008
,LVHT_BELOW             =0x00000010
,LVHT_TORIGHT           =0x00000020
,LVHT_TOLEFT            =0x00000040
,LVHT_EX_GROUP_HEADER      =0x10000000
,LVHT_EX_GROUP_FOOTER      =0x20000000
,LVHT_EX_GROUP_COLLAPSE    =0x40000000
,LVHT_EX_GROUP_BACKGROUND  =0x80000000
,LVHT_EX_GROUP_STATEICON   =0x01000000
,LVHT_EX_GROUP_SUBSETLINK  =0x02000000
,LVHT_EX_GROUP            =(LVHT_EX_GROUP_BACKGROUND | LVHT_EX_GROUP_COLLAPSE | LVHT_EX_GROUP_FOOTER | LVHT_EX_GROUP_HEADER | LVHT_EX_GROUP_STATEICON | LVHT_EX_GROUP_SUBSETLINK)
,LVHT_EX_ONCONTENTS        =0x04000000 // On item AND not on the background
,LVHT_EX_FOOTER            =0x08000000

,LVA_DEFAULT            =0x0000
,LVA_ALIGNLEFT          =0x0001
,LVA_ALIGNTOP           =0x0002
,LVA_SNAPTOGRID         =0x0005
,LVCF_FMT               =0x0001
,LVCF_WIDTH             =0x0002
,LVCF_TEXT              =0x0004
,LVCF_SUBITEM           =0x0008
,LVCF_IMAGE             =0x0010
,LVCF_ORDER             =0x0020

,LVCF_MINWIDTH          =0x0040
,LVCF_DEFAULTWIDTH      =0x0080
,LVCF_IDEALWIDTH        =0x0100

// LVCFMT_ flags up to FFFF are shared with the header control (HDF_ flags).
// Flags above FFFF are listview-specific.

,LVCFMT_LEFT                =0x0000 // Same as HDF_LEFT
,LVCFMT_RIGHT               =0x0001 // Same as HDF_RIGHT
,LVCFMT_CENTER              =0x0002 // Same as HDF_CENTER
,LVCFMT_JUSTIFYMASK         =0x0003 // Same as HDF_JUSTIFYMASK
,LVCFMT_IMAGE               =0x0800 // Same as HDF_IMAGE
,LVCFMT_BITMAP_ON_RIGHT     =0x1000 // Same as HDF_BITMAP_ON_RIGHT
,LVCFMT_COL_HAS_IMAGES      =0x8000 // Same as HDF_OWNERDRAW

,LVCFMT_FIXED_WIDTH         =0x00100  // Can't resize the column; same as HDF_FIXEDWIDTH
,LVCFMT_NO_DPI_SCALE        =0x40000  // If not set, CCM_DPISCALE will govern scaling up fixed width
,LVCFMT_FIXED_RATIO         =0x80000  // Width will augment with the row height
// The following flags
,LVCFMT_LINE_BREAK         =0x100000 // Move to the top of the next list of columns
,LVCFMT_FILL               =0x200000 // Fill the remainder of the tile area. Might have a title.
,LVCFMT_WRAP               =0x400000 // This sub-item can be wrapped.
,LVCFMT_NO_TITLE           =0x800000  // This sub-item doesn't have an title.
,LVCFMT_TILE_PLACEMENTMASK =(LVCFMT_LINE_BREAK | LVCFMT_FILL)
,LVCFMT_SPLITBUTTON       =0x1000000 // Column is a split button; same as HDF_SPLITBUTTON

,LVM_FIRST               =0x1000      // ListView messages
,LVM_GETBKCOLOR        =(LVM_FIRST + 0)
,LVM_SETBKCOLOR        =(LVM_FIRST + 1)
,LVM_GETIMAGELIST      =(LVM_FIRST + 2)
,LVM_SETIMAGELIST      =(LVM_FIRST + 3)
,LVM_GETITEMCOUNT      =(LVM_FIRST + 4)
,LVM_GETITEMA          =(LVM_FIRST + 5)
,LVM_GETITEMW          =(LVM_FIRST + 75)
,LVM_SETITEMA          =(LVM_FIRST + 6)
,LVM_SETITEMW          =(LVM_FIRST + 76)
,LVM_INSERTITEMA       =(LVM_FIRST + 7)
,LVM_INSERTITEMW       =(LVM_FIRST + 77)
,LVM_DELETEITEM        =(LVM_FIRST + 8)
,LVM_DELETEALLITEMS    =(LVM_FIRST + 9)
,LVM_GETCALLBACKMASK   =(LVM_FIRST + 10)
,LVM_SETCALLBACKMASK   =(LVM_FIRST + 11)
,LVM_GETNEXTITEM       =(LVM_FIRST + 12)
,LVM_FINDITEMA         =(LVM_FIRST + 13)
,LVM_FINDITEMW         =(LVM_FIRST + 83)
,LVM_GETITEMRECT       =(LVM_FIRST + 14)
,LVM_SETITEMPOSITION   =(LVM_FIRST + 15)
,LVM_GETITEMPOSITION   =(LVM_FIRST + 16)
,LVM_GETSTRINGWIDTHA   =(LVM_FIRST + 17)
,LVM_GETSTRINGWIDTHW   =(LVM_FIRST + 87)
,LVM_HITTEST           =(LVM_FIRST + 18)
,LVM_ENSUREVISIBLE     =(LVM_FIRST + 19)
,LVM_SCROLL            =(LVM_FIRST + 20)
,LVM_REDRAWITEMS       =(LVM_FIRST + 21)
,LVM_ARRANGE           =(LVM_FIRST + 22)
,LVM_EDITLABELA        =(LVM_FIRST + 23)
,LVM_EDITLABELW        =(LVM_FIRST + 118)
,LVM_GETEDITCONTROL    =(LVM_FIRST + 24)
,LVM_GETCOLUMNA        =(LVM_FIRST + 25)
,LVM_GETCOLUMNW        =(LVM_FIRST + 95)
,LVM_SETCOLUMNA        =(LVM_FIRST + 26)
,LVM_SETCOLUMNW        =(LVM_FIRST + 96)
,LVM_INSERTCOLUMNA     =(LVM_FIRST + 27)
,LVM_INSERTCOLUMNW     =(LVM_FIRST + 97)
,LVM_DELETECOLUMN      =(LVM_FIRST + 28)
,LVM_GETCOLUMNWIDTH    =(LVM_FIRST + 29)
,LVSCW_AUTOSIZE             = -1
,LVSCW_AUTOSIZE_USEHEADER    =-2
,LVM_SETCOLUMNWIDTH        =(LVM_FIRST + 30)
,LVM_GETHEADER             =(LVM_FIRST + 31)
,LVM_CREATEDRAGIMAGE   =(LVM_FIRST + 33)
,LVM_GETVIEWRECT       =(LVM_FIRST + 34)
,LVM_GETTEXTCOLOR      =(LVM_FIRST + 35)
,LVM_SETTEXTCOLOR      =(LVM_FIRST + 36)
,LVM_GETTEXTBKCOLOR    =(LVM_FIRST + 37)
,LVM_SETTEXTBKCOLOR    =(LVM_FIRST + 38)
,LVM_GETTOPINDEX       =(LVM_FIRST + 39)
,LVM_GETCOUNTPERPAGE   =(LVM_FIRST + 40)
,LVM_GETORIGIN         =(LVM_FIRST + 41)
,LVM_UPDATE            =(LVM_FIRST + 42)
,LVM_SETITEMSTATE      =(LVM_FIRST + 43)
,LVM_GETITEMSTATE      =(LVM_FIRST + 44)
,LVM_GETITEMTEXTA      =(LVM_FIRST + 45)
,LVM_GETITEMTEXTW      =(LVM_FIRST + 115)
,LVM_SETITEMTEXTA      =(LVM_FIRST + 46)
,LVM_SETITEMTEXTW      =(LVM_FIRST + 116)
,LVM_SETITEMCOUNT      =(LVM_FIRST + 47)
,LVM_SORTITEMS         =(LVM_FIRST + 48)
,LVM_SETITEMPOSITION32 =(LVM_FIRST + 49)
,LVM_GETSELECTEDCOUNT  =(LVM_FIRST + 50)
,LVM_GETITEMSPACING    =(LVM_FIRST + 51)
,LVM_GETISEARCHSTRINGA =(LVM_FIRST + 52)
,LVM_GETISEARCHSTRINGW =(LVM_FIRST + 117)
,LVM_SETICONSPACING    =(LVM_FIRST + 53)
,LVM_SETEXTENDEDLISTVIEWSTYLE =(LVM_FIRST + 54)   // optional wParam == mask
,LVM_GETEXTENDEDLISTVIEWSTYLE =(LVM_FIRST + 55)

,LVS_EX_GRIDLINES       =0x00000001///
,LVS_EX_SUBITEMIMAGES   =0x00000002///
,LVS_EX_CHECKBOXES      =0x00000004///
,LVS_EX_TRACKSELECT     =0x00000008///
,LVS_EX_HEADERDRAGDROP  =0x00000010///
,LVS_EX_FULLROWSELECT   =0x00000020 /// applies to report mode only
,LVS_EX_ONECLICKACTIVATE=0x00000040///
,LVS_EX_TWOCLICKACTIVATE=0x00000080///
,LVS_EX_FLATSB          =0x00000100///
,LVS_EX_REGIONAL        =0x00000200///
,LVS_EX_INFOTIP         =0x00000400 /// listview does InfoTips for you
,LVS_EX_UNDERLINEHOT    =0x00000800///
,LVS_EX_UNDERLINECOLD   =0x00001000///
,LVS_EX_MULTIWORKAREAS  =0x00002000///
,LVS_EX_LABELTIP        =0x00004000 /// listview unfolds partly hidden labels if it does not have infotip text
,LVS_EX_BORDERSELECT    =0x00008000 /// border selection style instead of highlight
,LVS_EX_DOUBLEBUFFER    =0x00010000///
,LVS_EX_HIDELABELS      =0x00020000///
,LVS_EX_SINGLEROW       =0x00040000///
,LVS_EX_SNAPTOGRID      =0x00080000  /// Icons automatically snap to grid.
,LVS_EX_SIMPLESELECT    =0x00100000  /// Also changes overlay rendering to top right for icon mode.

,LVS_EX_JUSTIFYCOLUMNS  =0x00200000  /// Icons are lined up in columns that use up the whole view area.
,LVS_EX_TRANSPARENTBKGND=0x00400000  /// Background is painted by the parent via WM_PRINTCLIENT
,LVS_EX_TRANSPARENTSHADOWTEXT=0x00800000  /// Enable shadow text on transparent backgrounds only (useful with bitmaps)
,LVS_EX_AUTOAUTOARRANGE =0x01000000  /// Icons automatically arrange if no icon positions have been set
,LVS_EX_HEADERINALLVIEWS=0x02000000  /// Display column header in all view modes
,LVS_EX_AUTOCHECKSELECT =0x08000000///
,LVS_EX_AUTOSIZECOLUMNS =0x10000000///
,LVS_EX_COLUMNSNAPPOINTS=0x40000000///
,LVS_EX_COLUMNOVERFLOW  =0x80000000///

,LVM_GETSUBITEMRECT    =(LVM_FIRST + 56)
,LVM_SUBITEMHITTEST    =(LVM_FIRST + 57)
,LVM_SETCOLUMNORDERARRAY= (LVM_FIRST + 58)
,LVM_GETCOLUMNORDERARRAY =(LVM_FIRST + 59)
,LVM_SETHOTITEM=(LVM_FIRST + 60)
,LVM_GETHOTITEM=(LVM_FIRST + 61)
,LVM_SETHOTCURSOR=(LVM_FIRST + 62)
,LVM_GETHOTCURSOR=(LVM_FIRST + 63)
,LVM_APPROXIMATEVIEWRECT =(LVM_FIRST + 64)
,LV_MAX_WORKAREAS        = 16
,LVM_SETWORKAREAS       =(LVM_FIRST + 65)
,LVM_GETWORKAREAS      =(LVM_FIRST + 70)
,LVM_GETNUMBEROFWORKAREAS=(LVM_FIRST + 73)
,LVM_GETSELECTIONMARK  =(LVM_FIRST + 66)
,LVM_SETSELECTIONMARK  =(LVM_FIRST + 67)
,LVM_SETHOVERTIME      =(LVM_FIRST + 71)
,LVM_GETHOVERTIME      =(LVM_FIRST + 72)
,LVM_SETTOOLTIPS     =(LVM_FIRST + 74)
,LVM_GETTOOLTIPS     =(LVM_FIRST + 78)
,LVM_SORTITEMSEX        =(LVM_FIRST + 81)

,LVBKIF_SOURCE_NONE     =0x00000000
,LVBKIF_SOURCE_HBITMAP  =0x00000001
,LVBKIF_SOURCE_URL      =0x00000002
,LVBKIF_SOURCE_MASK     =0x00000003
,LVBKIF_STYLE_NORMAL    =0x00000000
,LVBKIF_STYLE_TILE      =0x00000010
,LVBKIF_STYLE_MASK      =0x00000010
,LVBKIF_FLAG_TILEOFFSET =0x00000100
,LVBKIF_TYPE_WATERMARK  =0x10000000
,LVBKIF_FLAG_ALPHABLEND =0x20000000

,LVM_SETBKIMAGEA       =(LVM_FIRST + 68)
,LVM_SETBKIMAGEW       =(LVM_FIRST + 138)
,LVM_GETBKIMAGEA       =(LVM_FIRST + 69)
,LVM_GETBKIMAGEW       =(LVM_FIRST + 139)
,LVM_SETSELECTEDCOLUMN       =(LVM_FIRST + 140)
,LVM_SETTILEVIEWINFO                 =(LVM_FIRST + 162)
,LVM_GETTILEVIEWINFO                 =(LVM_FIRST + 163)
,LVM_SETTILEINFO                     =(LVM_FIRST + 164)
,LVM_GETTILEINFO                     =(LVM_FIRST + 165)

,LV_VIEW_ICON           =0x0000///
,LV_VIEW_DETAILS        =0x0001///
,LV_VIEW_SMALLICON      =0x0002///
,LV_VIEW_LIST           =0x0003///
,LV_VIEW_TILE           =0x0004///
,LV_VIEW_MAX            =0x0004///

,LVM_SETVIEW       =(LVM_FIRST + 142)
,LVM_GETVIEW       =(LVM_FIRST + 143)

,LVGF_NONE          =0x00000000
,LVGF_HEADER        =0x00000001
,LVGF_FOOTER        =0x00000002
,LVGF_STATE         =0x00000004
,LVGF_ALIGN         =0x00000008
,LVGF_GROUPID       =0x00000010

,LVGF_SUBTITLE          =0x00000100  // pszSubtitle is valid
,LVGF_TASK              =0x00000200  // pszTask is valid
,LVGF_DESCRIPTIONTOP    =0x00000400  // pszDescriptionTop is valid
,LVGF_DESCRIPTIONBOTTOM =0x00000800  // pszDescriptionBottom is valid
,LVGF_TITLEIMAGE        =0x00001000  // iTitleImage is valid
,LVGF_EXTENDEDIMAGE     =0x00002000  // iExtendedImage is valid
,LVGF_ITEMS             =0x00004000  // iFirstItem and cItems are valid
,LVGF_SUBSET            =0x00008000  // pszSubsetTitle is valid
,LVGF_SUBSETITEMS       =0x00010000  // readonly, cItems holds count of items in visible subset, iFirstItem is valid

,LVGS_NORMAL            =0x00000000
,LVGS_COLLAPSED         =0x00000001
,LVGS_HIDDEN            =0x00000002
,LVGS_NOHEADER          =0x00000004
,LVGS_COLLAPSIBLE       =0x00000008
,LVGS_FOCUSED           =0x00000010
,LVGS_SELECTED          =0x00000020
,LVGS_SUBSETED          =0x00000040
,LVGS_SUBSETLINKFOCUSED =0x00000080

,LVGA_HEADER_LEFT   =0x00000001
,LVGA_HEADER_CENTER =0x00000002
,LVGA_HEADER_RIGHT  =0x00000004  // Don't forget to validate exclusivity
,LVGA_FOOTER_LEFT   =0x00000008
,LVGA_FOOTER_CENTER =0x00000010
,LVGA_FOOTER_RIGHT  =0x00000020  // Don't forget to validate exclusivity

,LVTVIF_AUTOSIZE    =   0x00000000
,LVTVIF_FIXEDWIDTH   =  0x00000001
,LVTVIF_FIXEDHEIGHT    =0x00000002
,LVTVIF_FIXEDSIZE      =0x00000003

,LVTVIF_EXTENDED      = 0x00000004

,LVTVIM_TILESIZE       =0x00000001
,LVTVIM_COLUMNS        =0x00000002
,LVTVIM_LABELMARGIN    =0x00000004

,LVM_SETINFOTIP         =(LVM_FIRST + 173)

,LVN_ITEMCHANGING      =(LVN_FIRST-0)
,LVN_ITEMCHANGED       =(LVN_FIRST-1)
,LVN_INSERTITEM        =(LVN_FIRST-2)
,LVN_DELETEITEM        =(LVN_FIRST-3)
,LVN_DELETEALLITEMS    =(LVN_FIRST-4)
,LVN_BEGINLABELEDITA   =(LVN_FIRST-5)
,LVN_BEGINLABELEDITW   =(LVN_FIRST-75)
,LVN_ENDLABELEDITA     =(LVN_FIRST-6)
,LVN_ENDLABELEDITW     =(LVN_FIRST-76)
,LVN_COLUMNCLICK       =(LVN_FIRST-8)
,LVN_BEGINDRAG         =(LVN_FIRST-9)
,LVN_BEGINRDRAG        =(LVN_FIRST-11)
,LVN_ODCACHEHINT       =(LVN_FIRST-13)
,LVN_ODFINDITEMA       =(LVN_FIRST-52)
,LVN_ODFINDITEMW       =(LVN_FIRST-79)
,LVN_ITEMACTIVATE      =(LVN_FIRST-14)
,LVN_ODSTATECHANGED    =(LVN_FIRST-15)
,LVN_HOTTRACK          =(LVN_FIRST-21)
,LVN_GETDISPINFOA      =(LVN_FIRST-50)
,LVN_GETDISPINFOW      =(LVN_FIRST-77)
,LVN_SETDISPINFOA      =(LVN_FIRST-51)
,LVN_SETDISPINFOW      =(LVN_FIRST-78)

	}
struct LV_SETINFOTIP {
    UINT cbSize;
    DWORD dwFlags;
    wchar* pszText;
    int iItem;
    int iSubItem;

    HBITMAP hbmp;
}
	struct LVGROUP
{
    UINT    cbSize;
    UINT    mask;
    LPWSTR  pszHeader;
    int     cchHeader;
    LPWSTR  pszFooter;
    int     cchFooter;
    int     iGroupId;
    UINT    stateMask;
    UINT    state;
    UINT    uAlign;

    LPWSTR  pszSubtitle;
    UINT    cchSubtitle;
    LPWSTR  pszTask;
    UINT    cchTask;
    LPWSTR  pszDescriptionTop;
    UINT    cchDescriptionTop;
    LPWSTR  pszDescriptionBottom;
    UINT    cchDescriptionBottom;
    int     iTitleImage;
    int     iExtendedImage;
    int     iFirstItem;         // Read only
    UINT    cItems;             // Read only
    LPWSTR  pszSubsetTitle;     // NULL if group is not subset
    UINT    cchSubsetTitle;
}

	struct LV_BKIMAGEW
{
    ULONG ulFlags;              // LVBKIF_*
    HBITMAP hbm;
    wchar* pszImage;
    uint cchImageMax;
    int xOffsetPercent;
    int yOffsetPercent;
}

///
	public this(Control par,int x,int y,int w,int h,int style=WS_BORDER+LVS_AUTOARRANGE,int exst=0)	{
		super(par,"SysListView32",x,y,w,h,style,exst);

		OnColumnClick=new OnColClickEH();
		OnBeginDrag=new OnColClickEH();
		par.AddEvent(WM_NOTIFY,&OnNot);
	}

	// List operations
	public:
	int AddColumn(int id,wstring text,int width)///
	{
		LV_COLUMNW col;
		col.mask=LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM;
		col.cx=width;
		col.iSubItem=id;
		col.pszText=cast(wchar*)text.ptr;
		col.cchTextMax=text.length;
		return SendMessageA(handle,LVM_INSERTCOLUMNW,id,cast(int) &col);
	}
	int Add(T)(T text)///
	{	return Insert(count(),text);	}

	int Insert(T)(int index,T text)///
	{
		LV_ITEMW i;
		i.mask=LVIF_TEXT;
		i.iItem=index;
		//i.cColumns=2;
		i.iSubItem=0;
		i.pszText=cast(wchar*) text.ptr;
		i.cchTextMax=text.length;

		int ret=SendMessageA(handle,LVM_INSERTITEMW, 0, cast(LPARAM)&i);
		SendMessageA(handle,LVM_SETITEMW, 0, cast(LPARAM)&i);
		return ret;
	}

	void setColumnCount(int i, uint c)///
	{
		LV_ITEMW ti;
		ti.mask=LVIF_COLUMNS;
		ti.cColumns=c;
		ti.iSubItem=0;
		ti.iItem=i;
		SendMessageA(handle,LVM_SETITEMW,0, cast(int)&ti);
	}

	void tileLines(uint lns)///
	{
		LV_TILEVIEWINFO ti;
		ti.cbSize=ti.sizeof;
		ti.dwMask=LVTVIM_COLUMNS;
		//ti.dwFlags = LVTVIF_EXTENDED;
		ti.cLines=lns;
		SendMessageA(handle,LVM_SETTILEVIEWINFO,0, cast(int)&ti);
	}

	void Text(int id, wstring t,int column=0)///
	{		LV_ITEMW i;
			i.iSubItem=column;
			i.pszText=cast(wchar*)t.ptr;
			i.cchTextMax=t.length;
			SendMessageA(handle,LVM_SETITEMTEXTW, id, cast(LPARAM)&i);
	}

	wstring Text(int id,int col=0)///ditto
	{
		wchar[256] ret;
		LV_ITEMW i;
		i.mask=LVIF_TEXT;
		i.cchTextMax=ret.length;
		i.pszText=cast(wchar*) ret.ptr;
		i.iItem=id;
		i.iSubItem=col;
		int r=SendMessageA(handle,LVM_GETITEMTEXTW, id, cast(LPARAM)&i);
	return cast(wstring) ret[0 .. r];
	}

	void setToolTip(int id, wstring t,int col=0)///
	{
		LV_SETINFOTIP ti;
		ti.cbSize=ti.sizeof;
		ti.pszText=cast(wchar*)(t~"\0"w);
		ti.iItem=id;
		ti.iSubItem=col;
		SendMessageA(handle,LVM_SETINFOTIP, 0, cast(LPARAM)&ti);
	}

	void setImage(int id,int col=0,int img=0)///
		{
			LV_ITEMW i;
			i.iItem=id;
			i.iSubItem=col;
			i.mask=LVIF_IMAGE;
			i.iImage=img;
			SendMessageA(handle,LVM_SETITEMW, 0, cast(LPARAM)&i);
		}
	int getImage(int id,int col=0)///ditto
		{
			LV_ITEMW i;
			i.iItem=id;
			i.iSubItem=col;
			i.mask=LVIF_IMAGE;
			SendMessageA(handle,LVM_GETITEMW, 0, cast(LPARAM)&i);
			return i.iImage;
		}

	void setImageList(ImageList il, uint type=LVSIL_NORMAL)///
		{
			SendMessageA( handle, LVM_SETIMAGELIST, type,cast(int)il.handle);
		}
	ImageList getImageList(uint type=LVSIL_NORMAL)///ditto
		{
			return new ImageList( cast(HIMAGELIST)SendMessageA( handle, LVM_GETIMAGELIST, type,0) );
		}

	void setItemTag(int id,int col,Object o)///
		{
			LV_ITEMW i;
			i.iItem=id;
			i.iSubItem=col;
			i.mask=LVIF_PARAM;
			i.lParam=cast(int)cast(void*)o;
			SendMessageA(handle,LVM_SETITEMW, 0, cast(LPARAM)&i);
		}
	Object getItemTag(int id,int col=0)///ditto
		{
			LV_ITEMW i;
			i.iItem=id;
			i.iSubItem=col;
			i.mask=LVIF_PARAM;
			SendMessageA(handle,LVM_GETITEMW, 0, cast(LPARAM)&i);
			return cast(Object)cast(void*)i.lParam;
		}


	void Clear() /***/{SendMessageA(handle,LVM_DELETEALLITEMS, 0, 0);}
	void RemoveAt(uint id)/***/	{SendMessageA(handle,LVM_DELETEITEM, id, 0);}

	int count() /***/{return SendMessageA(handle,LVM_GETITEMCOUNT, 0, 0);}
	void count(int i) /**ditto*/{SendMessageA(handle,LVM_SETITEMCOUNT, i, 0);}

	int selectedIndex() /***/{return SendMessageA(handle,LVM_GETSELECTIONMARK, 0, 0);}
	void selectedIndex(int id) /**ditto*/{SendMessageA(handle,LVM_SETSELECTIONMARK, 0, id);}

	int view() /***/{return SendMessageA(handle,LVM_GETVIEW, 0, 0);}
	void view(int v) /**ditto*/{SendMessageA(handle,LVM_SETVIEW, v, 0);}

	LV_ITEMW getItem(LV_ITEMW r) /***/{SendMessageA(handle,LVM_GETITEMW, 0, cast(int)&r);return r;}
	void setItem(LV_ITEMW item) /**ditto*/{SendMessageA(handle,LVM_SETITEMW, 0, cast(int)&item);}

	wstring selectedText() /***/{return Text(selectedIndex);}
	void selectedText(wstring t) /**ditto*/{Text(selectedIndex,t);}


	struct LVHITTESTINFO {
    POINT pt;
    UINT flags;
    int iItem;
    int iSubItem;
    int iGroup;
}

	int getItemAt(Point p, out int SubItem, uint flags=LVHT_ONITEM)///
	{
		LVHITTESTINFO hi;
		POINT pos;
		pos.x=p.x;
		pos.y=p.y;
		hi.pt=pos;
		hi.flags=flags;
		SendMessageA(handle,LVM_HITTEST,0,cast(int)&hi);
		SubItem=hi.iSubItem;
		return hi.iItem;
	}

	int exStyle(uint st)///
	{
		return SendMessageA(handle,LVM_SETEXTENDEDLISTVIEWSTYLE, cast(uint)st, st);
	}



	static struct NMLISTVIEW {
	NMHDR hdr;
	int iItem;
	int iSubItem;
	UINT uNewState;
	UINT uOldState;
	UINT uChanged;
	POINT ptAction;
	LPARAM lParam;
	}

	static alias EventHandler!(void,int) OnColClickEH;///
	OnColClickEH OnColumnClick;///
	OnColClickEH OnBeginDrag;///

	private:
	int OnNot(WindowEvent e)
	{
		NMLISTVIEW* nm=cast(NMLISTVIEW*)e.lParam;
		if(!nm) return 0;
		if(cast(uint)((*nm).hdr.idFrom)!=Id()) return 0;

		switch(nm.hdr.code)
		{
			case LVN_COLUMNCLICK:
				OnColumnClick(this,nm.iSubItem);
			break;
			case LVN_BEGINDRAG:
				OnBeginDrag(this,nm.iItem);
			break;
			default:break;
		}
		return 0;
	}


}
