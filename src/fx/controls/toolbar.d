/**This module is still in work!
*/
module fx.controls.toolbar;

import fx.win32;
import fx.control;
import std.string;




struct TBBUTTON
	{
		int         iBitmap;
		int         idCommand;
		BYTE     fsState;
		BYTE     fsStyle;
		BYTE     bReserved[2];
		DWORD*   dwData;
		int*          iString;
	}

struct TBADDBITMAP
	{
		HINSTANCE hInst;
		uint* nID;
	};

	///
class ToolBar : Control
	{
		public:
			static enum
			{
				TBSTATE_CHECKED         =0x01,
				TBSTATE_PRESSED         =0x02,
				TBSTATE_ENABLED         =0x04,
				TBSTATE_HIDDEN          =0x08,
				TBSTATE_INDETERMINATE   =0x10,
				TBSTATE_WRAP            =0x20,
				TBSTATE_ELLIPSES        =0x40,
				TBSTATE_MARKED          =0x80,
				TBSTYLE_BUTTON          =0x0000,  // obsolete; use BTNS_BUTTON instead
				TBSTYLE_SEP             =0x0001,  // obsolete; use BTNS_SEP instead
				TBSTYLE_CHECK           =0x0002,  // obsolete; use BTNS_CHECK instead
				TBSTYLE_GROUP           =0x0004,  // obsolete; use BTNS_GROUP instead
				TBSTYLE_CHECKGROUP      =(TBSTYLE_GROUP | TBSTYLE_CHECK),     // obsolete; use BTNS_CHECKGROUP instead
				TBSTYLE_DROPDOWN        =0x0008,  // obsolete; use BTNS_DROPDOWN instead
				TBSTYLE_AUTOSIZE        =0x0010,  // obsolete; use BTNS_AUTOSIZE instead
				TBSTYLE_NOPREFIX        =0x0020,  // obsolete; use BTNS_NOPREFIX instead
				TBSTYLE_TOOLTIPS        =0x0100,
				TBSTYLE_WRAPABLE        =0x0200,
				TBSTYLE_ALTDRAG         =0x0400,
				TBSTYLE_FLAT            =0x0800,
				TBSTYLE_LIST            =0x1000,
				TBSTYLE_CUSTOMERASE     =0x2000,
				TBSTYLE_REGISTERDROP    =0x4000,
				TBSTYLE_TRANSPARENT     =0x8000,
				TBSTYLE_EX_DRAWDDARROWS =0x00000001,
				TBSTYLE_EX_MIXEDBUTTONS =0x00000008,
				BTNS_BUTTON     		=TBSTYLE_BUTTON,      // 0x0000
				BTNS_SEP        		=TBSTYLE_SEP,         // 0x0001
				BTNS_CHECK      		=TBSTYLE_CHECK,       // 0x0002
				BTNS_GROUP      		=TBSTYLE_GROUP,       // 0x0004
				BTNS_CHECKGROUP 		=TBSTYLE_CHECKGROUP,  // (TBSTYLE_GROUP | TBSTYLE_CHECK)
				BTNS_DROPDOWN   		=TBSTYLE_DROPDOWN,    // 0x0008
				BTNS_AUTOSIZE   		=TBSTYLE_AUTOSIZE,    // 0x0010; automatically calculate the cx of the button
				BTNS_NOPREFIX   		=TBSTYLE_NOPREFIX,    // 0x0020; this button should not have accel prefix
				BTNS_SHOWTEXT   		=0x0040,              // ignored unless TBSTYLE_EX_MIXEDBUTTONS is set
				BTNS_WHOLEDROPDOWN  	=0x0080,

				HINST_COMMCTRL          =cast(HANDLE) -1,
				IDB_STD_SMALL_COLOR     =0,
				IDB_STD_LARGE_COLOR     =1,

				IDB_VIEW_SMALL_COLOR    =4,
				IDB_VIEW_LARGE_COLOR    =5,

				IDB_HIST_SMALL_COLOR    =8,
				IDB_HIST_LARGE_COLOR    =9,

// icon indexes for standard bitmap

				STD_CUT                 =0,
				STD_COPY                =1,
				STD_PASTE               =2,
				STD_UNDO                =3,
				STD_REDOW               =4,
				STD_DELETE              =5,
				STD_FILENEW             =6,
				STD_FILEOPEN            =7,
				STD_FILESAVE            =8,
				STD_PRINTPRE            =9,
				STD_PROPERTIES          =10,
				STD_HELP                =11,
				STD_FIND                =12,
				STD_REPLACE             =13,
				STD_PRINT               =14,

// icon indexes for standard view bitmap

				VIEW_LARGEICONS         =0,
				VIEW_SMALLICONS         =1,
				VIEW_LIST               =2,
				VIEW_DETAILS            =3,
				VIEW_SORTNAME           =4,
				VIEW_SORTSIZE           =5,
				VIEW_SORTDATE           =6,
				VIEW_SORTTYPE           =7,
				VIEW_PARENTFOLDER       =8,
				VIEW_NETCONNECT         =9,
				VIEW_NETDISCONNECT      =10,
				VIEW_NEWFOLDER          =11,
				VIEW_VIEWMENU           =12,

				HIST_BACK               =0,
				HIST_FORWARD            =1,
				HIST_FAVORITES          =2,
				HIST_ADDTOFAVORITES     =3,
				HIST_VIEWTREE           =4,
			}
			static enum
			{
				TB_ENABLEBUTTON         =(WM_USER + 1),
				TB_CHECKBUTTON          =(WM_USER + 2),
				TB_PRESSBUTTON          =(WM_USER + 3),
				TB_HIDEBUTTON           =(WM_USER + 4),
				TB_INDETERMINATE        =(WM_USER + 5),
				TB_MARKBUTTON           =(WM_USER + 6),
				TB_ISBUTTONENABLED      =(WM_USER + 9),
				TB_ISBUTTONCHECKED      =(WM_USER + 10),
				TB_ISBUTTONPRESSED      =(WM_USER + 11),
				TB_ISBUTTONHIDDEN       =(WM_USER + 12),
				TB_ISBUTTONINDETERMINATE =(WM_USER + 13),
				TB_ISBUTTONHIGHLIGHTED  =(WM_USER + 14),
				TB_SETSTATE             =(WM_USER + 17),
				TB_GETSTATE             =(WM_USER + 18),
				TB_ADDBITMAP            =(WM_USER + 19),
				TB_ADDBUTTONS           =(WM_USER + 20),
				TB_INSERTBUTTON         =(WM_USER + 21),
				TB_DELETEBUTTON         =(WM_USER + 22),
				TB_GETBUTTON            =(WM_USER + 23),
				TB_BUTTONCOUNT          =(WM_USER + 24),
				TB_COMMANDTOINDEX       =(WM_USER + 25),
				TB_SAVERESTOREA         =(WM_USER + 26),
				TB_SAVERESTOREW         =(WM_USER + 76),
				TB_CUSTOMIZE            =(WM_USER + 27),
				TB_ADDSTRINGA           =(WM_USER + 28),
				TB_ADDSTRINGW           =(WM_USER + 77),
				TB_GETITEMRECT          =(WM_USER + 29),
				TB_BUTTONSTRUCTSIZE     =(WM_USER + 30),
				TB_SETBUTTONSIZE        =(WM_USER + 31),
				TB_SETBITMAPSIZE        =(WM_USER + 32),
				TB_AUTOSIZE             =(WM_USER + 33),
				TB_GETTOOLTIPS          =(WM_USER + 35),
				TB_SETTOOLTIPS          =(WM_USER + 36),
				TB_SETPARENT            =(WM_USER + 37),
				TB_SETROWS              =(WM_USER + 39),
				TB_GETROWS              =(WM_USER + 40),
				TB_SETCMDID             =(WM_USER + 42),
				TB_CHANGEBITMAP         =(WM_USER + 43),
				TB_GETBITMAP            =(WM_USER + 44),
				TB_GETBUTTONTEXTA       =(WM_USER + 45),
				TB_GETBUTTONTEXTW       =(WM_USER + 75),
				TB_REPLACEBITMAP        =(WM_USER + 46),
				TB_SETINDENT            =(WM_USER + 47),
				TB_SETIMAGELIST         =(WM_USER + 48),
				TB_GETIMAGELIST         =(WM_USER + 49),
				TB_LOADIMAGES           =(WM_USER + 50),
				TB_GETRECT              =(WM_USER + 51),
				TB_SETHOTIMAGELIST      =(WM_USER + 52),
				TB_GETHOTIMAGELIST      =(WM_USER + 53),
				TB_SETDISABLEDIMAGELIST =(WM_USER + 54),
				TB_GETDISABLEDIMAGELIST =(WM_USER + 55),
				TB_SETSTYLE             =(WM_USER + 56),
				TB_GETSTYLE             =(WM_USER + 57),
				TB_GETBUTTONSIZE        =(WM_USER + 58),
				TB_SETBUTTONWIDTH       =(WM_USER + 59),
				TB_SETMAXTEXTROWS       =(WM_USER + 60),
				TB_GETTEXTROWS          =(WM_USER + 61),
				TB_GETOBJECT            =(WM_USER + 62),
				TB_GETHOTITEM           =(WM_USER + 71),
				TB_SETHOTITEM           =(WM_USER + 72),
				TB_SETANCHORHIGHLIGHT   =(WM_USER + 73),
				TB_GETANCHORHIGHLIGHT   =(WM_USER + 74),
				TB_MAPACCELERATORA      =(WM_USER + 78),
				TBIMHT_AFTER            =0x00000001,
				TBIMHT_BACKGROUND       =0x00000002,
				TB_GETINSERTMARK        =(WM_USER + 79),
				TB_SETINSERTMARK        =(WM_USER + 80),
				TB_INSERTMARKHITTEST    =(WM_USER + 81),
				TB_MOVEBUTTON           =(WM_USER + 82),
				TB_GETMAXSIZE           =(WM_USER + 83),
				TB_SETEXTENDEDSTYLE     =(WM_USER + 84),
				TB_GETEXTENDEDSTYLE     =(WM_USER + 85),
				TB_GETPADDING           =(WM_USER + 86),
				TB_SETPADDING           =(WM_USER + 87),
				TB_SETINSERTMARKCOLOR   =(WM_USER + 88),
				TB_GETINSERTMARKCOLOR   =(WM_USER + 89),
				TB_GETSTRINGA           =(WM_USER + 92),
			}
			void ChangeBitmap(int idButton,int idBitmap)///
			{
				SendMessageA(         // returns LRESULT in lResult
					handle,            // handle to destination control
					TB_CHANGEBITMAP,        // message ID
					idButton,               // = (WPARAM) (int) idButton
					idBitmap                // = (LPARAM) MAKELPARAM (iBitmap, 0)
				);
			}
			void Customize()///
			{
				SendMessageA(handle,TB_CUSTOMIZE,0,0);
			}
			int BitmapIdOfButton(int i)///
			{
				return SendMessageA(handle,TB_GETBITMAP,i,0);
			}
			void Insert(int Index,int Cmd,int style=0,int BitmapId=0,string Text="",bool enabled=true)///TODO
			{}

			int ButtonCount()///
			{
				return SendMessageA(handle,TB_BUTTONCOUNT,0,0);
			}
			void AutoSize()///
			{
				SendMessageA(handle,TB_AUTOSIZE,0,0);
			}
			void AddBitmap(HANDLE hBitmap,HINSTANCE hInst=cast(HANDLE) -1)///
			{
				TBADDBITMAP tb;
				tb.hInst=hInst;
				tb.nID=cast(uint*) hBitmap;
				SendMessageA(handle,TB_ADDBITMAP,1,cast(int) &tb);
			}
			void Add(string s)///TODO
			{

			}
			void Add(int Cmd,int BitmapId=0,int style=TBSTYLE_BUTTON,bool enabled=true)///
			{
				TBBUTTON tbb;
				tbb.iBitmap = BitmapId;
				tbb.idCommand = Cmd;
				tbb.fsState = cast(ubyte)(enabled?TBSTATE_ENABLED:TBSTATE_INDETERMINATE);
				tbb.fsStyle = cast(ubyte)style;
				SendMessageA(handle,TB_ADDBUTTONS,1,cast(int) &tbb);
			}
			void Add(int Cmd,string Text="",int style=TBSTYLE_BUTTON,bool enabled=true)///
			{
				TBBUTTON tbb;
				tbb.iBitmap = -1;
				tbb.idCommand = Cmd;
				tbb.fsState = cast(ubyte)(enabled?TBSTATE_ENABLED:TBSTATE_INDETERMINATE);
				tbb.fsStyle = cast(ubyte) style;
				tbb.iString = cast(int*) toz(Text);  // Text is in a buffer.
				SendMessageA(handle,TB_ADDBUTTONS,1,cast(int) &tbb);
			}
			this(Control par,int x,int y,int w,int h,int style=0,int exstyle=0)///
			{
				super(par,"ToolbarWindow32",x,y,w,h,style,exstyle);
				SendMessageA(handle,TB_BUTTONSTRUCTSIZE,TBBUTTON.sizeof,0);
			}
	}

