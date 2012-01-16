/***
*This file extends the std.c.windows.windows module
*/
module fx.win32;


/** Windows is a registered trademark of Microsoft Corporation in the United
States and other countries. */

public import std.c.windows.windows;
import std.c.windows.winsock;

extern(Windows)
	{
int MessageBoxW(HWND hWnd, wchar* lpText, wchar* lpCaption, uint uType);
		enum
		{
			/*
			 * Dialog Box Command IDs
			 */
			IDOK =                1,
			IDCANCEL =            2,
			IDABORT =             3,
			IDRETRY =             4,
			IDIGNORE =            5,
			IDYES =               6,
			IDNO =                7,

			IDCLOSE =         8,
			IDHELP =          9,


// end_r_winuser



			/*
			 * Control Manager Structures and Definitions
			 */

// end_r_winuser



			/*
			 * Edit Control Notification Codes
			 */
			EN_SETFOCUS =         0x0100,
			EN_KILLFOCUS =        0x0200,
			EN_CHANGE =           0x0300,
			EN_UPDATE =           0x0400,
			EN_ERRSPACE =         0x0500,
			EN_MAXTEXT =          0x0501,
			EN_HSCROLL =          0x0601,
			EN_VSCROLL =          0x0602,


			/* Edit control EM_SETMARGIN parameters */
			EC_LEFTMARGIN =       0x0001,
			EC_RIGHTMARGIN =      0x0002,
			EC_USEFONTINFO =      0xffff,




// begin_r_winuser

			/*
			 * Edit Control Messages
			 */
			EM_GETSEL =               0x00B0,
			EM_SETSEL =               0x00B1,
			EM_GETRECT =              0x00B2,
			EM_SETRECT =              0x00B3,
			EM_SETRECTNP =            0x00B4,
			EM_SCROLL =               0x00B5,
			EM_LINESCROLL =           0x00B6,
			EM_SCROLLCARET =          0x00B7,
			EM_GETMODIFY =            0x00B8,
			EM_SETMODIFY =            0x00B9,
			EM_GETLINECOUNT =         0x00BA,
			EM_LINEINDEX =            0x00BB,
			EM_SETHANDLE =            0x00BC,
			EM_GETHANDLE =            0x00BD,
			EM_GETTHUMB =             0x00BE,
			EM_LINELENGTH =           0x00C1,
			EM_REPLACESEL =           0x00C2,
			EM_GETLINE =              0x00C4,
			EM_LIMITTEXT =            0x00C5,
			EM_CANUNDO =              0x00C6,
			EM_UNDO =                 0x00C7,
			EM_FMTLINES =             0x00C8,
			EM_LINEFROMCHAR =         0x00C9,
			EM_SETTABSTOPS =          0x00CB,
			EM_SETPASSWORDCHAR =      0x00CC,
			EM_EMPTYUNDOBUFFER =      0x00CD,
			EM_GETFIRSTVISIBLELINE =  0x00CE,
			EM_SETREADONLY =          0x00CF,
			EM_SETWORDBREAKPROC =     0x00D0,
			EM_GETWORDBREAKPROC =     0x00D1,
			EM_GETPASSWORDCHAR =      0x00D2,

			EM_SETMARGINS =           0x00D3,
			EM_GETMARGINS =           0x00D4,
			EM_SETLIMITTEXT =         EM_LIMITTEXT, /* ;win40 Name change */
			EM_GETLIMITTEXT =         0x00D5,
			EM_POSFROMCHAR =          0x00D6,
			EM_CHARFROMPOS =          0x00D7,



// end_r_winuser


			/*
			 * EDITWORDBREAKPROC code values
			 */
			WB_LEFT =            0,
			WB_RIGHT =           1,
			WB_ISDELIMITER =     2,

// begin_r_winuser

			/*
			 * Button Control Styles
			 */
			BS_PUSHBUTTON =       0x00000000,
			BS_DEFPUSHBUTTON =    0x00000001,
			BS_CHECKBOX =         0x00000002,
			BS_AUTOCHECKBOX =     0x00000003,
			BS_RADIOBUTTON =      0x00000004,
			BS_3STATE =           0x00000005,
			BS_AUTO3STATE =       0x00000006,
			BS_GROUPBOX =         0x00000007,
			BS_USERBUTTON =       0x00000008,
			BS_AUTORADIOBUTTON =  0x00000009,
			BS_OWNERDRAW =        0x0000000B,
			BS_LEFTTEXT =         0x00000020,

			BS_TEXT =             0x00000000,
			BS_ICON =             0x00000040,
			BS_BITMAP =           0x00000080,
			BS_LEFT =             0x00000100,
			BS_RIGHT =            0x00000200,
			BS_CENTER =           0x00000300,
			BS_TOP =              0x00000400,
			BS_BOTTOM =           0x00000800,
			BS_VCENTER =          0x00000C00,
			BS_PUSHLIKE =         0x00001000,
			BS_MULTILINE =        0x00002000,
			BS_NOTIFY =           0x00004000,
			BS_FLAT =             0x00008000,
			BS_RIGHTBUTTON =      BS_LEFTTEXT,



			/*
			 * User Button Notification Codes
			 */
			BN_CLICKED =          0,
			BN_PAINT =            1,
			BN_HILITE =           2,
			BN_UNHILITE =         3,
			BN_DISABLE =          4,
			BN_DOUBLECLICKED =    5,

			BN_PUSHED =           BN_HILITE,
			BN_UNPUSHED =         BN_UNHILITE,
			BN_DBLCLK =           BN_DOUBLECLICKED,
			BN_SETFOCUS =         6,
			BN_KILLFOCUS =        7,

			/*
			 * Button Control Messages
			 */
			BM_GETCHECK =        0x00F0,
			BM_SETCHECK =        0x00F1,
			BM_GETSTATE =        0x00F2,
			BM_SETSTATE =        0x00F3,
			BM_SETSTYLE =        0x00F4,

			BM_CLICK =           0x00F5,
			BM_GETIMAGE =        0x00F6,
			BM_SETIMAGE =        0x00F7,

			BST_UNCHECKED =      0x0000,
			BST_CHECKED =        0x0001,
			BST_INDETERMINATE =  0x0002,
			BST_PUSHED =         0x0004,
			BST_FOCUS =          0x0008,


			/*
			 * Static Control Constants
			 */
			SS_LEFT =             0x00000000,
			SS_CENTER =           0x00000001,
			SS_RIGHT =            0x00000002,
			SS_ICON =             0x00000003,
			SS_BLACKRECT =        0x00000004,
			SS_GRAYRECT =         0x00000005,
			SS_WHITERECT =        0x00000006,
			SS_BLACKFRAME =       0x00000007,
			SS_GRAYFRAME =        0x00000008,
			SS_WHITEFRAME =       0x00000009,
			SS_USERITEM =         0x0000000A,
			SS_SIMPLE =           0x0000000B,
			SS_LEFTNOWORDWRAP =   0x0000000C,

			SS_OWNERDRAW =        0x0000000D,
			SS_BITMAP =           0x0000000E,
			SS_ENHMETAFILE =      0x0000000F,
			SS_ETCHEDHORZ =       0x00000010,
			SS_ETCHEDVERT =       0x00000011,
			SS_ETCHEDFRAME =      0x00000012,
			SS_TYPEMASK =         0x0000001F,

			SS_NOPREFIX =         0x00000080, /* Don't do "&" character translation */

			SS_NOTIFY =           0x00000100,
			SS_CENTERIMAGE =      0x00000200,
			SS_RIGHTJUST =        0x00000400,
			SS_REALSIZEIMAGE =    0x00000800,
			SS_SUNKEN =           0x00001000,
			SS_ENDELLIPSIS =      0x00004000,
			SS_PATHELLIPSIS =     0x00008000,
			SS_WORDELLIPSIS =     0x0000C000,
			SS_ELLIPSISMASK =     0x0000C000,


// end_r_winuser


			/*
			 * Static Control Mesages
			 */
			STM_SETICON =         0x0170,
			STM_GETICON =         0x0171,

			STM_SETIMAGE =        0x0172,
			STM_GETIMAGE =        0x0173,
			STN_CLICKED =         0,
			STN_DBLCLK =          1,
			STN_ENABLE =          2,
			STN_DISABLE =         3,

			STM_MSGMAX =          0x0174,
		}


		enum
		{
			/*
			 * Window Messages
			 */

			WM_NULL =                         0x0000,
			WM_CREATE =                       0x0001,
			WM_DESTROY =                      0x0002,
			WM_MOVE =                         0x0003,
			WM_SIZE =                         0x0005,

			WM_ACTIVATE =                     0x0006,
			/*
			 * WM_ACTIVATE state values
			 */
			WA_INACTIVE =     0,
			WA_ACTIVE =       1,
			WA_CLICKACTIVE =  2,

			WM_SETFOCUS =                     0x0007,
			WM_KILLFOCUS =                    0x0008,
			WM_ENABLE =                       0x000A,
			WM_SETREDRAW =                    0x000B,
			WM_SETTEXT =                      0x000C,
			WM_GETTEXT =                      0x000D,
			WM_GETTEXTLENGTH =                0x000E,
			WM_PAINT =                        0x000F,
			WM_CLOSE =                        0x0010,
			WM_QUERYENDSESSION =              0x0011,
			WM_QUIT =                         0x0012,
			WM_QUERYOPEN =                    0x0013,
			WM_ERASEBKGND =                   0x0014,
			WM_SYSCOLORCHANGE =               0x0015,
			WM_ENDSESSION =                   0x0016,
			WM_SHOWWINDOW =                   0x0018,
			WM_WININICHANGE =                 0x001A,

			WM_SETTINGCHANGE =                WM_WININICHANGE,



			WM_DEVMODECHANGE =                0x001B,
			WM_ACTIVATEAPP =                  0x001C,
			WM_FONTCHANGE =                   0x001D,
			WM_TIMECHANGE =                   0x001E,
			WM_CANCELMODE =                   0x001F,
			WM_SETCURSOR =                    0x0020,
			WM_MOUSEACTIVATE =                0x0021,
			WM_CHILDACTIVATE =                0x0022,
			WM_QUEUESYNC =                    0x0023,

			WM_GETMINMAXINFO =                0x0024,
		}

		export
		{
			BOOL   RoundRect(HDC, int, int, int, int, int, int);
			BOOL   ResizePalette(HPALETTE, UINT);
			int    SaveDC(HDC);
			int    SelectClipRgn(HDC, HRGN);
			int    ExtSelectClipRgn(HDC, HRGN, int);
			int    SetMetaRgn(HDC);
			HGDIOBJ   SelectObject(HDC, HGDIOBJ);
			HPALETTE   SelectPalette(HDC, HPALETTE, BOOL);
			COLORREF   SetBkColor(HDC, COLORREF);
			int     SetBkMode(HDC, int);
			LONG    SetBitmapBits(HBITMAP, DWORD, void *);
			UINT    SetBoundsRect(HDC,   RECT *, UINT);
			int     SetDIBits(HDC, HBITMAP, UINT, UINT, void *, BITMAPINFO *, UINT);
			int     SetDIBitsToDevice(HDC, int, int, DWORD, DWORD, int,
									  int, UINT, UINT, void *, BITMAPINFO *, UINT);
			DWORD   SetMapperFlags(HDC, DWORD);
			int     SetGraphicsMode(HDC hdc, int iMode);
			int     SetMapMode(HDC, int);
			HMETAFILE     SetMetaFileBitsEx(UINT, BYTE *);
			UINT    SetPaletteEntries(HPALETTE, UINT, UINT, PALETTEENTRY *);
			COLORREF   SetPixel(HDC, int, int, COLORREF);
			BOOL     SetPixelV(HDC, int, int, COLORREF);
			BOOL    SetPixelFormat(HDC, int,PIXELFORMATDESCRIPTOR*);
			int     SetPolyFillMode(HDC, int);
			BOOL    StretchBlt(HDC, int, int, int, int, HDC, int, int, int, int, DWORD);
			BOOL    SetRectRgn(HRGN, int, int, int, int);
			int     StretchDIBits(HDC, int, int, int, int, int, int, int, int,
								  void *, BITMAPINFO *, UINT, DWORD);
			int     SetROP2(HDC, int);
			int     SetStretchBltMode(HDC, int);
			UINT    SetSystemPaletteUse(HDC, UINT);
			int     SetTextCharacterExtra(HDC, int);
			COLORREF   SetTextColor(HDC, COLORREF);
			UINT    SetTextAlign(HDC, UINT);
			BOOL    SetTextJustification(HDC, int, int);
			BOOL    UpdateColors(HDC);
		}

		/* Text Alignment Options */
		enum
		{
			TA_NOUPDATECP =                0,
			TA_UPDATECP =                  1,

			TA_LEFT =                      0,
			TA_RIGHT =                     2,
			TA_CENTER =                    6,

			TA_TOP =                       0,
			TA_BOTTOM =                    8,
			TA_BASELINE =                  24,

			TA_RTLREADING =                256,
			TA_MASK = (TA_BASELINE+TA_CENTER+TA_UPDATECP+TA_RTLREADING),
		}

		struct POINT
			{
				LONG  x;
				LONG  y;
			}
		alias POINT* PPOINT, NPPOINT, LPPOINT;


		export
		{
			BOOL    MoveToEx(HDC, int, int, LPPOINT);
			BOOL    TextOutA(HDC, int, int, LPCSTR, int);
			BOOL    TextOutW(HDC, int, int, LPCWSTR, int);
		}

		export void PostQuitMessage(int nExitCode);
		export LRESULT DefWindowProcA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
		export HMODULE GetModuleHandleA(LPCSTR lpModuleName);

		alias LRESULT function(HWND,UINT,WPARAM,LPARAM) WNDPROC;

		struct WNDCLASSEXA
			{
				UINT        cbSize;
				/* Win 3.x */
				UINT        style;
				WNDPROC     lpfnWndProc;
				int         cbClsExtra;
				int         cbWndExtra;
				HINSTANCE   hInstance;
				HICON       hIcon;
				HCURSOR     hCursor;
				HBRUSH      hbrBackground;
				LPCSTR      lpszMenuName;
				LPCSTR      lpszClassName;
				/* Win 4.0 */
				HICON       hIconSm;
			}
		alias WNDCLASSEXA* PWNDCLASSEXA, NPWNDCLASSEXA, LPWNDCLASSEXA;


		struct WNDCLASSA
			{
				UINT        style;
				WNDPROC     lpfnWndProc;
				int         cbClsExtra;
				int         cbWndExtra;
				HINSTANCE   hInstance;
				HICON       hIcon;
				HCURSOR     hCursor;
				HBRUSH      hbrBackground;
				LPCSTR      lpszMenuName;
				LPCSTR      lpszClassName;
			}
		alias WNDCLASSA* PWNDCLASSA, NPWNDCLASSA, LPWNDCLASSA;
		alias WNDCLASSA WNDCLASS;

		/*
		 * Window Styles
		 */
	enum :
		uint
		{
			WS_OVERLAPPED =       0x00000000,
			WS_POPUP =            0x80000000,
			WS_CHILD =            0x40000000,
			WS_MINIMIZE =         0x20000000,
			WS_VISIBLE =          0x10000000,
			WS_DISABLED =         0x08000000,
			WS_CLIPSIBLINGS =     0x04000000,
			WS_CLIPCHILDREN =     0x02000000,
			WS_MAXIMIZE =         0x01000000,
			WS_CAPTION =          0x00C00000,  /* WS_BORDER | WS_DLGFRAME  */
			WS_BORDER =           0x00800000,
			WS_DLGFRAME =         0x00400000,
			WS_VSCROLL =          0x00200000,
			WS_HSCROLL =          0x00100000,
			WS_SYSMENU =          0x00080000,
			WS_THICKFRAME =       0x00040000,
			WS_GROUP =            0x00020000,
			WS_TABSTOP =          0x00010000,

			WS_MINIMIZEBOX =      0x00020000,
			WS_MAXIMIZEBOX =      0x00010000,

			WS_TILED =            WS_OVERLAPPED,
			WS_ICONIC =           WS_MINIMIZE,
			WS_SIZEBOX =          WS_THICKFRAME,

			/*
			 * Common Window Styles
			 */
			WS_OVERLAPPEDWINDOW = (WS_OVERLAPPED |            WS_CAPTION |  WS_SYSMENU |  WS_THICKFRAME |            WS_MINIMIZEBOX |                 WS_MAXIMIZEBOX),
			WS_TILEDWINDOW =      WS_OVERLAPPEDWINDOW,
			WS_POPUPWINDOW = (WS_POPUP |  WS_BORDER |  WS_SYSMENU),
			WS_CHILDWINDOW = (WS_CHILD),
		}

		/*
		 * Class styles
		 */
		enum
		{
			CS_VREDRAW =          0x0001,
			CS_HREDRAW =          0x0002,
			CS_KEYCVTWINDOW =     0x0004,
			CS_DBLCLKS =          0x0008,
			CS_OWNDC =            0x0020,
			CS_CLASSDC =          0x0040,
			CS_PARENTDC =         0x0080,
			CS_NOKEYCVT =         0x0100,
			CS_NOCLOSE =          0x0200,
			CS_SAVEBITS =         0x0800,
			CS_BYTEALIGNCLIENT =  0x1000,
			CS_BYTEALIGNWINDOW =  0x2000,
			CS_GLOBALCLASS =      0x4000,


			CS_IME =              0x00010000,
		}

		export
		{
			HICON LoadIconA(HINSTANCE hInstance, LPCSTR lpIconName);
			HICON LoadIconW(HINSTANCE hInstance, LPCWSTR lpIconName);
			HCURSOR LoadCursorA(HINSTANCE hInstance, LPCSTR lpCursorName);
			HCURSOR LoadCursorW(HINSTANCE hInstance, LPCWSTR lpCursorName);
		}

	enum :
		LPSTR
		{
			IDI_APPLICATION =     cast(LPSTR)(32512),

			IDC_ARROW =           cast(LPSTR)(32512),
			IDC_CROSS =           cast(LPSTR)(32515),
		}

		/*
		 * Color Types
		 */
		enum
		{
			CTLCOLOR_MSGBOX =         0,
			CTLCOLOR_EDIT =           1,
			CTLCOLOR_LISTBOX =        2,
			CTLCOLOR_BTN =            3,
			CTLCOLOR_DLG =            4,
			CTLCOLOR_SCROLLBAR =      5,
			CTLCOLOR_STATIC =         6,
			CTLCOLOR_MAX =            7,

			COLOR_SCROLLBAR =         0,
			COLOR_BACKGROUND =        1,
			COLOR_ACTIVECAPTION =     2,
			COLOR_INACTIVECAPTION =   3,
			COLOR_MENU =              4,
			COLOR_WINDOW =            5,
			COLOR_WINDOWFRAME =       6,
			COLOR_MENUTEXT =          7,
			COLOR_WINDOWTEXT =        8,
			COLOR_CAPTIONTEXT =       9,
			COLOR_ACTIVEBORDER =      10,
			COLOR_INACTIVEBORDER =    11,
			COLOR_APPWORKSPACE =      12,
			COLOR_HIGHLIGHT =         13,
			COLOR_HIGHLIGHTTEXT =     14,
			COLOR_BTNFACE =           15,
			COLOR_BTNSHADOW =         16,
			COLOR_GRAYTEXT =          17,
			COLOR_BTNTEXT =           18,
			COLOR_INACTIVECAPTIONTEXT = 19,
			COLOR_BTNHIGHLIGHT =      20,


			COLOR_3DDKSHADOW =        21,
			COLOR_3DLIGHT =           22,
			COLOR_INFOTEXT =          23,
			COLOR_INFOBK =            24,

			COLOR_DESKTOP =           COLOR_BACKGROUND,
			COLOR_3DFACE =            COLOR_BTNFACE,
			COLOR_3DSHADOW =          COLOR_BTNSHADOW,
			COLOR_3DHIGHLIGHT =       COLOR_BTNHIGHLIGHT,
			COLOR_3DHILIGHT =         COLOR_BTNHIGHLIGHT,
			COLOR_BTNHILIGHT =        COLOR_BTNHIGHLIGHT,
		}

		/*
		 * Special value for CreateWindow, et al.
		 */
	enum :
		HWND
		{
			HWND_DESKTOP = cast(HWND)0,
		}

		export ATOM RegisterClassA(WNDCLASSA *lpWndClass);

		export HWND CreateWindowExA(
			DWORD dwExStyle,
			LPCSTR lpClassName,
			LPCSTR lpWindowName,
			DWORD dwStyle,
			int X,
			int Y,
			int nWidth,
			int nHeight,
			HWND hWndParent ,
			HMENU hMenu,
			HINSTANCE hInstance,
			LPVOID lpParam);


		HWND CreateWindowA(
			LPCSTR lpClassName,
			LPCSTR lpWindowName,
			DWORD dwStyle,
			int X,
			int Y,
			int nWidth,
			int nHeight,
			HWND hWndParent ,
			HMENU hMenu,
			HINSTANCE hInstance,
			LPVOID lpParam)
		{
			return CreateWindowExA(0, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam);
		}

		/*
		 * Message structure
		 */
		struct MSG
			{
				HWND        hwnd;
				UINT        message;
				WPARAM      wParam;
				LPARAM      lParam;
				DWORD       time;
				POINT       pt;
			}
		alias MSG* PMSG, NPMSG, LPMSG;

		export
		{
			BOOL GetMessageA(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);
			BOOL TranslateMessage(MSG *lpMsg);
			LONG DispatchMessageA(MSG *lpMsg);
			BOOL PeekMessageA(MSG *lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, UINT wRemoveMsg);
			HWND GetFocus();
		}

		export DWORD ExpandEnvironmentStringsA(LPCSTR lpSrc, LPSTR lpDst, DWORD nSize);

		export
		{
			BOOL IsValidCodePage(UINT CodePage);
			UINT GetACP();
			UINT GetOEMCP();
//BOOL GetCPInfo(UINT CodePage, LPCPINFO lpCPInfo);
			BOOL IsDBCSLeadByte(BYTE TestChar);
			BOOL IsDBCSLeadByteEx(UINT CodePage, BYTE TestChar);
			int MultiByteToWideChar(UINT CodePage, DWORD dwFlags, LPCSTR lpMultiByteStr, int cchMultiByte, LPWSTR lpWideCharStr, int cchWideChar);
			int WideCharToMultiByte(UINT CodePage, DWORD dwFlags, LPCWSTR lpWideCharStr, int cchWideChar, LPSTR lpMultiByteStr, int cchMultiByte, LPCSTR lpDefaultChar, LPBOOL lpUsedDefaultChar);
		}

		export HANDLE CreateFileMappingA(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCSTR lpName);
		export HANDLE CreateFileMappingW(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCWSTR lpName);

		export BOOL GetMailslotInfo(HANDLE hMailslot, LPDWORD lpMaxMessageSize, LPDWORD lpNextSize, LPDWORD lpMessageCount, LPDWORD lpReadTimeout);
		export BOOL SetMailslotInfo(HANDLE hMailslot, DWORD lReadTimeout);
		export LPVOID MapViewOfFile(HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, DWORD dwNumberOfBytesToMap);
		export LPVOID MapViewOfFileEx(HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, DWORD dwNumberOfBytesToMap, LPVOID lpBaseAddress);
		export BOOL FlushViewOfFile(LPCVOID lpBaseAddress, DWORD dwNumberOfBytesToFlush);
		export BOOL UnmapViewOfFile(LPCVOID lpBaseAddress);

		export  HGDIOBJ   GetStockObject(int);
		export BOOL ShowWindow(HWND hWnd, int nCmdShow);

		/* Stock Logical Objects */
		enum
		{	WHITE_BRUSH =         0,
		  LTGRAY_BRUSH =        1,
		  GRAY_BRUSH =          2,
		  DKGRAY_BRUSH =        3,
		  BLACK_BRUSH =         4,
		  NULL_BRUSH =          5,
		  HOLLOW_BRUSH =        NULL_BRUSH,
		  WHITE_PEN =           6,
		  BLACK_PEN =           7,
		  NULL_PEN =            8,
		  OEM_FIXED_FONT =      10,
		  ANSI_FIXED_FONT =     11,
		  ANSI_VAR_FONT =       12,
		  SYSTEM_FONT =         13,
		  DEVICE_DEFAULT_FONT = 14,
		  DEFAULT_PALETTE =     15,
		  SYSTEM_FIXED_FONT =   16,
		  DEFAULT_GUI_FONT =    17,
		  STOCK_LAST =          17,

		DC_BRUSH            =18,
		DC_PEN              =19,
		}

		/*
		 * ShowWindow() Commands
		 */
		enum
		{	SW_HIDE =             0,
		  SW_SHOWNORMAL =       1,
		  SW_NORMAL =           1,
		  SW_SHOWMINIMIZED =    2,
		  SW_SHOWMAXIMIZED =    3,
		  SW_MAXIMIZE =         3,
		  SW_SHOWNOACTIVATE =   4,
		  SW_SHOW =             5,
		  SW_MINIMIZE =         6,
		  SW_SHOWMINNOACTIVE =  7,
		  SW_SHOWNA =           8,
		  SW_RESTORE =          9,
		  SW_SHOWDEFAULT =      10,
		  SW_MAX =              10,
		}

		struct TEXTMETRICA
			{
				LONG        tmHeight;
				LONG        tmAscent;
				LONG        tmDescent;
				LONG        tmInternalLeading;
				LONG        tmExternalLeading;
				LONG        tmAveCharWidth;
				LONG        tmMaxCharWidth;
				LONG        tmWeight;
				LONG        tmOverhang;
				LONG        tmDigitizedAspectX;
				LONG        tmDigitizedAspectY;
				BYTE        tmFirstChar;
				BYTE        tmLastChar;
				BYTE        tmDefaultChar;
				BYTE        tmBreakChar;
				BYTE        tmItalic;
				BYTE        tmUnderlined;
				BYTE        tmStruckOut;
				BYTE        tmPitchAndFamily;
				BYTE        tmCharSet;
			}

		export  BOOL   GetTextMetricsA(HDC, TEXTMETRICA*);

		/*
		 * Scroll Bar Constants
		 */
		enum
		{	SB_HORZ =             0,
		  SB_VERT =             1,
		  SB_CTL =              2,
		  SB_BOTH =             3,
		}

		/*
		 * Scroll Bar Commands
		 */
		enum
		{	SB_LINEUP =           0,
		  SB_LINELEFT =         0,
		  SB_LINEDOWN =         1,
		  SB_LINERIGHT =        1,
		  SB_PAGEUP =           2,
		  SB_PAGELEFT =         2,
		  SB_PAGEDOWN =         3,
		  SB_PAGERIGHT =        3,
		  SB_THUMBPOSITION =    4,
		  SB_THUMBTRACK =       5,
		  SB_TOP =              6,
		  SB_LEFT =             6,
		  SB_BOTTOM =           7,
		  SB_RIGHT =            7,
		  SB_ENDSCROLL =        8,
		}

		export int SetScrollPos(HWND hWnd, int nBar, int nPos, BOOL bRedraw);
		export int GetScrollPos(HWND hWnd, int nBar);
		export BOOL SetScrollRange(HWND hWnd, int nBar, int nMinPos, int nMaxPos, BOOL bRedraw);
		export BOOL GetScrollRange(HWND hWnd, int nBar, LPINT lpMinPos, LPINT lpMaxPos);
		export BOOL ShowScrollBar(HWND hWnd, int wBar, BOOL bShow);
		export BOOL EnableScrollBar(HWND hWnd, UINT wSBflags, UINT wArrows);

		/*
		 * LockWindowUpdate API
		 */

		export BOOL LockWindowUpdate(HWND hWndLock);
		export BOOL ScrollWindow(HWND hWnd, int XAmount, int YAmount, RECT* lpRect, RECT* lpClipRect);
		export BOOL ScrollDC(HDC hDC, int dx, int dy, RECT* lprcScroll, RECT* lprcClip, HRGN hrgnUpdate, LPRECT lprcUpdate);
		export int ScrollWindowEx(HWND hWnd, int dx, int dy, RECT* prcScroll, RECT* prcClip, HRGN hrgnUpdate, LPRECT prcUpdate, UINT flags);

		export LRESULT SendMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
		export LRESULT SendMessageW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);

		alias UINT function(HWND,UINT,WPARAM,LPARAM) LPOFNHOOKPROC;

		struct OPENFILENAMEA
			{
				DWORD        lStructSize;
				HWND         hwndOwner;
				HINSTANCE    hInstance;
				LPCSTR       lpstrFilter;
				LPSTR        lpstrCustomFilter;
				DWORD        nMaxCustFilter;
				DWORD        nFilterIndex;
				LPSTR        lpstrFile;
				DWORD        nMaxFile;
				LPSTR        lpstrFileTitle;
				DWORD        nMaxFileTitle;
				LPCSTR       lpstrInitialDir;
				LPCSTR       lpstrTitle;
				DWORD        Flags;
				WORD         nFileOffset;
				WORD         nFileExtension;
				LPCSTR       lpstrDefExt;
				LPARAM       lCustData;
				LPOFNHOOKPROC lpfnHook;
				LPCSTR       lpTemplateName;
			}
		alias OPENFILENAMEA *LPOPENFILENAMEA;

		struct OPENFILENAMEW
			{
				DWORD        lStructSize;
				HWND         hwndOwner;
				HINSTANCE    hInstance;
				wchar*      lpstrFilter;
				wchar*       lpstrCustomFilter;
				DWORD        nMaxCustFilter;
				DWORD        nFilterIndex;
				wchar*       lpstrFile;
				DWORD        nMaxFile;
				wchar*       lpstrFileTitle;
				DWORD        nMaxFileTitle;
				wchar*      lpstrInitialDir;
				wchar*      lpstrTitle;
				DWORD        Flags;
				WORD         nFileOffset;
				WORD         nFileExtension;
				wchar*      lpstrDefExt;
				int       lCustData;
				LPOFNHOOKPROC lpfnHook;
				wchar*      lpTemplateName;
			}
		alias OPENFILENAMEW *LPOPENFILENAMEW;

		BOOL          GetOpenFileNameA(LPOPENFILENAMEA);
		BOOL          GetOpenFileNameW(LPOPENFILENAMEW);

		BOOL          GetSaveFileNameA(LPOPENFILENAMEA);
		BOOL          GetSaveFileNameW(LPOPENFILENAMEW);

		short         GetFileTitleA(LPCSTR, LPSTR, WORD);
		short         GetFileTitleW(LPCWSTR, LPWSTR, WORD);

		enum
		{
			PM_NOREMOVE =         0x0000,
			PM_REMOVE =           0x0001,
			PM_NOYIELD =          0x0002,
		}

		/* Bitmap Header Definition */
		struct BITMAP
			{
				LONG        bmType;
				LONG        bmWidth;
				LONG        bmHeight;
				LONG        bmWidthBytes;
				WORD        bmPlanes;
				WORD        bmBitsPixel;
				LPVOID      bmBits;
			}
		alias BITMAP* PBITMAP, NPBITMAP, LPBITMAP;


		export  HDC       CreateCompatibleDC(HDC);

		export  int     GetObjectA(HGDIOBJ, int, LPVOID);
		export  int     GetObjectW(HGDIOBJ, int, LPVOID);
		export  BOOL   DeleteDC(HDC);

		struct LOGFONTA
			{
				LONG      lfHeight;
				LONG      lfWidth;
				LONG      lfEscapement;
				LONG      lfOrientation;
				LONG      lfWeight;
				BYTE      lfItalic;
				BYTE      lfUnderline;
				BYTE      lfStrikeOut;
				BYTE      lfCharSet;
				BYTE      lfOutPrecision;
				BYTE      lfClipPrecision;
				BYTE      lfQuality;
				BYTE      lfPitchAndFamily;
				CHAR      lfFaceName[32 ];
			}
		alias LOGFONTA* PLOGFONTA, NPLOGFONTA, LPLOGFONTA;

		export HMENU LoadMenuA(HINSTANCE hInstance, LPCSTR lpMenuName);
		export HMENU LoadMenuW(HINSTANCE hInstance, LPCWSTR lpMenuName);

		export HMENU GetSubMenu(HMENU hMenu, int nPos);

		export HBITMAP LoadBitmapA(HINSTANCE hInstance, LPCSTR lpBitmapName);
		export HBITMAP LoadBitmapW(HINSTANCE hInstance, LPCWSTR lpBitmapName);

		LPSTR MAKEINTRESOURCEA(int i)
		{
			return cast(LPSTR)(cast(DWORD)(cast(WORD)(i)));
		}

		export  HFONT     CreateFontIndirectA(LOGFONTA *);

		export BOOL MessageBeep(UINT uType);
		export int ShowCursor(BOOL bShow);
		export BOOL SetCursorPos(int X, int Y);
		export HCURSOR SetCursor(HCURSOR hCursor);
		export BOOL GetCursorPos(LPPOINT lpPoint);
		export BOOL ClipCursor(RECT *lpRect);
		export BOOL GetClipCursor(LPRECT lpRect);
		export HCURSOR GetCursor();
		export BOOL CreateCaret(HWND hWnd, HBITMAP hBitmap , int nWidth, int nHeight);
		export UINT GetCaretBlinkTime();
		export BOOL SetCaretBlinkTime(UINT uMSeconds);
		export BOOL DestroyCaret();
		export BOOL HideCaret(HWND hWnd);
		export BOOL ShowCaret(HWND hWnd);
		export BOOL SetCaretPos(int X, int Y);
		export BOOL GetCaretPos(LPPOINT lpPoint);
		export BOOL ClientToScreen(HWND hWnd, LPPOINT lpPoint);
		export BOOL ScreenToClient(HWND hWnd, LPPOINT lpPoint);
		export int MapWindowPoints(HWND hWndFrom, HWND hWndTo, LPPOINT lpPoints, UINT cPoints);
		export HWND WindowFromPoint(POINT Point);
		export HWND ChildWindowFromPoint(HWND hWndParent, POINT Point);


		export BOOL TrackPopupMenu(HMENU hMenu, UINT uFlags, int x, int y,
								   int nReserved, HWND hWnd, RECT *prcRect);

		align(2) struct DLGTEMPLATE
			{
				DWORD style;
				DWORD dwExtendedStyle;
				WORD cdit;
				short x;
				short y;
				short cx;
				short cy;
			}
		alias DLGTEMPLATE *LPDLGTEMPLATEA;
		alias DLGTEMPLATE *LPDLGTEMPLATEW;


		alias LPDLGTEMPLATEA LPDLGTEMPLATE;

		alias  DLGTEMPLATE *LPCDLGTEMPLATEA;
		alias  DLGTEMPLATE *LPCDLGTEMPLATEW;


		alias LPCDLGTEMPLATEA LPCDLGTEMPLATE;


		export int DialogBoxParamA(HINSTANCE hInstance, LPCSTR lpTemplateName,
								   HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
		export int DialogBoxIndirectParamA(HINSTANCE hInstance,
										   LPCDLGTEMPLATEA hDialogTemplate, HWND hWndParent, DLGPROC lpDialogFunc,
										   LPARAM dwInitParam);

	enum :
		DWORD
		{
			SRCCOPY =             cast(DWORD)0x00CC0020, /* dest = source                   */
			SRCPAINT =            cast(DWORD)0x00EE0086, /* dest = source OR dest           */
			SRCAND =              cast(DWORD)0x008800C6, /* dest = source AND dest          */
			SRCINVERT =           cast(DWORD)0x00660046, /* dest = source XOR dest          */
			SRCERASE =            cast(DWORD)0x00440328, /* dest = source AND (NOT dest)   */
			NOTSRCCOPY =          cast(DWORD)0x00330008, /* dest = (NOT source)             */
			NOTSRCERASE =         cast(DWORD)0x001100A6, /* dest = (NOT src) AND (NOT dest) */
			MERGECOPY =           cast(DWORD)0x00C000CA, /* dest = (source AND pattern)     */
			MERGEPAINT =          cast(DWORD)0x00BB0226, /* dest = (NOT source) OR dest     */
			PATCOPY =             cast(DWORD)0x00F00021, /* dest = pattern                  */
			PATPAINT =            cast(DWORD)0x00FB0A09, /* dest = DPSnoo                   */
			PATINVERT =           cast(DWORD)0x005A0049, /* dest = pattern XOR dest         */
			DSTINVERT =           cast(DWORD)0x00550009, /* dest = (NOT dest)               */
			BLACKNESS =           cast(DWORD)0x00000042, /* dest = BLACK                    */
			WHITENESS =           cast(DWORD)0x00FF0062, /* dest = WHITE                    */
		}

		enum
		{
			SND_SYNC =            0x0000, /* play synchronously (default) */
			SND_ASYNC =           0x0001, /* play asynchronously */
			SND_NODEFAULT =       0x0002, /* silence (!default) if sound not found */
			SND_MEMORY =          0x0004, /* pszSound points to a memory file */
			SND_LOOP =            0x0008, /* loop the sound until next sndPlaySound */
			SND_NOSTOP =          0x0010, /* don't stop any currently playing sound */

			SND_NOWAIT =	0x00002000, /* don't wait if the driver is busy */
			SND_ALIAS =       0x00010000, /* name is a registry alias */
			SND_ALIAS_ID =	0x00110000, /* alias is a predefined ID */
			SND_FILENAME =    0x00020000, /* name is file name */
			SND_RESOURCE =    0x00040004, /* name is resource name or atom */

			SND_PURGE =           0x0040, /* purge non-static events for task */
			SND_APPLICATION =     0x0080, /* look for application specific association */


			SND_ALIAS_START =	0,     /* alias base */
		}

		export  BOOL   PlaySoundA(LPCSTR pszSound, HMODULE hmod, DWORD fdwSound);
		export  BOOL   PlaySoundW(LPCWSTR pszSound, HMODULE hmod, DWORD fdwSound);

		export  int     GetClipBox(HDC, LPRECT);
		export  int     GetClipRgn(HDC, HRGN);
		export  int     GetMetaRgn(HDC, HRGN);
		export  HGDIOBJ   GetCurrentObject(HDC, UINT);
		export  BOOL    GetCurrentPositionEx(HDC, LPPOINT);
		export  int     GetDeviceCaps(HDC, int);

		struct LOGPEN
			{
				UINT        lopnStyle;
				POINT       lopnWidth;
				COLORREF    lopnColor;
			}
		alias LOGPEN* PLOGPEN, NPLOGPEN, LPLOGPEN;

		enum
		{
			PS_SOLID =            0,
			PS_DASH =             1, /* -------  */
			PS_DOT =              2, /* .......  */
			PS_DASHDOT =          3, /* _._._._  */
			PS_DASHDOTDOT =       4, /* _.._.._  */
			PS_NULL =             5,
			PS_INSIDEFRAME =      6,
			PS_USERSTYLE =        7,
			PS_ALTERNATE =        8,
			PS_STYLE_MASK =       0x0000000F,

			PS_ENDCAP_ROUND =     0x00000000,
			PS_ENDCAP_SQUARE =    0x00000100,
			PS_ENDCAP_FLAT =      0x00000200,
			PS_ENDCAP_MASK =      0x00000F00,

			PS_JOIN_ROUND =       0x00000000,
			PS_JOIN_BEVEL =       0x00001000,
			PS_JOIN_MITER =       0x00002000,
			PS_JOIN_MASK =        0x0000F000,

			PS_COSMETIC =         0x00000000,
			PS_GEOMETRIC =        0x00010000,
			PS_TYPE_MASK =        0x000F0000,
		}

		export  HPALETTE   CreatePalette(LOGPALETTE *);
		export  HPEN      CreatePen(int, int, COLORREF);
		export  HPEN      CreatePenIndirect(LOGPEN *);
		export  HRGN      CreatePolyPolygonRgn(POINT *, INT *, int, int);
		export  HBRUSH    CreatePatternBrush(HBITMAP);
		export  HRGN      CreateRectRgn(int, int, int, int);
		export  HRGN      CreateRectRgnIndirect(RECT *);
		export  HRGN      CreateRoundRectRgn(int, int, int, int, int, int);
		export  BOOL      CreateScalableFontResourceA(DWORD, LPCSTR, LPCSTR, LPCSTR);
		export  BOOL      CreateScalableFontResourceW(DWORD, LPCWSTR, LPCWSTR, LPCWSTR);

		COLORREF RGB(int r, int g, int b)
		{
			return cast(COLORREF)
				   ((cast(BYTE)r|(cast(WORD)(cast(BYTE)g)<<8))|((cast(DWORD)cast(BYTE)b)<<16));
		}

		export  BOOL   LineTo(HDC, int, int);
		export  BOOL   DeleteObject(HGDIOBJ);
		export int FillRect(HDC hDC,  RECT *lprc, HBRUSH hbr);


		export BOOL EndDialog(HWND hDlg, int nResult);
		export HWND GetDlgItem(HWND hDlg, int nIDDlgItem);

		export BOOL SetDlgItemInt(HWND hDlg, int nIDDlgItem, UINT uValue, BOOL bSigned);
		export UINT GetDlgItemInt(HWND hDlg, int nIDDlgItem, BOOL *lpTranslated,
								  BOOL bSigned);

		export BOOL SetDlgItemTextA(HWND hDlg, int nIDDlgItem, LPCSTR lpString);
		export BOOL SetDlgItemTextW(HWND hDlg, int nIDDlgItem, LPCWSTR lpString);

		export UINT GetDlgItemTextA(HWND hDlg, int nIDDlgItem, LPSTR lpString, int nMaxCount);
		export UINT GetDlgItemTextW(HWND hDlg, int nIDDlgItem, LPWSTR lpString, int nMaxCount);

		export BOOL CheckDlgButton(HWND hDlg, int nIDButton, UINT uCheck);
		export BOOL CheckRadioButton(HWND hDlg, int nIDFirstButton, int nIDLastButton,
									 int nIDCheckButton);

		export UINT IsDlgButtonChecked(HWND hDlg, int nIDButton);

		export HWND SetFocus(HWND hWnd);

		export int wsprintfA(LPSTR, LPCSTR, ...);
		export int wsprintfW(LPWSTR, LPCWSTR, ...);

	enum :
		uint
		{
			INFINITE = uint.max,
			WAIT_OBJECT_0 = 0,
		}

		export HANDLE CreateSemaphoreA(LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCTSTR lpName);
		export HANDLE OpenSemaphoreA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpName);
		export BOOL ReleaseSemaphore(HANDLE hSemaphore, LONG lReleaseCount, LPLONG lpPreviousCount);

		struct COORD
			{
				SHORT X;
				SHORT Y;
			}
		alias COORD *PCOORD;

		struct SMALL_RECT
			{
				SHORT Left;
				SHORT Top;
				SHORT Right;
				SHORT Bottom;
			}
		alias SMALL_RECT *PSMALL_RECT;

		struct KEY_EVENT_RECORD
			{
				BOOL bKeyDown;
				WORD wRepeatCount;
				WORD wVirtualKeyCode;
				WORD wVirtualScanCode;
				union
					{
						WCHAR UnicodeChar;
						CHAR   AsciiChar;
					}
				DWORD dwControlKeyState;
			}
		alias KEY_EVENT_RECORD *PKEY_EVENT_RECORD;

