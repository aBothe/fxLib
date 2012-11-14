module fx.controls.notifyicon;
import fx.fxdef, fx.control, fx.win32, std.conv, std.utf, fx.event;

pragma(lib,"shell32.lib");

extern(Windows)
{
	//bool Shell_NotifyIconA(uint dwMessage,NOTIFYICONDATA* lpdata);
	bool Shell_NotifyIconW(uint dwMessage,NOTIFYICONDATAW* lpdata);
}

/*static struct NOTIFYICONDATA {
	DWORD cbSize;
	HWND hWnd;
	uint uID;
	uint uFlags;
	uint uCallbackMessage;
	HICON hIcon;
	char[64] szTip;
	DWORD dwState;
	DWORD dwStateMask;
	char[256] szInfo;
	union {
		uint uTimeout;
		uint uVersion;
	};
	char[64] szInfoTitle;
	DWORD dwInfoFlags;
	GUID guidItem;
	HICON hBalloonIcon;
}*/

static struct NOTIFYICONDATAW {
	DWORD cbSize;
	HWND hWnd;
	uint uID;
	uint uFlags;
	uint uCallbackMessage;
	HICON hIcon;
	wchar[64] szTip; // max. 64 chars
	DWORD dwState;
	DWORD dwStateMask;
	wchar[256] szInfo; // max 256
	union {
		uint uTimeout;
		uint uVersion;
	};
	wchar[64] szInfoTitle; // max 64
	DWORD dwInfoFlags;
	GUID guidItem;
	HICON hBalloonIcon;
}
///
class NotifyIcon{
	public:

	package static enum
	{
		NIM_ADD         =0x00000000,
		NIM_MODIFY      =0x00000001,
		NIM_DELETE      =0x00000002,
		NIM_SETFOCUS    =0x00000003,
		NIM_SETVERSION  =0x00000004,

		NOTIFYICON_VERSION      =3,
		NOTIFYICON_VERSION_4    =4,

		NIN_SELECT          =(WM_USER + 0),
		NINF_KEY            =0x1,
		NIN_KEYSELECT       =(NIN_SELECT | NINF_KEY),
		NIN_BALLOONSHOW         =(WM_USER + 2),
		NIN_BALLOONHIDE         =(WM_USER + 3),
		NIN_BALLOONTIMEOUT      =(WM_USER + 4),
		NIN_BALLOONUSERCLICK    =(WM_USER + 5),
		NIN_POPUPOPEN           =(WM_USER + 6),
		NIN_POPUPCLOSE          =(WM_USER + 7),

		NIF_MESSAGE    =0x00000001,
		NIF_ICON       =0x00000002,
		NIF_TIP        =0x00000004,
		NIF_STATE      =0x00000008,
		NIF_INFO       =0x00000010,
		NIF_GUID       =0x00000020,
		NIF_REALTIME   =0x00000040,
		NIF_SHOWTIP    =0x00000080,

		NIS_HIDDEN             =0x00000001,
		NIS_SHAREDICON         =0x00000002,
		// says this is the source of a shared icon

		// Notify Icon Infotip flags
		NIIF_NONE      =0x00000000,
		// icon flags are mutually exclusive
		// and take only the lowest 2 bits
		NIIF_INFO      =0x00000001,
		NIIF_WARNING   =0x00000002,
		NIIF_ERROR     =0x00000003,
		NIIF_USER      =0x00000004,
		NIIF_ICON_MASK =0x0000000F,
		NIIF_NOSOUND   =0x00000010,
		NIIF_LARGE_ICON=0x00000020
	}

	protected NOTIFYICONDATAW nd;
	private static uint _gnid=1;
	public HMENU ContextMenuStrip;///

	///
	this(Control parent)
	{
		OnLClick=new OnClickEH();
		OnRClick=new OnClickEH();
		OnDblClick=new OnClickEH();

		nd.cbSize=nd.sizeof;
		nd.hWnd=parent.handle;
		nd.uID=_gnid;
		_gnid++;

		nd.uFlags=NIF_MESSAGE;
		nd.uCallbackMessage=WM_USER+34;

		parent.AddEvent(nd.uCallbackMessage, delegate int(WindowEvent e){
			switch(cast(uint)e.lParam)
			{
				case WM_LBUTTONUP:
					OnLClick(this);
				break;

				case WM_RBUTTONUP:
					OnRClick(this);

					if(ContextMenuStrip!=null)
					{
						POINT p;
						GetCursorPos(&p);
						TrackPopupMenu(ContextMenuStrip, TPM_RIGHTALIGN | TPM_RIGHTBUTTON, p.x, p.y, 0, parent.handle, null);
					}
				break;

				case WM_LBUTTONDBLCLK:
					OnDblClick(this);
				break;

				default:break;
			}
			return 0;
		});

		Shell_NotifyIconW(NIM_ADD, &nd);
	}

	alias EventHandler!(void) OnClickEH;///
	OnClickEH OnLClick;///
	OnClickEH OnRClick;///
	OnClickEH OnDblClick;///
	alias OnLClick OnClick;

	void Icon(HICON ico)///
	{
		nd.hIcon=ico;
		nd.uFlags=NIF_ICON;
		Shell_NotifyIconW(NIM_MODIFY, &nd);
	}

	void ToolTip(wstring s)///
	{
		if(s.length>63)s.length=63;
		nd.szTip[0 .. s.length]=cast(wchar[])(s);
		nd.szTip[s.length]='\0';

		nd.uFlags=NIF_TIP;
		Shell_NotifyIconW(NIM_MODIFY, &nd);
	}

	void ToolTip(string s)///ditto
	{
		ToolTip(toUTF16(s));
	}

	void EnableRealtimeToolTip()///
	{
		nd.uFlags=NIF_REALTIME;
		Shell_NotifyIconW(NIM_MODIFY, &nd);
	}

	void IsVisible(bool v)///
	{
		if(v && nd.uID<=0)
		{
			nd.uID=_gnid;
			Shell_NotifyIconW(NIM_ADD, &nd);
		}else if(nd.uID>0){
			Shell_NotifyIconW(NIM_DELETE, &nd);
			nd.uID=0;
		}
	}

	bool IsVisible()///ditto
	{
		return nd.uID>0;
	}

	~this()
	{
		Shell_NotifyIconW(NIM_DELETE, &nd);
	}

	}
