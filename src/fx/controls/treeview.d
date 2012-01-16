import fx.win32, fx.event, fx.fxdef, fx.control, std.c.wcharh, std.utf;

static struct TREEITEM{}
alias void* HTREEITEM;///

	///
class TreeView : Control{
	public:

	static struct TV_ITEMA {
		uint mask;
		HTREEITEM hItem;
		uint state;
		uint stateMask;
		wchar* pszText;
		int cchTextMax;
		int iImage;
		int iSelectedImage;
		int cChildren;
		LPARAM lParam;
	}
	static struct TV_ITEMW {
		uint mask;
		HTREEITEM hItem;
		uint state;
		uint stateMask;
		wchar* pszText;
		int cchTextMax;
		int iImage;
		int iSelectedImage;
		int cChildren;
		LPARAM lParam;
	}
	struct TV_ITEMEXA {
		uint      mask;
		HTREEITEM hItem;
		uint      state;
		uint      stateMask;
		char*     pszText;
		int       cchTextMax;
		int       iImage;
		int       iSelectedImage;
		int       cChildren;
		LPARAM    lParam;
		int       iIntegral;

		uint      uStateEx;
		HWND      hwnd;
		int       iExpandedImage;
	}
	struct TV_ITEMEXW {
		uint      mask;
		HTREEITEM hItem;
		uint      state;
		uint      stateMask;
		wchar*     pszText;
		int       cchTextMax;
		int       iImage;
		int       iSelectedImage;
		int       cChildren;
		LPARAM    lParam;
		int       iIntegral;

		uint      uStateEx;
		HWND      hwnd;
		int       iExpandedImage;
	}
	static struct NMTVSTATEIMAGECHANGING{
		NMHDR hdr;
		HTREEITEM hti;
		int iOldStateImageIndex;
		int iNewStateImageIndex;
	}
	static struct TV_INSERTSTRUCTW {
		HTREEITEM hParent;
		HTREEITEM hInsertAfter;
		union
		{
			TV_ITEMEXW itemex;
			TV_ITEMW  item;
		};
	}
	static struct TV_INSERTSTRUCTA {
		HTREEITEM hParent;
		HTREEITEM hInsertAfter;
		union
		{
			TV_ITEMEXA itemex;
			TV_ITEMA  item;
		};
	}
	static struct TVHITTESTINFO {
		POINT       pt;
		uint        flags;
		HTREEITEM   hItem;
	}
	static struct NMTREEVIEW {
		NMHDR       hdr;
		uint        action;
		TV_ITEMA    itemOld;
		TV_ITEMA    itemNew;
		POINT       ptDrag;
	}
	static struct TVITEMCHANGE {
		NMHDR hdr;
		uint uChanged;
		HTREEITEM hItem;
		uint uStateNew;
		uint uStateOld;
		LPARAM lParam;
	}
	static struct NMTVDISPINFOA {
		NMHDR hdr;
		TV_ITEMA item;
	}
	static enum{
		TVS_HASBUTTONS        =0x0001///
		,TVS_HASLINES          =0x0002///
		,TVS_LINESATROOT       =0x0004///
		,TVS_EDITLABELS        =0x0008///
		,TVS_DISABLEDRAGDROP   =0x0010///
		,TVS_SHOWSELALWAYS     =0x0020///
		,TVS_RTLREADING        =0x0040///
		,TVS_NOTOOLTIPS        =0x0080///
		,TVS_CHECKBOXES        =0x0100///
		,TVS_TRACKSELECT       =0x0200///
		,TVS_SINGLEEXPAND      =0x0400///
		,TVS_INFOTIP           =0x0800///
		,TVS_FULLROWSELECT     =0x1000///
		,TVS_NOSCROLL          =0x2000///
		,TVS_NONEVENHEIGHT     =0x4000///
		,TVS_NOHSCROLL         =0x8000  /// TVS_NOSCROLL overrides this