//
// ControlKeyState flags
//

		enum
		{
			RIGHT_ALT_PRESSED =     0x0001, // the right alt key is pressed.
			LEFT_ALT_PRESSED =      0x0002, // the left alt key is pressed.
			RIGHT_CTRL_PRESSED =    0x0004, // the right ctrl key is pressed.
			LEFT_CTRL_PRESSED =     0x0008, // the left ctrl key is pressed.
			SHIFT_PRESSED =         0x0010, // the shift key is pressed.
			NUMLOCK_ON =            0x0020, // the numlock light is on.
			SCROLLLOCK_ON =         0x0040, // the scrolllock light is on.
			CAPSLOCK_ON =           0x0080, // the capslock light is on.
			ENHANCED_KEY =          0x0100, // the key is enhanced.
		}

		struct MOUSE_EVENT_RECORD
			{
				COORD dwMousePosition;
				DWORD dwButtonState;
				DWORD dwControlKeyState;
				DWORD dwEventFlags;
			}
		alias MOUSE_EVENT_RECORD *PMOUSE_EVENT_RECORD;

//
// ButtonState flags
//
		enum
		{
			FROM_LEFT_1ST_BUTTON_PRESSED =    0x0001,
			RIGHTMOST_BUTTON_PRESSED =        0x0002,
			FROM_LEFT_2ND_BUTTON_PRESSED =    0x0004,
			FROM_LEFT_3RD_BUTTON_PRESSED =    0x0008,
			FROM_LEFT_4TH_BUTTON_PRESSED =    0x0010,
		}

