import fx.win32,std.utf,std.conv, fx.fxobject;

struct ProcessStartInfo ///
{
	wstring FileName;///
	wstring Arguments;///
	wstring InitialDirectory;///
	bool DontCreateWindow;///
	//string[string] EnvironmentVariables; ///
}

enum ProcessPriority///
{
	AboveNormal=ABOVE_NORMAL_PRIORITY_CLASS,///
	BelowNormal=BELOW_NORMAL_PRIORITY_CLASS,///
	High=HIGH_PRIORITY_CLASS,///
	Idle=IDLE_PRIORITY_CLASS,///
	Normal=NORMAL_PRIORITY_CLASS,///
	Realtime=REALTIME_PRIORITY_CLASS,///
}
///
class Process : FXObject
{
	///
	public static Process Start(string ApplicationPath,string Arguments=null,string InitialDirectory=null)
	{
		ProcessStartInfo si;
		si.FileName=std.utf.toUTF16(ApplicationPath);
		si.Arguments=toUTF16(Arguments);
		si.InitialDirectory=toUTF16(InitialDirectory);
		return Start(si);
	}
	
	///ditto
	public static Process Start(wstring ApplicationPath,wstring Arguments=null,wstring InitialDirectory=null)
	{
		ProcessStartInfo si;
		si.FileName=ApplicationPath;
		si.Arguments=Arguments;
		si.InitialDirectory=InitialDirectory;
		return Start(si);
	}
	
	///ditto
	public static Process Start(ProcessStartInfo psi)
	{
		Process p=new Process();
		p.StartInfo=psi;
		p.Start();
		return p;
	}
	
protected:
	PROCESS_INFORMATION pi;
	
public:
	this(){}///
	this(HANDLE proc)
	{
		if(proc==null) throw new Exception("Process handle cannot be null!");
		
		PROCESS_INFORMATION pi;
		pi.hProcess=proc;
		pi.dwProcessId=GetProcessId(proc);
		pi.hThread=null;
		pi.dwThreadId=0;
		this.pi=pi;
	}
	
	int ProcessId() ///
	{return pi.dwProcessId;}
	HANDLE ThreadHandle() ///
	{return pi.hThread;}
	HANDLE ProcessHandle() ///
	{return pi.hProcess;}
	int ThreadId() /// 
	{return pi.dwThreadId;}
	
	ProcessStartInfo StartInfo;///
	
	void Start()///
	{
		DWORD flags;
		if(StartInfo.DontCreateWindow) flags+=CREATE_NO_WINDOW;
		
		STARTUPINFO si;
		si.cb=si.sizeof;
		
		CreateProcessW(cast(wchar*)(StartInfo.FileName),cast(wchar*)(StartInfo.Arguments),null,null,false,flags,null,cast(wchar*)(StartInfo.InitialDirectory),&si,&pi);
	}
	
	~this() 
	{
		CloseHandle(pi.hThread);
		CloseHandle(pi.hProcess);
	}
	
	void Stop() ///
	{
		CloseHandle(pi.hThread);
		TerminateProcess(pi.hProcess,1);
		CloseHandle(pi.hProcess);
	}
	///
	alias Stop Exit;
	
	///Suspends the main thread of the process
	void Suspend()
	{
		SuspendThread(pi.hThread);
	}
	
	///Resumes the main thread
	void Resume()
	{
		ResumeThread(pi.hThread);
	}
	
	///
	void Priority(ProcessPriority p)
	{
		SetPriorityClass(pi.hProcess,cast(int)p);
	}
	
	///
	ProcessPriority Priority()
	{
		return cast(ProcessPriority)GetPriorityClass(pi.hProcess);
	}
	
	///Only for Vista and higher!
	bool IsBackgroundProcess(bool b)
	{
		return SetPriorityClass(pi.hProcess,b?0x00100000:0x00200000);
	}
	
	uint ExitCode()/// 
	{
		uint ret;
		GetExitCodeProcess(pi.hProcess,&ret);
		return ret;
	}
	
	bool IsRunning() ///
	{
		return ExitCode()==STILL_ACTIVE;
	}
}