import fx.win32;
import fx.control;
import std.string, std.conv;
private{
alias std.string.toStringz toz;
}

///
class IPBox : Control
{
public:
static enum{
WM_USER                         =0x0400,
IPM_CLEARADDRESS =(WM_USER+100), // no parameters
IPM_SETADDRESS   =(WM_USER+101), // lparam = TCP/IP address
IPM_GETADDRESS   =(WM_USER+102), // lresult = # of non black fields.  lparam = LPDWORD for TCP/IP address
IPM_SETRANGE =(WM_USER+103), // wparam = field, lparam = range
IPM_SETFOCUS =(WM_USER+104), // wparam = field
IPM_ISBLANK  =(WM_USER+105), // no parameters
}

this(Control par,int x,int y,int w,int h,int style=0,int exst=0)///
	{
		super(par,"SysIPAddress32",x,y,w,h,style,exst);
	}

static int MAKEIPADDRESS(int b1, int b2, int b3, int b4)///
{
return cast(int)((cast(DWORD)(b1)<<24)+(cast(DWORD)(b2)<<16)+(cast(DWORD)(b3)<<8)+(cast(DWORD)(b4)));
}

static int FIRST_IPADDRESS(int x)  {return (x>>24)&0xff;}///
static int SECOND_IPADDRESS(int x) {return (x>>16) & 0xff;}///
static int THIRD_IPADDRESS(int x)  {return (x>>8) & 0xff;}///
static int FOURTH_IPADDRESS(int x) {return x&0xff;}///



void value(int[4] t)///
{
SendMessageA(handle,IPM_SETADDRESS,0,MAKEIPADDRESS(t[0],t[1],t[2],t[3]));
}
int[] value()///ditto
{
DWORD ret;
SendMessageA(handle,IPM_GETADDRESS,0,cast(int) &ret);
return [FIRST_IPADDRESS(ret),SECOND_IPADDRESS(ret),THIRD_IPADDRESS(ret),FOURTH_IPADDRESS(ret)];
}

string toString()///
{
	int[] r=value;
return to!(string)(r[0])~"."~to!(string)(r[1])~"."~to!(string)(r[2])~"."~to!(string)(r[3]);
}

}
