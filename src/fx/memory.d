module fx.memory;
/**
This module creates an interface to accessing memory from an extern process
*/

import std.conv,core.stdc.string;
import fx.win32;
import core.memory;
import std.traits;
import std.c.stdlib;

private struct MEMORYSTATUSEX 
{  
 DWORD dwLength;  
 DWORD dwMemoryLoad;  
 ulong ullTotalPhys; 
 ulong ullAvailPhys;  
 ulong ullTotalPageFile;  
 ulong ullAvailPageFile;  
 ulong ullTotalVirtual;  
 ulong ullAvailVirtual;  
 ulong ullAvailExtendedVirtual;
}

extern(Windows)
{
	private bool GlobalMemoryStatusEx(MEMORYSTATUSEX* lpBuffer);
}

///Memory manipulation bypassing the D internal GC
class Memory
{
	public:
	static T[] Allocate(T)(ulong len)///
	{
		return cast(T[]) AllocatePtr!(T)(len*T.sizeof)[0 .. cast(uint)(len)];
	}
	static T* AllocatePtr(T)(ulong sz)///ditto
	{
		return cast(T*) VirtualAlloc(null,cast(uint)sz,MEM_COMMIT,PAGE_READWRITE);
	}
	static T AllocateObj(T:Object)()///ditto
	{
		return cast(T) AllocatePtr!(void)(T.sizeof);
	}

	static T[] Resize(T)(T[] t,uint newlen)///Resize existing memory data
	{
		if(t==null) return Allocate!(T)(newlen);
		return cast(T[]) ResizePtr!(T)(t.ptr,t.length*T.sizeof,newlen*(T.sizeof))[0 .. newlen];
	}
	static T* ResizePtr(T,U=Unqual!(T))(T* t,uint oldsz,uint newsz)///ditto
	{
		auto tp=AllocatePtr!(U)(newsz); // Allocate new Memory
		if(t!=null)memcpy(tp,cast(U*)t,newsz>oldsz?oldsz:newsz); // copy existing to new one
		Free(t); // delete old data
		
		return cast(T*)tp;
	}
	static T[] Resize(T:Object)(T[] t,uint newlen)///ditto
	{
		if(t==null) return Allocate!(T)(newlen);
		return cast(T[]) ResizePtr!(T)(t.ptr,t.length*T.sizeof,newlen*T.sizeof)[0 .. newlen];
	}

	static void Free(T)(T[] t)///
	{
		Free(t.ptr);
	}
	static void Free(T)(T* t)///ditto
	{
		VirtualFree(cast(void*)t,0,MEM_RELEASE);
		t=null;
	}
	static void Free(T:Object)(T t)///ditto
	{
		Free(cast(void*)t);
	}
}


///RAM monitoring functions
class RAM{
	public:
	static uint usagePercent()///
	{
		MEMORYSTATUSEX ms;
		ms.dwLength=ms.sizeof;
		GlobalMemoryStatusEx(&ms);
		return ms.dwMemoryLoad;
	}
	static ulong available()///
	{
		MEMORYSTATUSEX ms;
		ms.dwLength=ms.sizeof;
		GlobalMemoryStatusEx(&ms);
		return ms.ullAvailPhys;
	}
	static ulong totalPhys()///
	{
		MEMORYSTATUSEX ms;
		ms.dwLength=ms.sizeof;
		GlobalMemoryStatusEx(&ms);
		return ms.ullTotalPhys;
	}
}


///for modify memory of other processes
class MemoryManipulator
{
	private:
	HANDLE hProc;
	public:
	this(HWND h)///
	{
		if(!Load(h))
			throw new Exception( "Could not open process handle (Errorcode "~to!(string)(GetLastError())~")" );
	}
	this()///ditto
	{}

	bool loaded()///
	{return hProc!=null;}
	bool Load(HWND h)///
	{
		uint pid;
		GetWindowThreadProcessId(h, &pid);
		HANDLE n= OpenProcess(PROCESS_ALL_ACCESS, 0, pid);
		if(!n)
		return false;

		if(hProc){
			CloseHandle(hProc);
			hProc=null;
		}
		hProc=n;
		return true;
	}

	T Read(T)(uint addr)///
	{
		T rb;//=cast(T) GC.malloc(T.sizeof);
		if(!ReadProcessMemory(hProc,addr,cast(void*)&rb,T.sizeof,null))
			throw new Exception( "Error while reading address: "~to!(string)(GetLastError()) );
		return rb;
	}

	T ReadPointer(T)(uint addr,uint offset=0)///ditto
	{
		T rb;//=cast(T) GC.malloc(T.sizeof);
		uint pa; // pointer address
		pa=Read!(uint)(addr);
		rb=Read!(T)(pa+offset);
		return rb;
	}

	void Write(T)(uint addr,T d)///
	{
		if(!WriteProcessMemory(hProc,addr,cast(void*)&d,T.sizeof,null))
		throw new Exception( "Error while writing address: "~to!(string)(GetLastError()) );
	}

	void WritePointer(T)(uint addr, T rb,uint offset=0)///ditto
	{
		uint pa; // pointer address
		pa=Read!(uint)(addr); // read current address from ptr
		Write!(T)(pa+offset,rb); // write to gotten addr
	}

	~this()
	{
		CloseHandle(hProc);
	}
}
