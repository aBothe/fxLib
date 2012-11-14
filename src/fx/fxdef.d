module fx.fxdef;
import std.file,std.path, core.thread, std.utf, std.string, std.md5, std.math,std.conv;
import fx.string, fx.memory;
import fx.win32, std.regex, std.conv, std.traits;
import std.ascii;

/// short form of std.string.toStringz
alias std.string.toStringz toz;

/// Set current directory
version(Windows) void setcwd(S)(S dir)
{
	SetCurrentDirectoryW(
		toUTF16(
			dir~(endsWith(dir,"\0")?"\0":"")
			).ptr
		);
}

template ArrayBaseType(T : U[],U)
{
	alias U ArrayBaseType;
}

/// manually draws an arc to a painting device
void DrawArc(HDC dc, Point M, int r, double start, double angle, double prec=0.1)
{
	MoveToEx(dc, M.x, M.y, null);
	
	double
		ast=(PI/180)*(start+90),
	aang=(PI/180)*angle;
	
	LineTo(dc, cast(int)(M.x+sin(ast)*r),cast(int)(M.y+cos(ast)*r));
	for(double i=ast;i<ast+aang; i+=prec)
	{
		LineTo(dc, cast(int)(M.x+sin(i)*r), cast(int)(M.y+cos(i)*r));
		if(i+prec>=ast+aang)
			prec=0.001;
	}
	LineTo(dc, M.x, M.y);
}

/// 2 dimensional position locator
struct Point
{
public:
	/// Width, in pixels
	int width;
	int height; /// Height
	alias width x;
	alias height y;
	/**
	 * Point constructor
	 * Example:
	 * ---
	 * auto P=Point(100,100);
	 * ---
	 */
	static Point opCall(int x,int y)
	{
		Point ret;
		ret.width=x;
		ret.height=y;
		return ret;
	}
	
	static Point opCall(Point p)
	{
		Point ret;
		ret.width=p.x;
		ret.height=p.y;
		return ret;
	}
}

/// wait t seconds
void wait(double t=1.0)
{
	core.thread.Thread.sleep(dur!("msecs")(cast(int)(t*1000)));
}

/// toggle the checked state of a menu item
bool ToggleMenuItem(HANDLE m, uint id, int flag=MF_BYCOMMAND)
{
	int prevState=CheckMenuItem(m,id,cast(uint)(flag+MF_CHECKED));
	if(prevState==MF_CHECKED)	{	CheckMenuItem(m,id,cast(uint)(flag+MF_UNCHECKED));	return true;	}
	return false;
}

/// This function determines the angle of a point P in a circle with the middle point M whereby the start angle is 0 degrees
float calcAngleBetween(Point M,Point P)
{
	float ret=0;
	
	/*	Calculate vertical and horizontal differences	*/
	float p=abs(P.x-M.x);
	float h=P.y-M.y;
	
	/*	Prevent wrong results	*/
	if(p==0 && h<0) return 90f;
	if(p==0) return 270f;
	if(h==0 && P.x<M.x) return 180f;
	
	h=abs(h);
	
	/*	Result will be arcus tangent of height/width	(Triangle calculations)	*/
	
	/*	P is in the first or third quadrant	*/
	if(	(P.x<M.x && P.y<M.y)	||	(P.x>M.x && P.y>M.y))
		ret+=(180/PI)*(	PI/2-atan(h/p)	);
	/*	P is in the second or fourth quadrant	*/
	else
		ret+=(180/PI)*(	atan(h/p)	);
	
	/*	Until now, the result would just be less than 90 degrees -> add missing quadrant qantities	*/
	if(P.x<M.x && P.y<M.y)	ret+=90f;
	else	if(P.x<M.x && P.y>M.y)	ret+=180f;
	else	if(P.x>M.x && P.y>M.y)	ret+=270f;
	
	return ret;
}

/// MD5-Wrapper
string md5(string s)
{
	return toLower(getDigestString(s));
}