//
// EventFlags
//

		enum
		{
			MOUSE_MOVED =   0x0001,
			DOUBLE_CLICK =  0x0002,
		}

		struct WINDOW_BUFFER_SIZE_RECORD
			{
				COORD dwSize;
			}
		alias WINDOW_BUFFER_SIZE_RECORD *PWINDOW_BUFFER_SIZE_RECORD;

		struct MENU_EVENT_RECORD
			{
				UINT dwCommandId;
			}
		alias MENU_EVENT_RECORD *PMENU_EVENT_RECORD;

		struct FOCUS_EVENT_RECORD
			{
				BOOL bSetFocus;
			}
		alias FOCUS_EVENT_RECORD *PFOCUS_EVENT_RECORD;

		struct INPUT_RECORD
			{
				WORD EventType;
				union
					{
						KEY_EVENT_RECORD KeyEvent;
						MOUSE_EVENT_RECORD MouseEvent;
						WINDOW_BUFFER_SIZE_RECORD WindowBufferSizeEvent;
						MENU_EVENT_RECORD MenuEvent;
						FOCUS_EVENT_RECORD FocusEvent;
					}
			}
		alias INPUT_RECORD *PINPUT_RECORD;

//
//  EventType flags:
//

		enum
		{
			KEY_EVENT =         0x0001, // Event contains key event record
			MOUSE_EVENT =       0x0002, // Event contains mouse event record
			WINDOW_BUFFER_SIZE_EVENT = 0x0004, // Event contains window change event record
			MENU_EVENT = 0x0008, // Event contains menu event record
			FOCUS_EVENT = 0x0010, // event contains focus change
		}

		struct CHAR_INFO
			{
				union
					{
						WCHAR UnicodeChar;
						CHAR   AsciiChar;
					}
				WORD Attributes;
			}
		alias CHAR_INFO *PCHAR_INFO;