		,TVS_EX_MULTISELECT        =0x0002///
		,TVS_EX_DOUBLEBUFFER       =0x0004///
		,TVS_EX_NOINDENTSTATE      =0x0008///
		,TVS_EX_RICHTOOLTIP        =0x0010///
		,TVS_EX_AUTOHSCROLL        =0x0020///
		,TVS_EX_FADEINOUTEXPANDOS  =0x0040///
		,TVS_EX_PARTIALCHECKBOXES  =0x0080///
		,TVS_EX_EXCLUSIONCHECKBOXES=0x0100///
		,TVS_EX_DIMMEDCHECKBOXES   =0x0200///
		,TVS_EX_DRAWIMAGEASYNC     =0x0400///

		,TVIF_TEXT             =0x0001
		,TVIF_IMAGE            =0x0002
		,TVIF_PARAM            =0x0004
		,TVIF_STATE            =0x0008
		,TVIF_HANDLE           =0x0010
		,TVIF_SELECTEDIMAGE    =0x0020
		,TVIF_CHILDREN         =0x0040
		,TVIF_INTEGRAL         =0x0080
		,TVIF_STATEEX          =0x0100
		,TVIF_EXPANDEDIMAGE    =0x0200
		,TVIS_SELECTED         =0x0002
		,TVIS_CUT              =0x0004
		,TVIS_DROPHILITED      =0x0008
		,TVIS_BOLD             =0x0010
		,TVIS_EXPANDED         =0x0020
		,TVIS_EXPANDEDONCE     =0x0040
		,TVIS_EXPANDPARTIAL    =0x0080
		,TVIS_OVERLAYMASK      =0x0F00
		,TVIS_STATEIMAGEMASK   =0xF000
		,TVIS_USERMASK         =0xF000
		,TVIS_EX_FLAT          =0x0001
		,TVIS_EX_DISABLED      =0x0002
		,TVIS_EX_ALL           =0x0002

		,TVI_ROOT                =(cast(HTREEITEM)-0x10000)
		,TVI_FIRST               =(cast(HTREEITEM)-0x0FFFF)
		,TVI_LAST                =(cast(HTREEITEM)-0x0FFFE)
		,TVI_SORT               = (cast(HTREEITEM)-0x0FFFD)

		,TVGN_ROOT             =0x0000
		,TVGN_NEXT             =0x0001
		,TVGN_PREVIOUS         =0x0002
		,TVGN_PARENT           =0x0003
		,TVGN_CHILD            =0x0004
		,TVGN_FIRSTVISIBLE     =0x0005
		,TVGN_NEXTVISIBLE      =0x0006
		,TVGN_PREVIOUSVISIBLE  =0x0007
		,TVGN_DROPHILITE       =0x0008
		,TVGN_CARET            =0x0009
		,TVGN_LASTVISIBLE      =0x000A
		,TVGN_NEXTSELECTED     =0x000B

