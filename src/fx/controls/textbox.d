module fx.controls.textbox;
import core.thread;
import fx.win32,fx.event;
import fx.control;
import fx.application;
import std.string;

private
{
	alias std.string.toStringz toz;
}
private // Load RichEdit-class from DLL
{
	static HINSTANCE hRichEd32Dll=null;
	static this()
	{
		try
			{
				if (hRichEd32Dll==null) // for sure
					{
						hRichEd32Dll = LoadLibraryA("MSFTEDIT.DLL");
					}
				if (hRichEd32Dll==null) // for more sureness
					{
						hRichEd32Dll = LoadLibraryA("RICHED32.DLL");
					}
			}
		catch {}
	}
static ~this()
	{
		if (hRichEd32Dll!=null)
			{
				FreeLibrary(hRichEd32Dll);
				hRichEd32Dll = null;
			}
	}
}

struct charformat2 {
	uint cbSize;
	DWORD dwMask;
	DWORD dwEffects;
	LONG yHeight;
	LONG yOffset;
	DWORD crTextColor; // COLORREF
	BYTE bCharSet;
	BYTE bPitchAndFamily;
	char[32] szFaceName; // LF_FACESIZE
	WORD wWeight;
	SHORT sSpacing;
	DWORD crBackColor;
	DWORD lcid;
	DWORD dwReserved;
	SHORT sStyle;
	WORD wKerning;
	BYTE bUnderlineType;
	BYTE bAnimation;
	BYTE bRevAuthor;
	BYTE bReserved1;
}
///
class TextBox : Control
	{
		public :
			static enum
			{
				ES_LEFT =             0x0000,///
				ES_CENTER =           0x0001,///
				ES_RIGHT =            0x0002,///
				ES_MULTILINE =        0x0004,///
				ES_UPPERCASE =        0x0008,///
				ES_LOWERCASE =        0x0010,///
				ES_PASSWORD =         0x0020,///
				ES_AUTOVSCROLL =      0x0040,///
				ES_AUTOHSCROLL =      0x0080,///
				ES_NOHIDESEL =        0x0100,///
				ES_OEMCONVERT =       0x0400,///
				ES_READONLY =         0x0800,///
				ES_WANTRETURN =       0x1000,///
				ES_NUMBER =           0x2000,///

				EM_SETCHARFORMAT		=(WM_USER + 68)




// CHARFORMAT masks
,CFM_BOLD		=0x00000001
,CFM_ITALIC	=	0x00000002
,CFM_UNDERLINE	=0x00000004
,CFM_STRIKEOUT	=0x00000008
,CFM_PROTECTED=	0x00000010
,CFM_LINK		=0x00000020			// Exchange hyperlink extension
,CFM_SIZE		=0x80000000
,CFM_COLOR	=	0x40000000
,CFM_FACE		=0x20000000
,CFM_OFFSET	=	0x10000000
,CFM_CHARSET	=	0x08000000

// CHARFORMAT effects
,CFE_BOLD		=0x0001
,CFE_ITALIC	=	0x0002
,CFE_UNDERLINE	=0x0004
,CFE_STRIKEOUT	=0x0008
,CFE_PROTECTED	=0x0010
,CFE_LINK		=0x0020
,CFE_AUTOCOLOR	=0x40000000			// NOTE: this corresponds to
											// CFM_COLOR, which controls it
// Masks and effects defined for CHARFORMAT2 -- an (*) indicates
// that the data is stored by RichEdit 2.0/3.0, but not displayed
,CFM_SMALLCAPS		=0x0040			// (*)
,CFM_ALLCAPS			=0x0080			// Displayed by 3.0
,CFM_HIDDEN			=0x0100			// Hidden by 3.0
,CFM_OUTLINE			=0x0200			// (*)
,CFM_SHADOW			=0x0400			// (*)
,CFM_EMBOSS			=0x0800			// (*)
,CFM_IMPRINT			=0x1000			// (*)
,CFM_DISABLED		=0x2000
,CFM_REVISED			=0x4000

,CFM_BACKCOLOR		=0x04000000
,CFM_LCID			=0x02000000
,CFM_UNDERLINETYPE	=0x00800000		// Many displayed by 3.0
,CFM_WEIGHT		=	0x00400000
,CFM_SPACING		=	0x00200000		// Displayed by 3.0
,CFM_KERNING		=	0x00100000		// (*)
,CFM_STYLE	=		0x00080000		// (*)
,CFM_ANIMATION		=0x00040000		// (*)
,CFM_REVAUTHOR	=	0x00008000

,CFE_SUBSCRIPT		=0x00010000		// Superscript and subscript are
,CFE_SUPERSCRIPT	=	0x00020000		//  mutually exclusive

,CFM_SUBSCRIPT		=(CFE_SUBSCRIPT | CFE_SUPERSCRIPT)
,CFM_SUPERSCRIPT	=	CFM_SUBSCRIPT

// CHARFORMAT "ALL" masks
,CFM_EFFECTS =(CFM_BOLD | CFM_ITALIC | CFM_UNDERLINE | CFM_COLOR |
					 CFM_STRIKEOUT | CFE_PROTECTED | CFM_LINK)
,CFM_ALL =(CFM_EFFECTS | CFM_SIZE | CFM_FACE | CFM_OFFSET | CFM_CHARSET)

,CFM_EFFECTS2 =(CFM_EFFECTS | CFM_DISABLED | CFM_SMALLCAPS | CFM_ALLCAPS
					| CFM_HIDDEN  | CFM_OUTLINE | CFM_SHADOW | CFM_EMBOSS
					| CFM_IMPRINT | CFM_DISABLED | CFM_REVISED
					| CFM_SUBSCRIPT | CFM_SUPERSCRIPT | CFM_BACKCOLOR)

,CFM_ALL2	 =(CFM_ALL | CFM_EFFECTS2 | CFM_BACKCOLOR | CFM_LCID
					| CFM_UNDERLINETYPE | CFM_WEIGHT | CFM_REVAUTHOR
					| CFM_SPACING | CFM_KERNING | CFM_STYLE | CFM_ANIMATION)

,CFE_SMALLCAPS		=CFM_SMALLCAPS
,CFE_ALLCAPS			=CFM_ALLCAPS
,CFE_HIDDEN			=CFM_HIDDEN
,CFE_OUTLINE			=CFM_OUTLINE
,CFE_SHADOW			=CFM_SHADOW
,CFE_EMBOSS			=CFM_EMBOSS
,CFE_IMPRINT			=CFM_IMPRINT
,CFE_DISABLED		=CFM_DISABLED
,CFE_REVISED			=CFM_REVISED

// CFE_AUTOCOLOR and CFE_AUTOBACKCOLOR correspond to CFM_COLOR and
// CFM_BACKCOLOR, respectively, which control them
,CFE_AUTOBACKCOLOR	=CFM_BACKCOLOR

// Underline types. RE 1.0 displays only CFU_UNDERLINE
,CFU_CF1UNDERLINE	=0xFF	// Map charformat's bit underline to CF2
,CFU_INVERT			=0xFE	// For IME composition fake a selection
,CFU_UNDERLINETHICKLONGDASH		=18	// (*) display as dash
,CFU_UNDERLINETHICKDOTTED		=17	// (*) display as dot
,CFU_UNDERLINETHICKDASHDOTDOT	=16	// (*) display as dash dot dot
,CFU_UNDERLINETHICKDASHDOT		=15	// (*) display as dash dot
,CFU_UNDERLINETHICKDASH			=14	// (*) display as dash
,CFU_UNDERLINELONGDASH			=13	// (*) display as dash
,CFU_UNDERLINEHEAVYWAVE			=12	// (*) display as wave
,CFU_UNDERLINEDOUBLEWAVE		=	11	// (*) display as wave
,CFU_UNDERLINEHAIRLINE			=10	// (*) display as single
,CFU_UNDERLINETHICK				=9
,CFU_UNDERLINEWAVE				=8
,CFU_UNDERLINEDASHDOTDOT		=	7
,CFU_UNDERLINEDASHDOT			=6
,CFU_UNDERLINEDASH				=5
,CFU_UNDERLINEDOTTED			=	4
,CFU_UNDERLINEDOUBLE			=	3	// (*) display as single
,CFU_UNDERLINEWORD				=2	// (*) display as single
,CFU_UNDERLINE					=1
,CFU_UNDERLINENONE				=0

,yHeightCharPtsMost =1638


// EM_SETCHARFORMAT wParam masks
,SCF_SELECTION		=0x0001
,SCF_WORD		=	0x0002
,SCF_DEFAULT		=	0x0000	// Set default charformat or paraformat
,SCF_ALL			=	0x0004	// Not valid with SCF_SELECTION or SCF_WORD
,SCF_USEUIRULES	=	0x0008	// Modifier for SCF_SELECTION; says that
									//  format came from a toolbar, etc., and
									//  hence UI formatting rules should be
									//  used instead of literal formatting
,SCF_ASSOCIATEFONT	=0x0010	// Associate fontname with bCharSet (one
									//  possible for each of Western, ME, FE,
									//  Thai)
,SCF_NOKBUPDATE	=	0x0020	// Do not update KB layput for this change
									//  even if autokeyboard is on
,SCF_ASSOCIATEFONT2=	0x0040	// Associate plane-2 (surrogate) font

			}

			///
			void SetCharFormat(charformat2* cf, uint whatType=SCF_ALL)///
			{
				SendMessageA(handle,EM_SETCHARFORMAT,whatType,cast(int)cf);
			}
			///
			void FontSize(uint pt, uint whatType=SCF_ALL) ///Size values always in pt (Points)
			{
				charformat2 cf;
				cf.cbSize=cf.sizeof;
				cf.dwMask=CFM_SIZE;
				cf.yHeight=pt*20;
				SetCharFormat(&cf,whatType);
			}
			///
			void FontColor(uint col, uint whatType=SCF_ALL) ///
			{
				charformat2 cf;
				cf.cbSize=cf.sizeof;
				cf.dwMask=CFM_COLOR;
				cf.crTextColor=col;
				SetCharFormat(&cf,whatType);
			}
			///
			void FontFace(string face, uint whatType=SCF_ALL)///
			{
				if(face.length>=32) return;
				charformat2 cf;
				cf.cbSize=cf.sizeof;
				cf.dwMask=CFM_FACE;
				if(!endsWith(face,"\0")) face~="\0";
				cf.szFaceName[0 .. face.length]=face;
				SetCharFormat(&cf,whatType);
			}

			///
			this(Control par, int x,int y,int w,int h, int st=WS_BORDER, int exst=0) {
				this(par,"",x,y,w,h,st,exst);
			}

			///ditto
			this(Control par, wstring caption, int x,int y,int w,int h,int style=WS_BORDER,int exstyle=0)
			{
				super(par,"RICHEDIT50W",x,y,w,h,style,exstyle);
				OnKeyDown=new OnKeyDownEH();
				AddEvent(WM_CHAR,&_onkey);
				Text=caption;
			}

			void IsModified(bool mod)///
			{
				SendMessageA(handle,EM_SETMODIFY,mod,0);
			}
			bool IsModified()///ditto
			{
				return SendMessageA(handle,EM_GETMODIFY,0,0)==0 ? false:true;
			}
			void SetSelection(int start,int end)///
			{
				SendMessageA(handle,EM_SETSEL,start,end);
			}
			void TextLimit(int limit)///
			{
				SendMessageA(handle,EM_SETLIMITTEXT,limit,0);
			}
			int  TextLimit()///ditto
			{
				return SendMessageA(handle,EM_GETLIMITTEXT,0,0);
			}
			void PasswordChar(char pw)///
			{
				SendMessageA(handle,EM_SETPASSWORDCHAR,pw,0);
			}
			char PasswordChar()///ditto
			{
				return cast(char)SendMessageA(handle,EM_GETPASSWORDCHAR,0,0);
			}

		private:
			static alias EventHandler!(bool,uint) OnKeyDownEH;
			private int _onkey(WindowEvent e)
			{
				return cast(int)OnKeyDown(this,e.wParam);
			}
		public OnKeyDownEH OnKeyDown;///bool delegate(uint key)
	}

///
class Label : Control
	{
		public :
			///
			this(Control par,wstring cap, int x,int y,int w,int h,int style=0)	{	super(par,"STATIC",x,y,w,h,style);	Text=cap;	}
			///ditto
			this(Control par, int x,int y,int w,int h,int style=0)	{	this(par,"",x,y,w,h,style);	}
	}