/// Load data from resources
HICON LoadBitmap(string Name,int Width=16, int Height=16,bool Transparent=true)
{
	return LoadImageA(GetModuleHandleA(null),cast(char*)toz(Name),IMAGE_BITMAP, Width,Height, Transparent?(LR_CREATEDIBSECTION+LR_LOADTRANSPARENT):0);
}
/// ditto
HICON LoadIcon(string Name)
{
	return LoadIconA(GetModuleHandleA(null),toz(Name));
}
/// ditto
HMENU LoadMenu(string Name)
{
	return LoadMenuA(GetModuleHandleA(null),toz(Name));
}
///ditto
void* LoadData(string Name,string ResType="RT_RCDATA",HINSTANCE ModuleInstance=null)
{
	HANDLE th=LoadResource(ModuleInstance,FindResourceA(ModuleInstance,cast(char*)toz(Name),cast(char*)toz(ResType)));
	void* ret=LockResource(th);
	FreeResource(th);
	return ret;
}

/// Execute file via Windows-Shell
HINSTANCE ShellExecute(wstring file, wstring action="open"w, wstring params=""w, wstring dir="."w, HWND par=null, int show=SW_SHOW)
{	return ShellExecuteW(par,	cast(wchar*)action,	cast(wchar*)file,	cast(wchar*)params,	cast(wchar*)dir,	show);	}
/// ditto
HINSTANCE ShellExecute(string file, string action="open", string params="", string dir=".", HWND par=null, int show=SW_SHOW)
{	return ShellExecuteA(par,	cast(char*)action,	cast(char*)file,	cast(char*)params,	cast(char*)dir,	show);	}

/// needed to specify the icon size for getExtIco()
enum IconSize{
	Small=SHGFI_SMALLICON, /// 16x16 Pixel
	Large=SHGFI_LARGEICON /// 32x32 Pixel
}

/// Load file icon associated by Windows
HICON getExtIco(string fn,IconSize icoFlags=IconSize.Large)
{
	SHFILEINFOA fi;
	if(!endsWith(fn,"\0")) fn~="\0"; // cast(char*)tfn.ptr
	SHGetFileInfo(cast(char*)fn, 0, &fi, fi.sizeof, cast(int)icoFlags+SHGFI_ICON+SHGFI_USEFILEATTRIBUTES);
	return fi.hIcon;
}

/// Retrieve default file description of a file
wstring getFileType(wstring fn)
{
	SHFILEINFOW fi;
	if(!endsWith(fn,"\0"w)) fn~="\0"w; // cast(char*)tfn.ptr
	SHGetFileInfoW(cast(wchar*)fn, 0, &fi, fi.sizeof, SHGFI_TYPENAME+SHGFI_USEFILEATTRIBUTES);
	return to!(wstring)(fi.szTypeName);
}

/**
 * Converts a hexadecimal string into a number
 * Example:
 * ---
 * string hex="0xFF";
 * assert(HexStrToLong(hex)==255);
 * ---
 */
ulong HexStrToLong(string s) // e.g. "0xFF" will result in 255
{
	ulong ret=0;
	if(s.length<1) return ret;
	string t=chompPrefix(strip(toUpper(s)),"0X"); // strip obsolete characters
	
	foreach(i,c; t)
	{
		int v=-1;
		int pos=t.length-i-1;
		foreach(j, d; fullHexDigits) 
			if(c==d) 
				v=j; // assign hexadecimal value of c (0-15) to v
		
		if(v<0) 
			break; // if c not a hexdigit: return
		
		ret+=v*(std.math.pow(16.0,pos));
	}
	return ret;
}

/**
 * Converts a number into a hexadecimal string
 * Example:
 * ---
 * assert(LongToHexStr(255)=="ff");
 * ---
 */
string LongToHexStr(ulong v) // 255 will return "ff"
{	return format("%x",v);	}