//
// Attributes flags:
//

		enum
		{
			FOREGROUND_BLUE =      0x0001, // text color contains blue.
			FOREGROUND_GREEN =     0x0002, // text color contains green.
			FOREGROUND_RED =       0x0004, // text color contains red.
			FOREGROUND_INTENSITY = 0x0008, // text color is intensified.
			BACKGROUND_BLUE =      0x0010, // background color contains blue.
			BACKGROUND_GREEN =     0x0020, // background color contains green.
			BACKGROUND_RED =       0x0040, // background color contains red.
			BACKGROUND_INTENSITY = 0x0080, // background color is intensified.
		}

		struct CONSOLE_SCREEN_BUFFER_INFO
			{
				COORD dwSize;
				COORD dwCursorPosition;
				WORD  wAttributes;
				SMALL_RECT srWindow;
				COORD dwMaximumWindowSize;
			}
		alias CONSOLE_SCREEN_BUFFER_INFO *PCONSOLE_SCREEN_BUFFER_INFO;

		struct CONSOLE_CURSOR_INFO
			{
				DWORD  dwSize;
				BOOL   bVisible;
			}
		alias CONSOLE_CURSOR_INFO *PCONSOLE_CURSOR_INFO;

		enum
		{
			ENABLE_PROCESSED_INPUT = 0x0001,
			ENABLE_LINE_INPUT =      0x0002,
			ENABLE_ECHO_INPUT =      0x0004,
			ENABLE_WINDOW_INPUT =    0x0008,
			ENABLE_MOUSE_INPUT =     0x0010,
		}

		enum
		{
			ENABLE_PROCESSED_OUTPUT =    0x0001,
			ENABLE_WRAP_AT_EOL_OUTPUT =  0x0002,
		}

		BOOL PeekConsoleInputA(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
		BOOL PeekConsoleInputW(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
		BOOL ReadConsoleInputA(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
		BOOL ReadConsoleInputW(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
		BOOL WriteConsoleInputA(HANDLE hConsoleInput, const INPUT_RECORD *lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsWritten);
		BOOL WriteConsoleInputW(HANDLE hConsoleInput, const INPUT_RECORD *lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsWritten);
		BOOL ReadConsoleOutputA(HANDLE hConsoleOutput, PCHAR_INFO lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpReadRegion);
		BOOL ReadConsoleOutputW(HANDLE hConsoleOutput, PCHAR_INFO lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpReadRegion);
		BOOL WriteConsoleOutputA(HANDLE hConsoleOutput, const CHAR_INFO *lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpWriteRegion);
		BOOL WriteConsoleOutputW(HANDLE hConsoleOutput, const CHAR_INFO *lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpWriteRegion);
		BOOL ReadConsoleOutputCharacterA(HANDLE hConsoleOutput, LPSTR lpCharacter, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfCharsRead);
		BOOL ReadConsoleOutputCharacterW(HANDLE hConsoleOutput, LPWSTR lpCharacter, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfCharsRead);
		BOOL ReadConsoleOutputAttribute(HANDLE hConsoleOutput, LPWORD lpAttribute, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfAttrsRead);
		BOOL WriteConsoleOutputCharacterA(HANDLE hConsoleOutput, LPCSTR lpCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
		BOOL WriteConsoleOutputCharacterW(HANDLE hConsoleOutput, LPCWSTR lpCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
		BOOL WriteConsoleOutputAttribute(HANDLE hConsoleOutput, const WORD *lpAttribute, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
		BOOL FillConsoleOutputCharacterA(HANDLE hConsoleOutput, CHAR cCharacter, DWORD  nLength, COORD  dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
		BOOL FillConsoleOutputCharacterW(HANDLE hConsoleOutput, WCHAR cCharacter, DWORD  nLength, COORD  dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
		BOOL FillConsoleOutputAttribute(HANDLE hConsoleOutput, WORD   wAttribute, DWORD  nLength, COORD  dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
		BOOL GetConsoleMode(HANDLE hConsoleHandle, LPDWORD lpMode);
		BOOL GetNumberOfConsoleInputEvents(HANDLE hConsoleInput, LPDWORD lpNumberOfEvents);
		BOOL GetConsoleScreenBufferInfo(HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);
		COORD GetLargestConsoleWindowSize(HANDLE hConsoleOutput);
		BOOL GetConsoleCursorInfo(HANDLE hConsoleOutput, PCONSOLE_CURSOR_INFO lpConsoleCursorInfo);
		BOOL GetNumberOfConsoleMouseButtons(LPDWORD lpNumberOfMouseButtons);
		BOOL SetConsoleMode(HANDLE hConsoleHandle, DWORD dwMode);
		BOOL SetConsoleActiveScreenBuffer(HANDLE hConsoleOutput);
		BOOL FlushConsoleInputBuffer(HANDLE hConsoleInput);
		BOOL SetConsoleScreenBufferSize(HANDLE hConsoleOutput, COORD dwSize);
		BOOL SetConsoleCursorPosition(HANDLE hConsoleOutput, COORD dwCursorPosition);
		BOOL SetConsoleCursorInfo(HANDLE hConsoleOutput, const CONSOLE_CURSOR_INFO *lpConsoleCursorInfo);
		BOOL ScrollConsoleScreenBufferA(HANDLE hConsoleOutput, const SMALL_RECT *lpScrollRectangle, const SMALL_RECT *lpClipRectangle, COORD dwDestinationOrigin, const CHAR_INFO *lpFill);
		BOOL ScrollConsoleScreenBufferW(HANDLE hConsoleOutput, const SMALL_RECT *lpScrollRectangle, const SMALL_RECT *lpClipRectangle, COORD dwDestinationOrigin, const CHAR_INFO *lpFill);
		BOOL SetConsoleWindowInfo(HANDLE hConsoleOutput, BOOL bAbsolute, const SMALL_RECT *lpConsoleWindow);
		BOOL SetConsoleTextAttribute(HANDLE hConsoleOutput, WORD wAttributes);
		alias BOOL function(DWORD CtrlType) PHANDLER_ROUTINE;
		BOOL SetConsoleCtrlHandler(PHANDLER_ROUTINE HandlerRoutine, BOOL Add);
		BOOL GenerateConsoleCtrlEvent(DWORD dwCtrlEvent, DWORD dwProcessGroupId);
		BOOL AllocConsole();
		BOOL FreeConsole();
		DWORD GetConsoleTitleA(LPSTR lpConsoleTitle, DWORD nSize);
		DWORD GetConsoleTitleW(LPWSTR lpConsoleTitle, DWORD nSize);
		BOOL SetConsoleTitleA(LPCSTR lpConsoleTitle);
		BOOL SetConsoleTitleW(LPCWSTR lpConsoleTitle);
		BOOL ReadConsoleA(HANDLE hConsoleInput, LPVOID lpBuffer, DWORD nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead, LPVOID lpReserved);
		BOOL ReadConsoleW(HANDLE hConsoleInput, LPVOID lpBuffer, DWORD nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead, LPVOID lpReserved);
		BOOL WriteConsoleA(HANDLE hConsoleOutput, const  void *lpBuffer, DWORD nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten, LPVOID lpReserved);
		BOOL WriteConsoleW(HANDLE hConsoleOutput, const  void *lpBuffer, DWORD nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten, LPVOID lpReserved);
		HANDLE CreateConsoleScreenBuffer(DWORD dwDesiredAccess, DWORD dwShareMode, const SECURITY_ATTRIBUTES *lpSecurityAttributes, DWORD dwFlags, LPVOID lpScreenBufferData);
		UINT GetConsoleCP();
		BOOL SetConsoleCP(UINT wCodePageID);
		UINT GetConsoleOutputCP();
		BOOL SetConsoleOutputCP(UINT wCodePageID);

		enum CONSOLE_TEXTMODE_BUFFER = 1;

		enum
		{
			SM_CXSCREEN =             0,
			SM_CYSCREEN =             1,
			SM_CXVSCROLL =            2,
			SM_CYHSCROLL =            3,
			SM_CYCAPTION =            4,
			SM_CXBORDER =             5,
			SM_CYBORDER =             6,
			SM_CXDLGFRAME =           7,
			SM_CYDLGFRAME =           8,
			SM_CYVTHUMB =             9,
			SM_CXHTHUMB =             10,
			SM_CXICON =               11,
			SM_CYICON =               12,
			SM_CXCURSOR =             13,
			SM_CYCURSOR =             14,
			SM_CYMENU =               15,
			SM_CXFULLSCREEN =         16,
			SM_CYFULLSCREEN =         17,
			SM_CYKANJIWINDOW =        18,
			SM_MOUSEPRESENT =         19,
			SM_CYVSCROLL =            20,
			SM_CXHSCROLL =            21,
			SM_DEBUG =                22,
			SM_SWAPBUTTON =           23,
			SM_RESERVED1 =            24,
			SM_RESERVED2 =            25,
			SM_RESERVED3 =            26,
			SM_RESERVED4 =            27,
			SM_CXMIN =                28,
			SM_CYMIN =                29,
			SM_CXSIZE =               30,
			SM_CYSIZE =               31,
			SM_CXFRAME =              32,
			SM_CYFRAME =              33,
			SM_CXMINTRACK =           34,
			SM_CYMINTRACK =           35,
			SM_CXDOUBLECLK =          36,
			SM_CYDOUBLECLK =          37,
			SM_CXICONSPACING =        38,
			SM_CYICONSPACING =        39,
			SM_MENUDROPALIGNMENT =    40,
			SM_PENWINDOWS =           41,
			SM_DBCSENABLED =          42,
			SM_CMOUSEBUTTONS =        43,


			SM_CXFIXEDFRAME =         SM_CXDLGFRAME,
			SM_CYFIXEDFRAME =         SM_CYDLGFRAME,
			SM_CXSIZEFRAME =          SM_CXFRAME,
			SM_CYSIZEFRAME =          SM_CYFRAME,

			SM_SECURE =               44,
			SM_CXEDGE =               45,
			SM_CYEDGE =               46,
			SM_CXMINSPACING =         47,
			SM_CYMINSPACING =         48,
			SM_CXSMICON =             49,
			SM_CYSMICON =             50,
			SM_CYSMCAPTION =          51,
			SM_CXSMSIZE =             52,
			SM_CYSMSIZE =             53,
			SM_CXMENUSIZE =           54,
			SM_CYMENUSIZE =           55,
			SM_ARRANGE =              56,
			SM_CXMINIMIZED =          57,
			SM_CYMINIMIZED =          58,
			SM_CXMAXTRACK =           59,
			SM_CYMAXTRACK =           60,
			SM_CXMAXIMIZED =          61,
			SM_CYMAXIMIZED =          62,
			SM_NETWORK =              63,
			SM_CLEANBOOT =            67,
			SM_CXDRAG =               68,
			SM_CYDRAG =               69,
			SM_SHOWSOUNDS =           70,
			SM_CXMENUCHECK =          71,
			SM_CYMENUCHECK =          72,
			SM_SLOWMACHINE =          73,
			SM_MIDEASTENABLED =       74,
			SM_CMETRICS =             75,
		}

		int GetSystemMetrics(int nIndex);




		struct CREATESTRUCTA
			{
				LPVOID      lpCreateParams;
				HINSTANCE   hInstance;
				HMENU       hMenu;
				HWND        hwndParent;
				int         cy;
				int         cx;
				int         y;
				int         x;
				LONG        style;
				LPCSTR      lpszName;
				LPCSTR      lpszClass;
				DWORD       dwExStyle;
			};



		enum
		{
			/*
			 * Window field offsets for GetWindowLong()
			 */
			GWL_WNDPROC         =(-4),
			GWL_HINSTANCE     = (-6),
			GWL_HWNDPARENT   = (-8),
			GWL_STYLE        = (-16),
			GWL_EXSTYLE      = (-20),
			GWL_USERDATA     = (-21),
			GWL_ID           = (-12),

			GWLP_WNDPROC     = (-4),
			GWLP_HINSTANCE   = (-6),
			GWLP_HWNDPARENT  = (-8),
			GWLP_USERDATA    = (-21),
			GWLP_ID          = (-12)
		}

		int GetWindowLongA(HWND hWnd,int nIndex);
		int SetWindowLongA(HWND hWnd,int nIndex,int dwNewLong);
		int* SetWindowLongPtrA(HWND hWnd,int nIndex,int* dwNewLong);
		int* GetWindowLongPtrA(HWND hWnd,int nIndex);
		LRESULT CallWindowProcA(WNDPROC lpPrevWndFunc,
								HWND hWnd,
								UINT Msg,
								WPARAM wParam,
								LPARAM lParam
							   );

		alias LRESULT function(HWND hWnd,
							   uint uMsg,
							   uint wParam,
							   int lParam,
							   uint* uIdSubclass,
							   DWORD* dwRefData
							  ) SUBCLASSPROC;
		bool SetWindowSubclass(HWND hWnd,SUBCLASSPROC pfnSubclass,uint* uIdSubclass,DWORD* dwRefData);
		int DefSubclassProc(HWND hWnd,uint uMsg,uint WPARAM,int LPARAM);


		enum
		{
			OFN_READONLY               =  0x00000001,
			OFN_OVERWRITEPROMPT =        0x00000002,
			OFN_HIDEREADONLY       =      0x00000004,
			OFN_NOCHANGEDIR        =      0x00000008,
			OFN_SHOWHELP            =     0x00000010,
			OFN_ENABLEHOOK          =     0x00000020,
			OFN_ENABLETEMPLATE     =      0x00000040,
			OFN_ENABLETEMPLATEHANDLE  =   0x00000080,
			OFN_NOVALIDATE            =   0x00000100,
			OFN_ALLOWMULTISELECT  =       0x00000200,
			OFN_EXTENSIONDIFFERENT=       0x00000400,
			OFN_PATHMUSTEXIST     =       0x00000800,
			OFN_FILEMUSTEXIST     =       0x00001000,
			OFN_CREATEPROMPT     =        0x00002000,
			OFN_SHAREAWARE          =     0x00004000,
			OFN_NOREADONLYRETURN  =       0x00008000,
			OFN_NOTESTFILECREATE   =      0x00010000,
			OFN_NONETWORKBUTTON   =       0x00020000,
			OFN_NOLONGNAMES        =      0x00040000,     // force no long names for 4.x modules
			OFN_EXPLORER               =  0x00080000,     // new look commdlg
			OFN_NODEREFERENCELINKS   =    0x00100000,
			OFN_LONGNAMES             =   0x00200000,     // force long names for 3.x modules
			OFN_ENABLEINCLUDENOTIFY   =   0x00400000,     // send include message to callback
			OFN_ENABLESIZING          =   0x00800000,
			OFN_DONTADDTORECENT  =        0x02000000,
			OFN_FORCESHOWHIDDEN  =        0x10000000,    // Show All files including System and hidden files
			OFN_EX_NOPLACESBAR    =     0x00000001,
		}

		enum
		{
			WM_SETFONT=                      0x0030,
			WM_GETFONT=                      0x0031,
			WM_USER        =                  0x0400,
			NM_FIRST=cast(uint) 0UL,
			NM_OUTOFMEMORY  = (NM_FIRST-1),
			NM_CLICK            = (NM_FIRST-2),       // uses NMCLICK struct
			NM_DBLCLK       = (NM_FIRST-3),
			NM_RETURN           = (NM_FIRST-4),
			NM_RCLICK            = (NM_FIRST-5),      // uses NMCLICK struct
			NM_RDBLCLK         = (NM_FIRST-6),
			NM_SETFOCUS      = (NM_FIRST-7),
			NM_KILLFOCUS       = (NM_FIRST-8),
			NM_CUSTOMDRAW  = (NM_FIRST-12),
			NM_HOVER            = (NM_FIRST-13),
			NM_NCHITTEST      = (NM_FIRST-14),        // uses NMMOUSE struct
			NM_KEYDOWN         = (NM_FIRST-15),       // uses NMKEY struct
			NM_RELEASEDCAPTURE  = (NM_FIRST-16),
			NM_SETCURSOR       = (NM_FIRST-17),       // uses NMMOUSE struct
			NM_CHAR             = (NM_FIRST-18),      // uses NMCHAR struct
			NM_TOOLTIPSCREATED  = (NM_FIRST-19),      // notify of when the tooltips window is create
			NM_LDOWN         = (NM_FIRST-20),
			NM_RDOWN        = (NM_FIRST-21),
			NM_THEMECHANGED    = (NM_FIRST-22)
		}

		struct NMHDR
			{
				HWND      hwndFrom;
				uint*  idFrom;
				uint      code;         // NM_ code
			};
		alias NMHDR* LPNMHDR;

		static struct NMITEMACTIVATE
			{
				NMHDR   hdr;
				int     iItem;
				int     iSubItem;
				UINT    uNewState;
				UINT    uOldState;
				UINT    uChanged;
				POINT   ptAction;
				LPARAM  lParam;
				UINT    uKeyFlags;
			}
		alias NMITEMACTIVATE* LPNMITEMACTIVATE;

		HWND GetParent(HWND h);
		void SetParent(HWND child, HWND parent);
		HWND GetActiveWindow();
		export int  GetWindowTextLengthA(HWND hWnd);
		export int  GetWindowTextLengthW(HWND hWnd);
		export bool SetWindowTextA(HWND hWnd,char* lpString);
		export bool SetWindowTextW(HWND hWnd,wchar* lpString);
		export int GetWindowTextW(HWND hWnd,wchar* lpString, int nMaxCount);
		export int GetWindowTextA(HWND hWnd,LPCSTR lpString, int nMaxCount);
		BOOL InsertMenuA(
			HMENU hMenu,
			UINT uPosition,
			UINT uFlags,
			UINT uIDNewItem,
			LPCSTR lpNewItem
		);
		HANDLE GetMenu(HWND hWnd);
		bool SetMenu(HWND hWnd,HMENU hMenu);
		bool ChangeMenuA(HMENU hMenu,UINT cmd,LPCSTR lpszNewItem,UINT cmdInsert,UINT flags);
		int GetMenuItemCount(HMENU hMenu);
		int GetMenuStringA(HMENU hMenu,UINT uIDItem,LPSTR lpString,int nMaxCount,UINT uFlag);
		UINT GetMenuItemID(HMENU hMenu,int nPos);
//HMENU GetSubMenu(HMENU hMenu,int nPos);
		BOOL DestroyMenu(HMENU hMenu);
		DWORD CheckMenuItem(HMENU hMenu,UINT uIDCheckItem,UINT uCheck);
		BOOL EnableMenuItem(HMENU hMenu,UINT uIDEnableItem,UINT uEnable);
		BOOL ModifyMenuA(HMENU hMnu,UINT uPosition,UINT uFlags,UINT uIDNewItem,LPCSTR lpNewItem);
		BOOL AppendMenuA(HMENU hMenu,UINT uFlags,UINT uIDNewItem,LPCSTR lpNewItem);
		export void InitCommonControls();
		HWND CreateMDIWindowA(LPCTSTR lpClassName,
							  LPCTSTR lpWindowName,
							  DWORD dwStyle,
							  int X,
							  int Y,
							  int nWidth,
							  int nHeight,
							  HWND hWndParent,
							  HINSTANCE hInstance,
							  LPARAM lParam
							 );
		SHORT GetAsyncKeyState(int key);
		SHORT GetKeyState(int key);
		bool GetKeyboardState(LPBYTE lpKeyState);
		bool SetKeyboardState(LPBYTE lpKeyState);
		HWND SetTimer(HWND hWnd ,
					  int nIDEvent,
					  int uElapse,
					  TIMERPROC lpTimerFunc);
		BOOL KillTimer(HWND hWnd, int IdEvent);
		enum
		{
			ERROR_ALREADY_EXISTS        =183,
		}
		HANDLE CreateMutexA(LPSECURITY_ATTRIBUTES lpMutexAttributes,bool bInitialOwner,LPCSTR lpName);
		BOOL ReleaseMutex(HANDLE hMutex);
		HANDLE OpenMutexA(DWORD dwDesiredAccess,bool bInheritHandle,LPCSTR lpName);

		LPSTR GetCommandLineA();
//BOOL SetLayeredWindowAttributes(HWND hwnd,DWORD crKey,BYTE bAlpha,DWORD dwFlags);
		BOOL SetWindowPos(HWND hWnd,HWND hWndInsertAfter,int X,int Y,int cx,int cy,UINT uFlags);
		BOOL MoveWindow(HWND hWnd,int X,int Y,int nWidth,int nHeight,BOOL bRepaint);
		enum
		{
			WM_MDICREATE                    =0x0220,
			WM_MDIDESTROY                   =0x0221,
			WM_MDIACTIVATE                  =0x0222,
			WM_MDIRESTORE                   =0x0223,
			WM_MDINEXT                      =0x0224,
			WM_MDIMAXIMIZE                  =0x0225,
			WM_MDITILE                      =0x0226,
			WM_MDICASCADE                   =0x0227,
			WM_MDIICONARRANGE               =0x0228,
			WM_MDIGETACTIVE                 =0x0229,

			MDIS_ALLCHILDSTYLES    =0x0001,
			MDITILE_VERTICAL       =0x0000, /*not in win3.1 */
			MDITILE_HORIZONTAL     =0x0001, /*not in win3.1 */
			MDITILE_SKIPDISABLED   =0x0002, /*not in win3.1 */
			MDITILE_ZORDER         =0x0004,
		}

		struct MDICREATESTRUCTA
			{
				LPCSTR   szClass;
				LPCSTR   szTitle;
				HANDLE hOwner;
				int x;
				int y;
				int cx;
				int cy;
				DWORD style;
				LPARAM lParam;        /* app-defined stuff */
			}
		HANDLE CreateMenu();
		HANDLE CreatePopupMenu();
		BOOL DrawMenuBar(HWND h);
		HACCEL CreateAcceleratorTableA(ACCEL* lpaccl,int cEntries);
		struct ACCEL
			{
				BYTE fVirt;
				WORD key;
				WORD cmd;
			}
		int TranslateAcceleratorA(HWND hWnd,HACCEL hAccTable,LPMSG lpMsg);
		enum
		{
			FVIRTKEY  =true,          /* Assumed to be == TRUE */
			FNOINVERT =0x02,
			FSHIFT    =0x04,
			FCONTROL  =0x08,
			FALT      =0x10,
		}


		enum
		{
			MF_INSERT          =0x00000000L,
			MF_CHANGE          =0x00000080L,
			MF_APPEND          =0x00000100L,
			MF_DELETE          =0x00000200L,
			MF_REMOVE          =0x00001000L,
			MF_BYCOMMAND       =0x00000000L,
			MF_BYPOSITION      =0x00000400L,
			MF_SEPARATOR       =0x00000800L,
			MF_ENABLED         =0x00000000L,
			MF_GRAYED          =0x00000001L,
			MF_DISABLED        =0x00000002L,
			MF_UNCHECKED       =0x00000000L,
			MF_CHECKED         =0x00000008L,
			MF_USECHECKBITMAPS =0x00000200L,
			MF_STRING          =0x00000000L,
			MF_BITMAP          =0x00000004L,
			MF_OWNERDRAW       =0x00000100L,
			MF_POPUP           =0x00000010L,
			MF_MENUBARBREAK    =0x00000020L,
			MF_MENUBREAK       =0x00000040L,
			MF_UNHILITE        =0x00000000L,
			MF_HILITE          =0x00000080L,
			MF_DEFAULT         =0x00001000L,
			MF_SYSMENU         =0x00002000L,
			MF_HELP            =0x00004000L,
			MF_RIGHTJUSTIFY    =0x00004000L,
			MF_MOUSESELECT     =0x00008000L,
			MF_END             =0x00000080L, /* Obsolete -- only used by old RES files */
			MFT_STRING          =MF_STRING,
			MFT_BITMAP          =MF_BITMAP,
			MFT_MENUBARBREAK    =MF_MENUBARBREAK,
			MFT_MENUBREAK       =MF_MENUBREAK,
			MFT_OWNERDRAW       =MF_OWNERDRAW,
			MFT_RADIOCHECK     =0x00000200L,
			MFT_SEPARATOR       =MF_SEPARATOR,
			MFT_RIGHTORDER     =0x00002000L,
			MFT_RIGHTJUSTIFY    =MF_RIGHTJUSTIFY,
			/* Menu flags for Add/Check/EnableMenuItem() */
			MFS_GRAYED         =0x00000003L,
			MFS_DISABLED        =MFS_GRAYED,
			MFS_CHECKED        =MF_CHECKED,
			MFS_HILITE          =MF_HILITE,
			MFS_ENABLED         =MF_ENABLED,
			MFS_UNCHECKED       =MF_UNCHECKED,
			MFS_UNHILITE        =MF_UNHILITE,
			MFS_DEFAULT         =MF_DEFAULT,
		}
		BOOL DestroyWindow(HWND h);
		BOOL HeapDestroy(HANDLE h);
		BOOL TranslateMDISysAccel(HWND hWndClient,LPMSG lpMsg);
		BOOL DefFrameProcA(HWND h,HWND hWndClient,uint Message,uint wParam, int lParam);

		BOOL SetPropA(HWND h,char* propname,HWND prophandle);
		HANDLE GetPropA(HWND h,char* propname);

		HACCEL LoadAcceleratorsA(HINSTANCE hInstance, LPCSTR lpTableName);

		HANDLE FindResourceA(HINSTANCE h,char* name,char* type);
		HANDLE LoadResource(HINSTANCE h,HANDLE resourceHandle);


		BOOL SetMenuItemBitmaps(HMENU hMenu,
								uint uPosition,
								uint uFlags,
								HBITMAP hBitmapUnchecked,
								HBITMAP hBitmapChecked
							   );




		void DragFinish(HANDLE hDrop);
		uint DragQueryFile(HANDLE hDrop, uint iFile, char* lpszFile, uint cch);

		HANDLE GetProcessHeap();
		bool HeapFree(
			HANDLE hHeap,
			DWORD dwFlags,
			void* lpMem
		);

		FARPROC GetProcAddress(HINSTANCE hModule,char* lpProcName);


		DWORD GetPrivateProfileSectionNamesA(
			LPTSTR lpszReturnBuffer,
			DWORD nSize,
			LPCTSTR lpFileName
		);

		DWORD GetPrivateProfileString(
			LPCTSTR lpAppName,
			LPCTSTR lpKeyName,
			LPCTSTR lpDefault,
			LPTSTR lpReturnedString,
			DWORD nSize,
			LPCTSTR lpFileName
		);

		enum
		{
			WM_HOTKEY                       =0x0312,
			MOD_ALT         =0x0001,
			MOD_CONTROL     =0x0002,
			MOD_SHIFT       =0x0004,
			MOD_WIN         =0x0008,

			IDHOT_SNAPWINDOW        =(-1),    /* SHIFT-PRINTSCRN  */
			IDHOT_SNAPDESKTOP       =(-2),    /* PRINTSCRN        */
		}
		
		const(HANDLE) HWND_MESSAGE     =cast(HANDLE)-3;

		BOOL RegisterHotKey(HWND hWnd,
							int id,
							UINT fsModifiers,
							UINT vk
						   );
		BOOL UnregisterHotKey(HWND hWnd,
							  int id
							 );

		BOOL PlaySound(
			LPCSTR pszSound,
			HMODULE hmod,
			DWORD fdwSound
		);

		export BOOL TerminateThread(HANDLE hThread,DWORD dwExitCode);











		BOOL CreatePipe(
			HANDLE* hReadPipe,
			HANDLE* hWritePipe,
			SECURITY_ATTRIBUTES* lpPipeAttributes,
			DWORD nSize
		);

		BOOL SetHandleInformation(
			HANDLE hObject,
			DWORD dwMask,
			DWORD dwFlags
		);

		enum
		{
			HANDLE_FLAG_INHERIT=0x00000001,
			HANDLE_FLAG_PROTECT_FROM_CLOSE=0x00000002,

			STARTF_USESHOWWINDOW    =0x00000001,
			STARTF_USESIZE          =0x00000002,
			STARTF_USEPOSITION      =0x00000004,
			STARTF_USECOUNTCHARS    =0x00000008,
			STARTF_USEFILLATTRIBUTE =0x00000010,
			STARTF_RUNFULLSCREEN    =0x00000020,  // ignored for non-x86 platforms
			STARTF_FORCEONFEEDBACK  =0x00000040,
			STARTF_FORCEOFFFEEDBACK =0x00000080,
			STARTF_USESTDHANDLES    =0x00000100,
			STARTF_USEHOTKEY        =0x00000200,


			DEBUG_PROCESS                     =0x00000001,
			DEBUG_ONLY_THIS_PROCESS           =0x00000002,

			CREATE_SUSPENDED                  =0x00000004,

			DETACHED_PROCESS                  =0x00000008,

			CREATE_NEW_CONSOLE                =0x00000010,

			NORMAL_PRIORITY_CLASS             =0x00000020,
			IDLE_PRIORITY_CLASS               =0x00000040,
			HIGH_PRIORITY_CLASS               =0x00000080,
			REALTIME_PRIORITY_CLASS           =0x00000100,

			CREATE_NEW_PROCESS_GROUP          =0x00000200,
			CREATE_UNICODE_ENVIRONMENT        =0x00000400,

			CREATE_SEPARATE_WOW_VDM           =0x00000800,
			CREATE_SHARED_WOW_VDM             =0x00001000,
			CREATE_FORCEDOS                   =0x00002000,

			BELOW_NORMAL_PRIORITY_CLASS       =0x00004000,
			ABOVE_NORMAL_PRIORITY_CLASS       =0x00008000,
			STACK_SIZE_PARAM_IS_A_RESERVATION =0x00010000,

			CREATE_BREAKAWAY_FROM_JOB         =0x01000000,
			CREATE_PRESERVE_CODE_AUTHZ_LEVEL  =0x02000000,

			CREATE_DEFAULT_ERROR_MODE         =0x04000000,
			CREATE_NO_WINDOW                  =0x08000000,

			PROFILE_USER                      =0x10000000,
			PROFILE_KERNEL                    =0x20000000,
			PROFILE_SERVER                    =0x40000000,

			CREATE_IGNORE_SYSTEM_DEFAULT      =0x80000000,
		}

		struct STARTUPINFO
			{
				DWORD cb;
				LPTSTR lpReserved;
				LPTSTR lpDesktop;
				LPTSTR lpTitle;
				DWORD dwX;
				DWORD dwY;
				DWORD dwXSize;
				DWORD dwYSize;
				DWORD dwXCountChars;
				DWORD dwYCountChars;
				DWORD dwFillAttribute;
				DWORD dwFlags;
				WORD wShowWindow;
				WORD cbReserved2;
				BYTE* lpReserved2;
				HANDLE hStdInput;
				HANDLE hStdOutput;
				HANDLE hStdError;
			};

		struct PROCESS_INFORMATION
			{
				HANDLE hProcess;
				HANDLE hThread;
				DWORD dwProcessId;
				DWORD dwThreadId;
			}

		bool GetExitCodeProcess(
			HANDLE hProcess,
			DWORD* lpExitCode
		);
		
		DWORD GetProcessId(HANDLE hProcess);
		
		bool SetPriorityClass(HANDLE hProcess, DWORD priority);
		DWORD GetPriorityClass(HANDLE hProcess);


		bool CreateProcessA(
			char* lpApplicationName,
			char* lpCommandLine,
			SECURITY_ATTRIBUTES* lpProcessAttributes,
			SECURITY_ATTRIBUTES* lpThreadAttributes,
			bool bInheritHandles,
			DWORD dwCreationFlags,
			void* lpEnvironment,
			char* lpCurrentDirectory,
			STARTUPINFO* lpStartupInfo,
			PROCESS_INFORMATION* lpProcessInformation
		);
		
		bool CreateProcessW(
			wchar* lpApplicationName,
			wchar* lpCommandLine,
			SECURITY_ATTRIBUTES* lpProcessAttributes,
			SECURITY_ATTRIBUTES* lpThreadAttributes,
			bool bInheritHandles,
			DWORD dwCreationFlags,
			void* lpEnvironment,
			wchar* lpCurrentDirectory,
			STARTUPINFO* lpStartupInfo,
			PROCESS_INFORMATION* lpProcessInformation
		);

		bool TerminateProcess(
			HANDLE hProcess,
			uint uExitCode
		);


		bool PeekNamedPipe(
			HANDLE hNamedPipe,
			void* lpBuffer,
			DWORD nBufferSize,
			DWORD* lpBytesRead,
			DWORD* lpTotalBytesAvail,
			DWORD* lpBytesLeftThisMessage
		);



		HANDLE GetStdHandle(
			DWORD nStdHandle
		);

		bool ReadConsoleOutput(
			HANDLE hConsoleOutput,
			CHAR_INFO* lpBuffer,
			COORD dwBufferSize,
			COORD dwBufferCoord,
			SMALL_RECT* lpReadRegion
		);

		bool SetNamedPipeHandleState(
			HANDLE hNamedPipe,
			DWORD* lpMode,
			DWORD* lpMaxCollectionCount,
			DWORD* lpCollectDataTimeout
		);

		bool IsWindowVisible(HWND hWnd);

		void DragAcceptFiles(HWND hWnd,bool fAccept);

		bool EnableWindow(HWND hWnd,
						  bool bEnable
						 );
		bool IsWindowEnabled(HWND hWnd
							);

		struct GUID
			{
				ulong        Data1;
				ushort       Data2;
				ushort       Data3;
				char[8]        Data4;
			};

		enum
		{
			NIN_SELECT          =(WM_USER + 0),
			NINF_KEY            =0x1,
			NIN_KEYSELECT       =(NIN_SELECT | NINF_KEY),

			NIN_BALLOONSHOW     =(WM_USER + 2),
			NIN_BALLOONHIDE     =(WM_USER + 3),
			NIN_BALLOONTIMEOUT  =(WM_USER + 4),
			NIN_BALLOONUSERCLICK =(WM_USER + 5),

			NIM_ADD         =0x00000000,
			NIM_MODIFY      =0x00000001,
			NIM_DELETE      =0x00000002,

			NIM_SETFOCUS    =0x00000003,
			NIM_SETVERSION  =0x00000004,
			NOTIFYICON_VERSION =3,

			NIF_MESSAGE     =0x00000001,
			NIF_ICON        =0x00000002,
			NIF_TIP         =0x00000004,
			NIF_STATE       =0x00000008,
			NIF_INFO        =0x00000010,

			NIF_GUID        =0x00000020,

			NIS_HIDDEN       =       0x00000001,
			NIS_SHAREDICON    =      0x00000002,



// Notify Icon Infotip flags
			NIIF_NONE       =0x00000000,
// icon flags are mutually exclusive
// and take only the lowest 2 bits
			NIIF_INFO       =0x00000001,
			NIIF_WARNING    =0x00000002,
			NIIF_ERROR      =0x00000003,
			NIIF_USER       =0x00000004,
			NIIF_ICON_MASK  =0x0000000F,
			NIIF_NOSOUND    =0x00000010,
		}

		bool Shell_NotifyIconA(DWORD dwMessage, NOTIFYICONDATAA *lpdata);
		struct NOTIFYICONDATAA
			{
				DWORD cbSize;
				HWND hWnd;
				uint uID;
				uint uFlags;
				uint uCallbackMessage;
				HICON hIcon;
				char[128]   szTip;
				DWORD dwState;
				DWORD dwStateMask;
				char[256]   szInfo;
				union DUMMYUNIONNAME
					{
						uint  uTimeout;
						uint  uVersion;
					};
				char[64]   szInfoTitle;
				DWORD dwInfoFlags;
				GUID guidItem;
			};

		void SetLastError(DWORD errcode);

		HWND CreateDialogA(HINSTANCE hInstance,
						   const(char)* lpTemplate,
						   HWND hWndParent,
						   DLGPROC lpDialogFunc
						  );

		HWND DialogBoxA(HINSTANCE hInstance,
						const(char)* lpTemplate,
						HWND hWndParent,
						DLGPROC lpDialogFunc
					   );

		BOOL GetClassInfoA(HINSTANCE hInstance,
						   char* lpClassName,
						   WNDCLASS* lpWndClass
						  );

		BOOL SetForegroundWindow(HWND hWnd
								);

		BOOL BringWindowToTop(HWND hWnd
							 );

		struct ip_mreq
			{
				in_addr  imr_multiaddr;  /* IP multicast address of group */
				in_addr  imr_interface;  /* local IP address of interface */
			};


		HWND FindWindowA(char* lpClassName,
						 char* lpWindowName
						);

		uint GetWindowThreadProcessId(HWND hWnd,
									  uint* lpdwProcessId
									 );

		HANDLE OpenProcess(
			uint dwDesiredAccess,
			bool bInheritHandle,
			uint dwProcessId
		);

		enum
		{
			PROCESS_TERMINATE                  =(0x0001),
			PROCESS_CREATE_THREAD              =(0x0002),
			PROCESS_SET_SESSIONID              =(0x0004),
			PROCESS_VM_OPERATION               =(0x0008),
			PROCESS_VM_READ                    =(0x0010),
			PROCESS_VM_WRITE                   =(0x0020),
			PROCESS_DUP_HANDLE                 =(0x0040),
			PROCESS_CREATE_PROCESS             =(0x0080),
			PROCESS_SET_QUOTA                  =(0x0100),
			PROCESS_SET_INFORMATION            =(0x0200),
			PROCESS_QUERY_INFORMATION          =(0x0400),
			PROCESS_SUSPEND_RESUME             =(0x0800),
			PROCESS_QUERY_LIMITED_INFORMATION  =(0x1000),
			PROCESS_ALL_ACCESS        =(STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0xFFFF),
		}

		bool ReadProcessMemory(
			HANDLE hProcess,
			uint lpBaseAddress, // in
			void* lpBuffer,		// out
			size_t nSize,
			size_t* lpNumberOfBytesRead
		);

		bool WriteProcessMemory(
			HANDLE hProcess,
			uint lpBaseAddress,
			void* lpBuffer,
			size_t nSize,
			size_t* lpNumberOfBytesWritten
		);

		bool EnumWindows(WNDENUMPROC lpEnumFunc,
						 int lParam
						);

		uint GetWindowModuleFileName(HWND hwnd,
									 char* lpszFileName,
									 uint cchFileNameMax
									);

		bool SetConsoleMode(HANDLE hConsoleHandle,DWORD dwMode);

enum{
	ILC_MASK               =0x00000001
	,ILC_COLOR              =0x00000000
	,ILC_COLORDDB           =0x000000FE
	,ILC_COLOR4             =0x00000004
	,ILC_COLOR8             =0x00000008
	,ILC_COLOR16            =0x00000010
	,ILC_COLOR24            =0x00000018
	,ILC_COLOR32            =0x00000020
	,ILC_PALETTE            =0x00000800      // (not implemented)
	,ILC_MIRROR             =0x00002000      // Mirror the icons contained, if the process is mirrored
	,ILC_PERITEMMIRROR      =0x00008000      // Causes the mirroring code to mirror each item when inserting a set of images, verses the whole strip

	,ILC_ORIGINALSIZE       =0x00010000      // Imagelist should accept smaller than set images and apply OriginalSize based on image added
	,ILC_HIGHQUALITYSCALE   =0x00020000      // Imagelist should enable use of the high quality scaler.

	,ILD_NORMAL             =0x00000000
	,ILD_TRANSPARENT        =0x00000001
	,ILD_MASK               =0x00000010
	,ILD_IMAGE              =0x00000020
	,ILD_ROP                =0x00000040
	,ILD_BLEND25            =0x00000002
	,ILD_BLEND50            =0x00000004
	,ILD_OVERLAYMASK        =0x00000F00
	//,INDEXTOOVERLAYMASK(i)   ((i) << 8)
	,ILD_PRESERVEALPHA      =0x00001000  // This preserves the alpha channel in dest
	,ILD_SCALE              =0x00002000  // Causes the image to be scaled to cx, cy instead of clipped
	,ILD_DPISCALE           =0x00004000

	,ILD_ASYNC              =0x00008000

	,ILD_SELECTED           = ILD_BLEND50
	,ILD_FOCUS             =  ILD_BLEND25
	,ILD_BLEND              = ILD_BLEND50
	//,CLR_HILIGHT           =  CLR_DEFAULT

	,ILS_NORMAL             =0x00000000
	,ILS_GLOW               =0x00000001
	,ILS_SHADOW             =0x00000002
	,ILS_SATURATE           =0x00000004
	,ILS_ALPHA              =0x00000008

	,ILGT_NORMAL            =0x00000000
	,ILGT_ASYNC             =0x00000001

	,HBITMAP_CALLBACK               =(cast(HBITMAP)-1)       // only for SparseImageList

	,ILCF_MOVE  =0x00000000
	,ILCF_SWAP  =0x00000001
}

alias HANDLE HIMAGELIST;

HIMAGELIST  ImageList_Create(int cx, int cy, UINT flags, int cInitial, int cGrow);
BOOL        ImageList_Destroy(HIMAGELIST himl);
int         ImageList_GetImageCount(HIMAGELIST himl);
BOOL        ImageList_SetImageCount(HIMAGELIST himl, UINT uNewCount);
int         ImageList_Add(HIMAGELIST himl, HBITMAP hbmImage, HBITMAP hbmMask);
int         ImageList_ReplaceIcon(HIMAGELIST himl, int i, HICON hicon);
COLORREF    ImageList_SetBkColor(HIMAGELIST himl, COLORREF clrBk);
COLORREF    ImageList_GetBkColor(HIMAGELIST himl);
BOOL        ImageList_SetOverlayImage(HIMAGELIST himl, int iImage, int iOverlay);
//,    ImageList_AddIcon(himl, hicon) ImageList_ReplaceIcon(himl, -1, hicon)
BOOL ImageList_Draw(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, UINT fStyle);
BOOL        ImageList_Replace(HIMAGELIST himl, int i, HBITMAP hbmImage, HBITMAP hbmMask);
int         ImageList_AddMasked(HIMAGELIST himl, HBITMAP hbmImage, COLORREF crMask);
BOOL        ImageList_DrawEx(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, int dx, int dy, COLORREF rgbBk, COLORREF rgbFg, UINT fStyle);
//BOOL        ImageList_DrawIndirect(IMAGELISTDRAWPARAMS* pimldp);
BOOL        ImageList_Remove(HIMAGELIST himl, int i);
HICON       ImageList_GetIcon(HIMAGELIST himl, int i, UINT flags);
HIMAGELIST  ImageList_LoadImageA(HINSTANCE hi, LPCSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);
HIMAGELIST  ImageList_LoadImageW(HINSTANCE hi, LPCWSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);
BOOL        ImageList_Copy(HIMAGELIST himlDst, int iDst, HIMAGELIST himlSrc, int iSrc, UINT uFlags);
BOOL        ImageList_BeginDrag(HIMAGELIST himlTrack, int iTrack, int dxHotspot, int dyHotspot);
void        ImageList_EndDrag();
BOOL        ImageList_DragEnter(HWND hwndLock, int x, int y);
BOOL        ImageList_DragLeave(HWND hwndLock);
BOOL        ImageList_DragMove(int x, int y);
BOOL        ImageList_SetDragCursorImage(HIMAGELIST himlDrag, int iDrag, int dxHotspot, int dyHotspot);
BOOL        ImageList_DragShowNolock(BOOL fShow);
HIMAGELIST  ImageList_GetDragImage(POINT *ppt,POINT *pptHotspot);
/*
,    ImageList_RemoveAll(himl) ImageList_Remove(himl, -1)
,    ImageList_ExtractIcon(hi, himl, i) ImageList_GetIcon(himl, i, 0)
,    ImageList_LoadBitmap(hi, lpbmp, cx, cGrow, crMask) ImageList_LoadImage(hi, lpbmp, cx, cGrow, crMask, IMAGE_BITMAP, 0)

HIMAGELIST ImageList_Read(LPSTREAM pstm);
BOOL       ImageList_Write(HIMAGELIST himl, LPSTREAM pstm);

,ILP_NORMAL    =      0           // Writes or reads the stream using new sematics for this version of comctl32
,ILP_DOWNLEVEL  =     1           // Write or reads the stream using downlevel sematics.

HRESULT ImageList_ReadEx(DWORD dwFlags, LPSTREAM pstm, REFIID riid, PVOID* ppv);
HRESULT ImageList_WriteEx(HIMAGELIST himl, DWORD dwFlags, LPSTREAM pstm);
*/
struct IMAGEINFO
{
    HBITMAP hbmImage;
    HBITMAP hbmMask;
    int     Unused1;
    int     Unused2;
    RECT    rcImage;
}

BOOL        ImageList_GetIconSize(HIMAGELIST himl, int *cx, int *cy);
BOOL        ImageList_SetIconSize(HIMAGELIST himl, int cx, int cy);
BOOL        ImageList_GetImageInfo(HIMAGELIST himl, int i, IMAGEINFO *pImageInfo);
HIMAGELIST  ImageList_Merge(HIMAGELIST himl1, int i1, HIMAGELIST himl2, int i2, int dx, int dy);
HIMAGELIST  ImageList_Duplicate(HIMAGELIST himl);




struct SHFILEINFOW
{
        HICON       hIcon;                      // out: icon
        int         iIcon;                      // out: icon index
        DWORD       dwAttributes;               // out: SFGAO_ flags
        wchar[260]       szDisplayName;    // out: display name (or path)
        wchar[80]       szTypeName;             // out: type name
}
struct SHFILEINFOA
{
        HICON       hIcon;                      // out: icon
        int         iIcon;                      // out: icon index
        DWORD       dwAttributes;               // out: SFGAO_ flags
        char[260]       szDisplayName;    // out: display name (or path)
        char[80]       szTypeName;             // out: type name
}

ulong SHGetFileInfoW(wchar* pszPath, DWORD dwFileAttributes, SHFILEINFOW *psfi, UINT cbFileInfo, UINT uFlags);
ulong SHGetFileInfo(char* pszPath, DWORD dwFileAttributes, SHFILEINFOA *psfi, UINT cbFileInfo, UINT uFlags);
HRESULT SetWindowTheme(          HWND hwnd,    LPCWSTR pszSubAppName,    LPCWSTR pszSubIdList);

UINT DragQueryFileA(          HANDLE hDrop,
    UINT iFile,
    LPTSTR lpszFile,
    UINT cch
);
UINT DragQueryFileW(          HANDLE hDrop,
    UINT iFile,
    wchar* lpszFile,
    UINT cch
);
BOOL DragQueryPoint(          HANDLE hDrop,   POINT* lppt);
int ShellAboutA(HWND hWnd, char* szApp, char* szOtherStuff, HICON hIcon);
int ShellAboutW(HWND hWnd, wchar* szApp, wchar* szOtherStuff, HICON hIcon);



BOOL DestroyIcon(          HICON hIcon);

//HRESULT HIMAGELIST_QueryInterface(HIMAGELIST himl, REFIID riid, void** ppv);
enum{
SHGFI_ICON             =0x000000100     // get icon
,SHGFI_DISPLAYNAME      =0x000000200     // get display name
,SHGFI_TYPENAME         =0x000000400     // get type name
,SHGFI_ATTRIBUTES       =0x000000800     // get attributes
,SHGFI_ICONLOCATION     =0x000001000     // get icon location
,SHGFI_EXETYPE          =0x000002000     // return exe type
,SHGFI_SYSICONINDEX     =0x000004000     // get system icon index
,SHGFI_LINKOVERLAY      =0x000008000     // put a link overlay on icon
,SHGFI_SELECTED         =0x000010000     // show icon in selected state
,SHGFI_ATTR_SPECIFIED   =0x000020000     // get only specified attributes
,SHGFI_LARGEICON        =0x000000000     // get large icon
,SHGFI_SMALLICON        =0x000000001     // get small icon
,SHGFI_OPENICON         =0x000000002     // get open icon
,SHGFI_SHELLICONSIZE    =0x000000004     // get shell size icon
,SHGFI_PIDL             =0x000000008     // pszPath is a pidl
,SHGFI_USEFILEATTRIBUTES=0x000000010     // use passed dwFileAttribute
,SHGFI_ADDOVERLAYS      =0x000000020     // apply the appropriate overlays
,SHGFI_OVERLAYINDEX     =0x000000040     // Get the index of the overlay
                                                // in the upper 8 bits of the iIcon
}

	enum{
/*
 * Flags for TrackPopupMenu
 */
TPM_LEFTBUTTON =0x0000L
,TPM_RIGHTBUTTON=0x0002L
,TPM_LEFTALIGN  =0x0000L
,TPM_CENTERALIGN=0x0004L
,TPM_RIGHTALIGN =0x0008L
,TPM_TOPALIGN       =0x0000L
,TPM_VCENTERALIGN   =0x0010L
,TPM_BOTTOMALIGN    =0x0020L

,TPM_HORIZONTAL     =0x0000L     /* Horz alignment matters more */
,TPM_VERTICAL       =0x0040L     /* Vert alignment matters more */
,TPM_NONOTIFY       =0x0080L     /* Don't send any notification msgs */
,TPM_RETURNCMD      =0x0100L
,TPM_RECURSE        =0x0001L
,TPM_HORPOSANIMATION=0x0400L
,TPM_HORNEGANIMATION=0x0800L
,TPM_VERPOSANIMATION=0x1000L
,TPM_VERNEGANIMATION=0x2000L
,TPM_NOANIMATION    =0x4000L
,TPM_LAYOUTRTL      =0x8000L
}


enum{
IMAGE_BITMAP        =0
,IMAGE_ICON        =  1
,IMAGE_CURSOR     =  2
,IMAGE_ENHMETAFILE   =3

,LR_DEFAULTCOLOR     =0x00000000
,LR_MONOCHROME       =0x00000001
,LR_COLOR            =0x00000002
,LR_COPYRETURNORG    =0x00000004
,LR_COPYDELETEORG   = 0x00000008
,LR_LOADFROMFILE     =0x00000010
,LR_LOADTRANSPARENT = 0x00000020
,LR_DEFAULTSIZE    =  0x00000040
,LR_VGACOLOR        = 0x00000080
,LR_LOADMAP3DCOLORS = 0x00001000
,LR_CREATEDIBSECTION =0x00002000
,LR_COPYFROMRESOURCE =0x00004000
,LR_SHARED           =0x00008000
}

/*
 * Key State Masks for Mouse Messages
 */
enum{
	MK_LBUTTON          =0x0001
	,MK_RBUTTON          =0x0002
	,MK_SHIFT            =0x0004
	,MK_CONTROL          =0x0008
	,MK_MBUTTON          =0x0010
	,MK_XBUTTON1         =0x0020
	,MK_XBUTTON2         =0x0040
}

HANDLE LoadImageA(HINSTANCE hInst,char* name,uint type,int cx,int cy,uint fuLoad);

HINSTANCE ShellExecuteA(HWND hwnd, char* lpOperation, char* lpFile, char* lpParameters, char* lpDirectory, int nShowCmd);
HINSTANCE ShellExecuteW(HWND hwnd, wchar* lpOperation, wchar* lpFile, wchar* lpParameters, wchar* lpDirectory, int nShowCmd);






bool Rectangle(HDC hdc, int left, int top, int right, int bottom);
bool RoundRect(HDC hdc, int left, int top, int right, int bottom, int width, int height);
BOOL Ellipse(
  HDC hdc,        // handle to DC
  int nLeftRect,  // x-coord of upper-left corner of rectangle
  int nTopRect,   // y-coord of upper-left corner of rectangle
  int nRightRect, // x-coord of lower-right corner of rectangle
  int nBottomRect // y-coord of lower-right corner of rectangle
);
BOOL Arc(
  HDC hdc,         // handle to device context
  int nLeftRect,   // x-coord of rectangle's upper-left corner
  int nTopRect,    // y-coord of rectangle's upper-left corner
  int nRightRect,  // x-coord of rectangle's lower-right corner
  int nBottomRect, // y-coord of rectangle's lower-right corner
  int nXStartArc,  // x-coord of first radial ending point
  int nYStartArc,  // y-coord of first radial ending point
  int nXEndArc,    // x-coord of second radial ending point
  int nYEndArc     // y-coord of second radial ending point
);
BOOL AngleArc(
  HDC hdc,            // handle to device context
  int X,              // x-coordinate of circle's center
  int Y,              // y-coordinate of circle's center
  DWORD dwRadius,     // circle's radius
  FLOAT eStartAngle,  // arc's start angle
  FLOAT eSweepAngle   // arc's sweep angle
);
BOOL BeginPath(
  HDC hdc   // handle to DC
);
BOOL EndPath(
  HDC hdc   // handle to DC
);
BOOL StrokeAndFillPath(
  HDC hdc   // handle to DC
);
HBRUSH CreateSolidBrush(
  COLORREF crColor   // brush color value
);
enum{
DEFAULT_QUALITY         =0,
DRAFT_QUALITY           =1,
PROOF_QUALITY           =2,
NONANTIALIASED_QUALITY  =3,
ANTIALIASED_QUALITY     =4,
CLEARTYPE_QUALITY       =5,
CLEARTYPE_NATURAL_QUALITY       =6
}
uint SetDCBrushColor(HDC hdc,uint color);
uint SetDCPenColor(HDC hdc, uint color);
DWORD GetSysColor(int nIndex);
BOOL StrokePath(
  HDC hdc   // handle to DC
);


int ChoosePixelFormat(
	HDC  hdc,	// device context to search for a best pixel format match
	PIXELFORMATDESCRIPTOR* ppfd	// pixel format for which a best match is sought
);

enum{
	/* pixel types */
	PFD_TYPE_RGBA        	=0
	,PFD_TYPE_COLORINDEX  =1

	/* layer types */
	,PFD_MAIN_PLANE       =0
	,PFD_OVERLAY_PLANE    =1
	,PFD_UNDERLAY_PLANE   =-1

	/* PIXELFORMATDESCRIPTOR flags */
	,PFD_DOUBLEBUFFER            =0x00000001
	,PFD_STEREO                  =0x00000002
	,PFD_DRAW_TO_WINDOW          =0x00000004
	,PFD_DRAW_TO_BITMAP          =0x00000008
	,PFD_SUPPORT_GDI             =0x00000010
	,PFD_SUPPORT_OPENGL          =0x00000020
	,PFD_GENERIC_FORMAT          =0x00000040
	,PFD_NEED_PALETTE            =0x00000080
	,PFD_NEED_SYSTEM_PALETTE     =0x00000100
	,PFD_SWAP_EXCHANGE           =0x00000200
	,PFD_SWAP_COPY               =0x00000400
	,PFD_SWAP_LAYER_BUFFERS      =0x00000800
	,PFD_GENERIC_ACCELERATED     =0x00001000
	,PFD_SUPPORT_DIRECTDRAW      =0x00002000
	,PFD_DIRECT3D_ACCELERATED    =0x00004000
	,PFD_SUPPORT_COMPOSITION     =0x00008000

	/* PIXELFORMATDESCRIPTOR flags for use in ChoosePixelFormat only */
	,PFD_DEPTH_DONTCARE          =0x20000000
	,PFD_DOUBLEBUFFER_DONTCARE   =0x40000000
	,PFD_STEREO_DONTCARE         =	0x80000000
}














alias uint MMRESULT;
alias HANDLE HWAVEOUT;

/*
 *  extended waveform format structure used for all non-PCM formats. this
 *  structure is common to all non-PCM formats.
 */
struct WAVEFORMATEX
{
	WORD        wFormatTag;         /* format type */
	WORD        nChannels;          /* number of channels (i.e. mono, stereo...) */
	DWORD       nSamplesPerSec;     /* sample rate */
	DWORD       nAvgBytesPerSec;    /* for buffer estimation */
	WORD        nBlockAlign;        /* block size of data */
	WORD        wBitsPerSample;     /* number of bits per sample of mono data */
	WORD        cbSize;             /* the count in bytes of the size of */
}
/* flags for wFormatTag field of WAVEFORMAT */
const(WORD) WAVE_FORMAT_PCM=1;

struct WAVEHDR {
	void*      lpData;
	DWORD      dwBufferLength;
	DWORD      dwBytesRecorded;
	uint  dwUser;
	DWORD      dwFlags;
	DWORD      dwLoops;
	WAVEHDR* lpNext;
	uint reserved;
}

MMRESULT waveOutOpen(
	out HWAVEOUT    phwo,
	uint       uDeviceID,
	WAVEFORMATEX* pwfx,
	uint      dwCallback,
	uint      dwCallbackInstance,
	DWORD          fdwOpen
);

MMRESULT waveOutSetVolume(
  HWAVEOUT hwo,
  DWORD dwVolume
);

MMRESULT waveOutPrepareHeader(
  HWAVEOUT hwo,
  ref WAVEHDR pwh,
  UINT cbwh
);

MMRESULT waveOutUnprepareHeader(
  HWAVEOUT hwo,
  ref WAVEHDR pwh,
  UINT cbwh
);

MMRESULT waveOutWrite(
  HWAVEOUT hwo,
  ref WAVEHDR pwh,
  UINT cbwh
);

MMRESULT waveOutReset(
  HWAVEOUT hwo
);

MMRESULT waveOutClose(
  HWAVEOUT hwo
);


/****************************************************************************

                        General error return values

****************************************************************************/
enum{
/* general error return values */
MMSYSERR_NOERROR      =0                    /* no error */
,MMSYSERR_ERROR        =1  /* unspecified error */
,MMSYSERR_BADDEVICEID  =2  /* device ID out of range */
,MMSYSERR_NOTENABLED   =3  /* driver failed enable */
,MMSYSERR_ALLOCATED    =4  /* device already allocated */
,MMSYSERR_INVALHANDLE  =5  /* device handle is invalid */
,MMSYSERR_NODRIVER     =6  /* no device driver present */
,MMSYSERR_NOMEM        =7  /* memory allocation error */
,MMSYSERR_NOTSUPPORTED =8  /* function isn't supported */
,MMSYSERR_BADERRNUM    =9  /* error value out of range */
,MMSYSERR_INVALFLAG    =10 /* invalid flag passed */
,MMSYSERR_INVALPARAM   =11 /* invalid parameter passed */
,MMSYSERR_HANDLEBUSY   =12 /* handle being used */
                                                   /* simultaneously on another */
                                                   /* thread (eg callback) */
,MMSYSERR_INVALIDALIAS = 13 /* specified alias not found */
,MMSYSERR_BADDB        =14 /* bad registry database */
,MMSYSERR_KEYNOTFOUND  =15 /* registry key not found */
,MMSYSERR_READERROR    =16 /* registry read error */
,MMSYSERR_WRITEERROR   =17 /* registry write error */
,MMSYSERR_DELETEERROR  =18 /* registry delete error */
,MMSYSERR_VALNOTFOUND  =19 /* registry value not found */
,MMSYSERR_NODRIVERCB   =20 /* driver does not call DriverCallback */
,MMSYSERR_MOREDATA     =21 /* more data to be returned */
,MMSYSERR_LASTERROR    =21 /* last error in range */
}

/****************************************************************************

                        Waveform audio support

****************************************************************************/
enum{
	WAVERR_BASE            =32
	/* waveform audio error return values */
	,WAVERR_BADFORMAT      =(WAVERR_BASE + 0)    /* unsupported wave format */
	,WAVERR_STILLPLAYING   =(WAVERR_BASE + 1)    /* still something playing */
	,WAVERR_UNPREPARED     =(WAVERR_BASE + 2)    /* header not prepared */
	,WAVERR_SYNC           =(WAVERR_BASE + 3)    /* device is synchronous */
	,WAVERR_LASTERROR      =(WAVERR_BASE + 3)    /* last error in range */

	,MM_WOM_OPEN         =0x3BB           /* waveform output */
	,MM_WOM_CLOSE        =0x3BC
	,MM_WOM_DONE         =0x3BD

	,MM_WIM_OPEN         =0x3BE           /* waveform input */
	,MM_WIM_CLOSE        =0x3BF
	,MM_WIM_DATA         =0x3C0

	/* wave callback messages */
	,WOM_OPEN        =MM_WOM_OPEN
	,WOM_CLOSE       =MM_WOM_CLOSE
	,WOM_DONE        =MM_WOM_DONE
	,WIM_OPEN        =MM_WIM_OPEN
	,WIM_CLOSE       =MM_WIM_CLOSE
	,WIM_DATA        =MM_WIM_DATA

	/* flags for dwFlags field of WAVEHDR */
	,WHDR_DONE       =0x00000001  /* done bit */
	,WHDR_PREPARED   =0x00000002  /* set if this header has been prepared */
	,WHDR_BEGINLOOP  =0x00000004  /* loop start block */
	,WHDR_ENDLOOP    =0x00000008  /* loop end block */
	,WHDR_INQUEUE    =0x00000010  /* reserved for driver */


	/* device ID for wave device mapper */
	,WAVE_MAPPER     =(cast(uint)-1)

	/* flags for dwFlags parameter in waveOutOpen() and waveInOpen() */
	, WAVE_FORMAT_QUERY         =0x0001
	, WAVE_ALLOWSYNC            =0x0002
	, WAVE_MAPPED               =0x0004
	, WAVE_FORMAT_DIRECT        =0x0008
	, WAVE_FORMAT_DIRECT_QUERY  =(WAVE_FORMAT_QUERY | WAVE_FORMAT_DIRECT)
}
/****************************************************************************

                          Driver callback support

****************************************************************************/
/* flags used with waveOutOpen(), waveInOpen(), midiInOpen(), and */
/* midiOutOpen() to specify the type of the dwCallback parameter. */
enum:DWORD{
	CALLBACK_TYPEMASK   =0x00070000    /* callback type mask */
	,CALLBACK_NULL       =0x00000000    /* no callback */
	,CALLBACK_WINDOW     =0x00010000    /* dwCallback is a HWND */
	,CALLBACK_TASK       =0x00020000    /* dwCallback is a HTASK */
	,CALLBACK_FUNCTION   =0x00030000    /* dwCallback is a FARPROC */
	,CALLBACK_THREAD     =(CALLBACK_TASK)/* thread ID replaces 16 bit task */
	,CALLBACK_EVENT      =0x00050000    /* dwCallback is an EVENT Handle */
}
//typedef void (CALLBACK DRVCALLBACK)(HDRVR hdrvr, UINT uMsg, DWORD_PTR dwUser, DWORD_PTR dw1, DWORD_PTR dw2);














BOOL QueryPerformanceCounter(          ref ulong pPerformanceCount);
BOOL QueryPerformanceFrequency(          ref ulong lpFrequency);


alias HANDLE CRITICAL_SECTION;
void InitializeCriticalSection(  out CRITICAL_SECTION lpCriticalSection);
void DeleteCriticalSection(  ref CRITICAL_SECTION lpCriticalSection);
bool TryEnterCriticalSection(  ref  CRITICAL_SECTION lpCriticalSection);
void EnterCriticalSection(  ref  CRITICAL_SECTION lpCriticalSection);
void LeaveCriticalSection(  ref  CRITICAL_SECTION lpCriticalSection);


HANDLE CreateEventA(  SECURITY_ATTRIBUTES* lpEventAttributes,  bool bManualReset,  bool bInitialState,  char* lpName);
bool SetEvent( HANDLE hEvent);
bool ResetEvent( HANDLE hEvent);
DWORD WaitForSingleObject( HANDLE hHandle, DWORD dwMilliseconds);



}


alias bool function(HWND hwnd,    LPARAM lParam) EnumWindowsProc;