		,TV_FIRST              =0x1100
		,TVM_INSERTITEMA     =    (TV_FIRST + 0)
		,TVM_INSERTITEMW     =    (TV_FIRST + 50)
		,TVM_DELETEITEM      =    (TV_FIRST + 1)
		,TVM_EXPAND             =(TV_FIRST + 2)
		,TVM_GETITEMRECT        =(TV_FIRST + 4)
		,TVM_GETCOUNT           =(TV_FIRST + 5)
		,TVM_GETINDENT          =(TV_FIRST + 6)
		,TVM_SETINDENT          =(TV_FIRST + 7)
		,TVM_GETIMAGELIST       =(TV_FIRST + 8)
		,TVM_SETIMAGELIST       =(TV_FIRST + 9)
		,TVM_GETNEXTITEM        =(TV_FIRST + 10)
		,TVM_SELECTITEM         =(TV_FIRST + 11)
		,TVM_GETITEMA           =(TV_FIRST + 12)
		,TVM_GETITEMW           =(TV_FIRST + 62)
		,TVM_SETITEMA           =(TV_FIRST + 13)
		,TVM_SETITEMW           =(TV_FIRST + 63)
		,TVM_EDITLABELA         =(TV_FIRST + 14)
		,TVM_EDITLABELW         =(TV_FIRST + 65)
		,TVM_GETEDITCONTROL     =(TV_FIRST + 15)
		,TVM_GETVISIBLECOUNT    =(TV_FIRST + 16)
		,TVM_HITTEST            =(TV_FIRST + 17)
		,TVM_CREATEDRAGIMAGE    =(TV_FIRST + 18)
		,TVM_SORTCHILDREN       =(TV_FIRST + 19)
		,TVM_ENSUREVISIBLE      =(TV_FIRST + 20)
		,TVM_SORTCHILDRENCB     =(TV_FIRST + 21)
		,TVM_ENDEDITLABELNOW    =(TV_FIRST + 22)
		,TVM_GETISEARCHSTRINGA  =(TV_FIRST + 23)
		,TVM_GETISEARCHSTRINGW  =(TV_FIRST + 64)
		,TVM_SETTOOLTIPS        =(TV_FIRST + 24)
		,TVM_GETTOOLTIPS        =(TV_FIRST + 25)
		,TVM_SETINSERTMARK      =(TV_FIRST + 26)
		/*,TVM_SETUNICODEFORMAT     =CCM_SETUNICODEFORMAT
		,TVM_GETUNICODEFORMAT     =CCM_GETUNICODEFORMAT*/
		,TVM_SETITEMHEIGHT        =(TV_FIRST + 27)
		,TVM_GETITEMHEIGHT        =(TV_FIRST + 28)
		,TVM_SETBKCOLOR             =(TV_FIRST + 29)
		,TVM_SETTEXTCOLOR             =(TV_FIRST + 30)
		,TVM_GETBKCOLOR             =(TV_FIRST + 31)
		,TVM_GETTEXTCOLOR             =(TV_FIRST + 32)
		,TVM_SETSCROLLTIME             =(TV_FIRST + 33)
		,TVM_GETSCROLLTIME             =(TV_FIRST + 34)
		,TVM_SETINSERTMARKCOLOR             =(TV_FIRST + 37)
		,TVM_GETINSERTMARKCOLOR             =(TV_FIRST + 38)
		,TVM_GETITEMSTATE       =(TV_FIRST + 39)
		,TVM_SETLINECOLOR           =(TV_FIRST + 40)
		,TVM_GETLINECOLOR           =(TV_FIRST + 41)
		,TVM_MAPACCIDTOHTREEITEM    =(TV_FIRST + 42)
		,TVM_MAPHTREEITEMTOACCID    =(TV_FIRST + 43)
		,TVM_SETEXTENDEDSTYLE     =(TV_FIRST + 44)
		,TVM_GETEXTENDEDSTYLE     =(TV_FIRST + 45)
		,TVM_SETAUTOSCROLLINFO  =(TV_FIRST + 59)
		,TVM_GETSELECTEDCOUNT      =(TV_FIRST + 70)
		,TVM_SHOWINFOTIP           =(TV_FIRST + 71)

		,TVE_COLLAPSE          =0x0001
		,TVE_EXPAND            =0x0002
		,TVE_TOGGLE            =0x0003
		,TVE_EXPANDPARTIAL     =0x4000
		,TVE_COLLAPSERESET     =0x8000

		,TVSIL_NORMAL            =0
		,TVSIL_STATE             =2

		,TVHT_NOWHERE          =0x0001
		,TVHT_ONITEMICON       =0x0002
		,TVHT_ONITEMLABEL      =0x0004
		,TVHT_ONITEMINDENT     =0x0008
		,TVHT_ONITEMBUTTON     =0x0010
		,TVHT_ONITEMRIGHT      =0x0020
		,TVHT_ONITEMSTATEICON  =0x0040
		,TVHT_ONITEM             =(TVHT_ONITEMICON | TVHT_ONITEMLABEL | TVHT_ONITEMSTATEICON)

		,TVHT_ABOVE            =0x0100
		,TVHT_BELOW            =0x0200
		,TVHT_TORIGHT          =0x0400
		,TVHT_TOLEFT           =0x0800

		,TVN_FIRST               =(0U-400U)       // treeview
		,TVN_LAST                =(0U-499U)

		,TVC_UNKNOWN           =0x0000
		,TVC_BYMOUSE           =0x0001
		,TVC_BYKEYBOARD        =0x0002