T encodeToURL(T)(T s)
{
	auto r=regex(cast(T)"[^0-9a-zA-Z$_.+!*'(),]", "g"); // TODO: "-"
	T sub(RegexMatch!(T) m)
	{
		auto v=cast(uint)    ( m.hit )[0];
		scope auto ts=LongToHexStr(  v  );
		if(ts.length<2) ts="0"~ts;
		return to!(T)( "%"~ts );
	}
	return replace!(sub)(s,r);
}

/// Message box wrapping class
class MessageBox
{
	static enum{
		Ok=MB_OK, /// Simple OK Button
		YesNo=MB_YESNO, /// Yes, No
		AbortRetryIgnore=MB_ABORTRETRYIGNORE, /// Abort, Retry, Ignore
		OkCancel=MB_OKCANCEL,/// OK, Cancel
		YesNoCancel=MB_YESNOCANCEL,/// Yes, No, Cancel
		
		Question=MB_ICONQUESTION, /// Icon
		Info=MB_ICONASTERISK, ///ditto
		Stop=MB_ICONSTOP,///ditto
		Error=MB_ICONERROR,///ditto
		Warning=MB_ICONWARNING,///ditto
		
		DefButton1=MB_DEFBUTTON1,/// Specify default selected button
		DefButton2=MB_DEFBUTTON2,///ditto
		DefButton3=MB_DEFBUTTON3,///ditto
		DefButton4=MB_DEFBUTTON4,///ditto
		
		AppModal=MB_APPLMODAL,/// Bind modes
		SysModal=MB_SYSTEMMODAL, ///ditto
	}
	/**
	 * Shows a message box
	 * Returns:
	 * The button id which the user have selected
	 */
	static int Show(char* t, char* cap=cast(char*)" ",int style=Ok) nothrow
	{
		return MessageBoxA(null,t,cap,style);
	}
	///ditto
	static int Show(string t,string cap=" ",int style=Ok) nothrow
	{
		return MessageBoxA(null,cast(char*)toz(t),cast(char*)toz(cap),style);
	}
	///ditto
	static int Show(wstring t,wstring cap=" ",int style=Ok) nothrow
	{
		try{
		return MessageBoxW(null,cast(wchar*)t.ptr,cast(wchar*)cap.ptr,style);
		}catch{return -1;}
	}
}

/// Retrieve High-Level data of an 32bit-integer
WORD fxHIWORD(uint l)
{
	return cast(ushort)((l >> 16) & 0xFFFF);
}
/// Retrieve Low-Level data of an 32bit-integer
WORD fxLOWORD(uint l)
{
	return cast(ushort)l;
}

/// build LO-HI-Data for SendMessageA
uint MAKEWPARAM(ushort l,ushort h)
{
	return (cast(uint)MAKELONG(l, h));
}
///ditto
int MAKELPARAM(ushort l,ushort h)
{
	return (cast(int)MAKELONG(l, h));
}
/// ditto
uint MAKELONG(ushort a,ushort b)
{
	return cast(uint) (a)+(b<<16);
}

/// Checks if directory exists. If not, then it will be created
void ChkDirExists(string dir)
{
	if (!exists(dir))	mkdirRecurse(dir);
}

///Class for getting functions from dynamically linked libraries
class Module
{
	private HMODULE hm;
	public HMODULE Handle() {return hm;}
	this(string name)
	{
		hm=LoadLibraryA(cast(char*)toz(name));
	}
	
	/**
Returns handle to function called like "name"
Example:
---
extern(C)
{
int function(HWND hwnd,char* text,char* title, uint style) MessageBox=null;
}

Module mod=new Module("user32.dll");
mod.GetSymbol(MessageBox,"MessageBoxA")(null,cast(char*)"Test",cast(char*)"TestTitle",MB_OK);
---
	 */
	Fun GetSymbol(Fun)(ref Fun func,string name)
	{
		return func=cast(Fun)GetProcAddress(hm,cast(char*)toz(name));
	}
	
	/// Unloads the library
	void Unload()
	{
		if(hm!=null)
			FreeLibrary(hm);
		hm=null;
	}
	
	~this()
	{
		Unload();
	}
}
