module fx.console;

import fx.myfx, fx.win32, fx.event;
import std.conv, core.thread;
import std.stdio;

///Console modification
class Console{
	private HANDLE hStdOut;

	///
	this()
	{
		hStdOut=GetStdHandle(STD_OUTPUT_HANDLE);
	}

	///Clear the console while setting the forground and background colors.
	void ClearToColors(int ForgC, int BackC)
	{
		auto wColor = ((BackC & 0x0F) << 4) + (ForgC & 0x0F);
		COORD coord = {0, 0};
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		//Here we will set the current color
		SetConsoleTextAttribute(hStdOut, cast(ushort)wColor);
		if(GetConsoleScreenBufferInfo(hStdOut, &csbi))
		{
			//This fills the buffer with a given character (in this case 32=space).
			FillConsoleOutputCharacterA(hStdOut, cast(char) 32, csbi.dwSize.X * csbi.dwSize.Y, coord, null);
			FillConsoleOutputAttribute(hStdOut, csbi.wAttributes, csbi.dwSize.X * csbi.dwSize.Y, coord, null );
			//This will set our cursor position for the next print statement.
			SetConsoleCursorPosition(hStdOut, coord);
		}
	}

	///Clear row y
	void ClearRow(short y)
	{
		COORD coord = {0, y};
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		GetConsoleScreenBufferInfo(hStdOut, &csbi);
		FillConsoleOutputCharacterA(hStdOut, ' ', csbi.dwSize.X , coord, null);
	}

	///Clear the console.
	void Clear()
	{
		//This is a structure containing all of the console info
		// it is used here to find the size of the console.
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		COORD coord = {0, 0};
		//Here we will set the current color
		if(GetConsoleScreenBufferInfo(hStdOut, &csbi))
		{
			//This fills the buffer with a given character (in this case 32=space).
			FillConsoleOutputCharacterA(hStdOut, ' ', csbi.dwSize.X * csbi.dwSize.Y, coord, null);
			FillConsoleOutputAttribute(hStdOut, csbi.wAttributes, csbi.dwSize.X * csbi.dwSize.Y, coord, null );
			//This will set our cursor position for the next print statement.
			SetConsoleCursorPosition(hStdOut, coord);
		}
	}

	///Set the position of the cursor
	void CursorPosition(short x, short y)
	{
		COORD coord = {x, y};
		SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
	}

	///ditto
	void CursorPosition(COORD coord)
	{
		SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
	}

	///Get the position of the cursor
	COORD CursorPosition()
	{
		COORD ret;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		GetConsoleScreenBufferInfo(hStdOut, &csbi);

		ret=csbi.dwCursorPosition;
		return ret;
	}

	///Set the text color for printing in a console window.
	void ForeColor(int Fore)
	{
		int wColor;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		//We use csbi for the wAttributes word.
		if(GetConsoleScreenBufferInfo(hStdOut, &csbi))
		{
			//Mask out all but the background attribute, and add in the forgournd color
			wColor = (csbi.wAttributes & 0xF0) + (Fore & 0x0F);
			SetConsoleTextAttribute(hStdOut, cast(ushort)wColor);
		}
	}

	///ditto
	void BackColor(int Back)
	{
		int wColor;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		//We use csbi for the wAttributes word.
		if(GetConsoleScreenBufferInfo(hStdOut, &csbi))
		{
			//Mask out all but the background attribute, and add in the forgournd color
			wColor = (Back & 0xF0) + (csbi.wAttributes & 0x0F);
			SetConsoleTextAttribute(hStdOut, cast(ushort)wColor);
		}
	}

	///ditto
	void SetColors(int ForeC, int BackC)
	{
		auto wColor = cast(WORD)((BackC & 0x0F) << 4) + (ForeC & 0x0F);;
		SetConsoleTextAttribute(hStdOut, cast(ushort)wColor);
	}

	/**Direct console output
	*	Params:
	*	s= string to print
	*	resetpos = Set the cursor to the current position after printing again
	*/
	void Print(string s,bool resetpos=false)
	{
		COORD bef;
		if(resetpos)	bef=CursorPosition;
		DWORD count;
		WriteConsoleA(GetStdHandle(STD_OUTPUT_HANDLE), cast(char*)s.ptr, s.length, &count, null);
		if(resetpos)	CursorPosition=bef;
	}

	///ditto
	void PrintAt(short x, short y, string s,bool resetpos=false)
	{
		COORD bef;
		if(resetpos)	bef=CursorPosition;
		DWORD count;
		COORD coord = {x, y};
		SetConsoleCursorPosition(hStdOut, coord);
		WriteConsoleA(hStdOut, cast(char*)s.ptr, s.length, &count, null);
		if(resetpos)	CursorPosition=bef;
	}

	///Hides the console cursor
	void HideCursor()
	{
		CONSOLE_CURSOR_INFO cciCursor;
		if(GetConsoleCursorInfo(hStdOut, &cciCursor))
			cciCursor.bVisible=FALSE;
	}

	///Shows the console cursor
	void ShowCursor()
	{
		CONSOLE_CURSOR_INFO cciCursor;
		if(GetConsoleCursorInfo(hStdOut, &cciCursor))
			cciCursor.bVisible=TRUE;
	}
}


///Represents a complete console window
class ConsoleWin : Window{

	///
	this(string title, int x, int y, int w, int h, int st=WS_OVERLAPPEDWINDOW, int exst=0)
	{
		OnReturn=new EventHandler!(void,string);
		super(title, x, y, 0,0 , st,exst);

		OnResize~=&OnSz;
		OnFocus~=&OnFoc;

		outp=new ListBox(this,0,0, 800,570, WS_VSCROLL| ListBox.LBS_HASSTRINGS);
		inp=new TextBox(this,0, 570, 800,23);
		inp.OnKeyDown~=&OnKey;

		Show();
		Size=Point(w,h);
	}

	private ListBox outp;
	private TextBox inp;

	bool clearOnReturn=true;///Clears the output after pressing Return
	bool addOnReturn=true;///Add input to output after pressing Return

	string prevInput;///String which has been entered before

	public override void Clear() ///Clear the output
	{
		outp.Clear();
	}

	public void Add(string s) ///Add s to output
	{
		outp.Insert(0,s);
	}

	public void input(string s)///set the input text
	{
		inp.Text=s;
	}

	public string input()///get the current input text
	{
		return inp.text;
	}

	private void OnFoc(Object sender)
	{
		inp.Focus();
	}

	private bool OnKey(Object sender,uint key)
	{
		if(key==VK_RETURN)
		{
			string it=inp.text;
			if(it=="") return true;
			OnReturn(this,it);
			prevInput=it;

			if(clearOnReturn) inp.Text=""w;
			if(it=="clear") {Clear(); return true;}
			if(addOnReturn)Add(it);

			return true;
		}

		if(key==VK_UP) // TODO
		{
			string t=inp.text;
			inp.Text=prevInput;
			prevInput=t;
		}
		return false;
	}

	private void OnSz(Object sender,uint szType, Point sz)
	{
		MoveWindow(outp.handle, 0,0, sz.x, sz.y-27, true);
		MoveWindow(inp.handle, 0,sz.y-27, sz.x, 23, true);
	}

	static EventHandler!(void,string) OnReturn; ///Fired after hitting Enter in the input box
}