		,TVN_SELCHANGINGA       =(TVN_FIRST-1)
		,TVN_SELCHANGINGW       =(TVN_FIRST-50)
		,TVN_SELCHANGEDA        =(TVN_FIRST-2)
		,TVN_SELCHANGEDW        =(TVN_FIRST-51)
		,TVN_GETDISPINFOA       =(TVN_FIRST-3)
		,TVN_GETDISPINFOW       =(TVN_FIRST-52)
		,TVN_SETDISPINFOA       =(TVN_FIRST-4)
		,TVN_SETDISPINFOW       =(TVN_FIRST-53)
		,TVN_ITEMEXPANDINGA     =(TVN_FIRST-5)
		,TVN_ITEMEXPANDINGW     =(TVN_FIRST-54)
		,TVN_ITEMEXPANDEDA      =(TVN_FIRST-6)
		,TVN_ITEMEXPANDEDW      =(TVN_FIRST-55)
		,TVN_BEGINDRAGA         =(TVN_FIRST-7)
		,TVN_BEGINDRAGW         =(TVN_FIRST-56)
		,TVN_BEGINRDRAGA        =(TVN_FIRST-8)
		,TVN_BEGINRDRAGW        =(TVN_FIRST-57)
		,TVN_DELETEITEMA        =(TVN_FIRST-9)
		,TVN_DELETEITEMW        =(TVN_FIRST-58)
		,TVN_BEGINLABELEDITA    =(TVN_FIRST-10)
		,TVN_BEGINLABELEDITW    =(TVN_FIRST-59)
		,TVN_ENDLABELEDITA      =(TVN_FIRST-11)
		,TVN_ENDLABELEDITW      =(TVN_FIRST-60)
		,TVN_KEYDOWN            =(TVN_FIRST-12)
		,TVN_GETINFOTIPA        =(TVN_FIRST-13)
		,TVN_GETINFOTIPW        =(TVN_FIRST-14)
		,TVN_SINGLEEXPAND       =(TVN_FIRST-15)
		,TVN_ITEMCHANGINGA      =(TVN_FIRST-16)
		,TVN_ITEMCHANGINGW      =(TVN_FIRST-17)
		,TVN_ITEMCHANGEDA       =(TVN_FIRST-18)
		,TVN_ITEMCHANGEDW       =(TVN_FIRST-19)
		,TVN_ASYNCDRAW          =(TVN_FIRST-20)
	}

///
	this(Control par,int x,int y,int w,int h,int style=TVS_HASBUTTONS+ TVS_LINESATROOT +TVS_HASLINES +TVS_SHOWSELALWAYS +TVS_DISABLEDRAGDROP )
	{
		super(par,"SysTreeView32",x,y,w,h,style);

		OnSelChanged=new OnSelEH();
		OnBeginDrag=new OnSelEH();

		OnBeginLabelEdit=new OnBeginLabelEditEH();
		OnEndLabelEdit=new OnBeginLabelEditEH();
		OnItemChanged=new OnBeginLabelEditEH();

		par.AddEvent(WM_NOTIFY,cast(EVTPROC)&OnNot);
	}

	static alias EventHandler!(void,HTREEITEM, Point) OnSelEH;
	//alias void delegate(HTREEITEM Item, Point clickPos) OnBeginDragEH;
	static alias EventHandler!(bool,HTREEITEM) OnBeginLabelEditEH;
	OnSelEH OnSelChanged///
	,OnBeginDrag;///
	OnBeginLabelEditEH OnBeginLabelEdit///
	,OnEndLabelEdit///
	,OnItemChanged;///

	private:
	int OnNot(WindowEvent e)
	{
		auto nm=(cast(NMTREEVIEW*)cast(int*)e.lParam);
		if(cast(int)(nm.hdr.idFrom)!=Id) return 0;

		if(nm.hdr.code==TVN_SELCHANGEDA)
		{
			Point p=Point(nm.ptDrag.x,nm.ptDrag.y);
			OnSelChanged(this,nm.itemNew.hItem, p);
		}
		if(nm.hdr.code==TVN_BEGINDRAGA)
		{
			Point p=Point(nm.ptDrag.x,nm.ptDrag.y);
			OnBeginDrag(this,nm.itemNew.hItem, p);
		}
		if(nm.hdr.code==TVN_BEGINLABELEDITA)
		{
			auto _nm=cast(NMTVDISPINFOA*)cast(int*)e.lParam;
			return OnBeginLabelEdit(this,_nm.item.hItem);
		}
		if(nm.hdr.code==TVN_ENDLABELEDITA)
		{
			auto _nm=cast(NMTVDISPINFOA*)cast(int*)e.lParam;
			OnEndLabelEdit(this,_nm.item.hItem);
		}

		if(nm.hdr.code==TVN_ITEMCHANGEDA) /* Vista only */
		{
			auto _nm=cast(TVITEMCHANGE*)cast(int*)e.lParam;
			OnItemChanged(this,_nm.hItem);
		}
		return 0;
	}

	public:
	HTREEITEM selectedItem()///
	{
		return getNextItem(null,TVGN_CARET);
	}
	void selectedItem(HTREEITEM item, uint flag=TVGN_CARET)///ditto
	{
		SendMessageA(handle, TVM_SELECTITEM, flag, cast(int)item);
	}

	TV_ITEMW getItem(HTREEITEM i)///
	{
		TV_ITEMW tv;
		tv.mask=TVIF_HANDLE+TVIF_TEXT+TVIF_PARAM+TVIF_IMAGE+TVIF_STATE+TVIF_SELECTEDIMAGE;
		tv.hItem=i;
		SendMessageW(handle,TVM_GETITEMW, 0, cast(int)&tv);
		return tv;
	}

	void setItem(TV_ITEMW tv)///ditto
	{
		SendMessageW(handle,TVM_SETITEMW, 0, cast(int)&tv);
	}

	void setItemText(HTREEITEM i, wstring label)///
	{
		scope TV_ITEMW tv;
		tv.hItem=i;
		tv.mask=TVIF_HANDLE+TVIF_TEXT;
		tv.pszText=cast(wchar*)label;
		tv.cchTextMax=label.length;
		SendMessageW(handle,TVM_SETITEMW, 0, cast(int)&tv);
	}
	void setItemText(HTREEITEM i, string label)	///ditto
	{	setItemText(i,toUTF16(label~"\0"));	}

	wstring getItemText(HTREEITEM i)///ditto
	{
		scope wchar[256] tbuf;
		scope TV_ITEMW tv;
		tv.mask=TVIF_HANDLE+TVIF_TEXT;
		tv.hItem=i;
		tv.pszText=tbuf.ptr;
		tv.cchTextMax=tbuf.length;
		if(!SendMessageW(handle,TVM_GETITEMW, 0, cast(int)&tv)) return null;

		return cast(wstring)tv.pszText[0 .. wcslen(tv.pszText)].idup;
	}

	void setItemTag(HTREEITEM i, Object tag)///
	{
		scope TV_ITEMA tv;
		tv.hItem=i;
		tv.mask=TVIF_HANDLE+TVIF_PARAM;
		tv.lParam=cast(int)cast(void*)tag;
		SendMessageA(handle,TVM_SETITEMA, 0, cast(int)&tv);
	}

	Object getItemTag(HTREEITEM i)///ditto
	{
		scope TV_ITEMA tv;
		tv.mask=TVIF_HANDLE+TVIF_PARAM;
		tv.hItem=i;
		if(!SendMessageA(handle,TVM_GETITEMA, 0, cast(int)&tv)) return null;

		return cast(Object)cast(void*)tv.lParam;
	}

	void Clear()	///
	{	SendMessageA(handle,TVM_DELETEITEM, 0, cast(LPARAM)TVI_ROOT);	}

	HTREEITEM Add(wstring label, HTREEITEM parent=TVI_ROOT, HTREEITEM insertAfter=TVI_LAST)///
	{
		TV_ITEMW tv;
		tv.mask=TVIF_TEXT;
		tv.pszText=cast(wchar*)label;
		tv.cchTextMax=label.length;

		TV_INSERTSTRUCTW tvi;
		tvi.hParent=parent;
		tvi.hInsertAfter=insertAfter;
		tvi.item=tv;

		return cast(HTREEITEM)SendMessageW(handle,TVM_INSERTITEMW, 0, cast(int)&tvi);
	}
	HTREEITEM Add(string label, HTREEITEM parent=TVI_ROOT, HTREEITEM insertAfter=TVI_LAST)	///ditto
	{	return Add(toUTF16(label),parent,insertAfter);	}

	HTREEITEM getItemAt(Point p, uint flags=TVHT_ONITEM)///
	{
		TVHITTESTINFO hi;
		POINT pos;
		pos.x=p.x;
		pos.y=p.y;
		hi.pt=pos;
		hi.flags=flags;
		return cast(HTREEITEM)SendMessageA(handle,TVM_HITTEST,0,cast(int)&hi);
	}

	HTREEITEM[] getAllItems()///
	{
		HTREEITEM[] ret;
		HTREEITEM ti=getRootItem();
		ret~=ti;
		ti=getNextItem(ti);
		ret~=ti;
		while(ti)
		{
			ti=getNextItem(ti);
			ret~=ti;
		}
		return	ret;
	}

	bool isDescendantOf(HTREEITEM ancestor, HTREEITEM child) ///
	{
		scope HTREEITEM tpar=child;
		while(tpar)
		{
			tpar=getParentItem(tpar);
			if(tpar==ancestor) 	return 	true;
		}
		delete 	tpar;
		return 	false;
	}

	HTREEITEM[] getItemChildren(HTREEITEM i)///
	{
		HTREEITEM[] ret;
		HTREEITEM ti=getNextItem(i,TVGN_CHILD);
		while(ti)
		{
			ret~=ti;
			ti=getNextItem(ti);
			if(getParentItem(ti)!=i)	break;
		}
		return 	ret;
	}

	HTREEITEM setItemParent(HTREEITEM i, HTREEITEM newPar)/***/
	{
		if(i==null) return	 null;
		if(i==newPar) return	 null;
		if(isDescendantOf(i,newPar)) 	return null;

		wstring tl=getItemText(i);
		auto tt=getItemTag(i);

		HTREEITEM ni=Add(tl,newPar);
		setItemTag(ni,tt);

		foreach(ch; getItemChildren(i))	{	setItemParent(ch,ni);	}
		deleteItem(i);

		expandItem(newPar);
		Update();
		return 	ni;
	}

	void deleteItem(HTREEITEM i)						/***/	{	SendMessageA(handle,TVM_DELETEITEM,0,cast(int)i);	}
	void expandItem(HTREEITEM i,uint flag=TVE_EXPAND)	/***/		{	SendMessageA(handle,TVM_EXPAND,flag,cast(int)i);	}
	void collapseItem(HTREEITEM i)						/**ditto*/	{	SendMessageA(handle,TVM_EXPAND,TVE_COLLAPSE,cast(int)i);	}
	void toggleItem(HTREEITEM i)						/**ditto*/	{	SendMessageA(handle,TVM_EXPAND,TVE_TOGGLE,cast(int)i);	}
	void ensureItemVisibility(HTREEITEM i)				/***/		{	SendMessageA(handle,TVM_ENSUREVISIBLE,0,cast(int)i);	}
	RECT* getItemRect(HTREEITEM i, bool wholeLine=false)/***/			{	RECT*	 r=cast(RECT*)i;SendMessageA(handle,TVM_GETITEMRECT,cast(uint)wholeLine,cast(int)r);	return	 r;	}
	HTREEITEM getNextItem(HTREEITEM i,uint flag=TVGN_NEXT)/***/		{	return	 cast(HTREEITEM)SendMessageA(handle,TVM_GETNEXTITEM,flag,cast(int)i);	}
	HTREEITEM getParentItem(HTREEITEM i)				/***/		{	return	 getNextItem(i,TVGN_PARENT);	}
	HTREEITEM getRootItem()								/***/{	return	 getNextItem(null,TVGN_ROOT);	}
	HTREEITEM getDropItem()								/***/{	return	 getNextItem(null,TVGN_DROPHILITE);	}
	void SelectDropTarget(HTREEITEM i)					/***/	{	SendMessageA(handle,TVM_SELECTITEM,TVGN_DROPHILITE,cast(int)i);	}

}
