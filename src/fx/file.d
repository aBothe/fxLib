module fx.file;
private import fx.fxdef,std.file, fx.win32, std.path, std.conv, std.utf, core.memory;
private import std.stream, std.string;

public alias std.stream.FileMode FileMode;///
public alias std.stream.File FileStream;///


private:
extern(Windows){
	bool GetFileSizeEx(HANDLE hFile, out ulong lpFileSize);
}

public:

enum FileCreation ///
{
	CreateAlways=CREATE_ALWAYS, /// Create File. If existing, file will be overridden
	CreateNew=CREATE_NEW,///Create File. If existing, function fails
	OpenAlways=OPEN_ALWAYS,///Open File. if not existing, file will be created
	OpenExisting=OPEN_EXISTING,///Open File. if not existing, function fails
	Truncate=TRUNCATE_EXISTING///Open file only if existing and reset its content to null
}

enum FileShareMode ///
{
	Read=FILE_SHARE_READ, ///Enable read access while handle is open 
	Write=FILE_SHARE_WRITE,///Enable write access while handle is open 
	Delete=FILE_SHARE_DELETE,	///File can be deleted while handle is open
	
	ReadWrite=Read+Write, ///
	All=Read+Write+Delete, ///
	None=0, ///
}

enum FileAccess///
{
	Read=GENERIC_READ,///
	Write=GENERIC_WRITE,///
	ReadWrite=Read+Write///
}

///
class File
	{
	public:
		static ubyte[] ReadAllBytes(S)(S fn,FileShareMode shareMode=FileShareMode.Read)///
		{
			auto h =	CreateFileW(toUTF16(fn).ptr, FileAccess.Read,	shareMode, null,	FileCreation.OpenAlways,	FILE_ATTRIBUTE_NORMAL + FILE_FLAG_SEQUENTIAL_SCAN,	null);
			if(h == INVALID_HANDLE_VALUE || h==null) return null;
			scope(exit) CloseHandle(h);

			ulong sz=0;
			GetFileSizeEx(h,sz);

			auto buf= Memory.Allocate!(ubyte)(sz);

			DWORD readb;
			.ReadFile(h,cast(void*)buf.ptr, cast(uint)sz, &readb, null);

			if(buf==null) return null;
			return buf;
		}
		static string ReadAllText(S)(S fn,FileShareMode shareMode=FileShareMode.Read)///
		{
			return cast(string)ReadAllBytes(fn,shareMode);
		}

		static alias .write WriteAllBytes;///
		static void Remove(string fn)///
		{
			if(exists(fn)) remove(fn);
		}
		static alias .append AppendToFile;///
		static alias .getSize GetFileSize;///
		static alias .exists Exists;///
		static alias .FileMode FileMode;///
		static alias .copy Copy;///
		static void Move(string from,string to)///
		{
			Copy(from,to);
			Remove(from);
		}
		static alias .rename Rename;///
	}

///
class Path
	{
			static alias .baseName GetBaseName;///
			static alias .extension GetExtension;///
			static alias .getName GetFileName;///
			static alias .dirName GetDirectory;///
			static alias .getDrive GetDrive;///
			static alias .isabs IsAbsolute;///
	}
///
class Directory
	{
		static alias .mkdir MakeDirectory;///
		static alias .rmdir RemoveDirectory;///
		static alias .listdir ListDirectory;///
		static alias .mkdirRecurse MakeDirectoryRecursive;///
		static alias .rmdirRecurse RemoveDirectoryRecursive;///


		/**Creates unique filename in a specified directory
		*Example:
		*---
		*assert(CreateTempFileName("mydir","uniFile","txt")=="mydir\uniFile2.txt") // uniFile.txt already exists
		*---
		*/
		static string CreateTempFileName(string dir,string filebegin="tmp",string fext="bin")
		{
			if (!startsWith(fext,".")) fext="."~fext;
			string ret=dir~"\\"~filebegin~fext;
			if (!File.Exists(ret)) return ret;
			else
				{
					delete ret;
					ret="";
				}
			int ti=2;
			while (1)
				{
					ret=dir~"\\"~filebegin~to!(string)(ti)~fext;
					if (!File.Exists(ret))
						break;
					delete ret;
					ret="";
					ti++;
				}
			return ret;
		}

		/**Same like CreateTempFileName, execpt that already existing filename is taken
		*Params:
		*target= Full filename to existing file
		*/
		static string CreateTempFileName(string target)
		{
			if(!File.Exists(target))return target;
			string text="."~Path.GetExtension(target);
			string tbn=Path.GetBaseName(target,text);
			string tdir=Path.GetDirectory(target);
			string ret=CreateTempFileName(tdir,tbn,text);
			return ret;
		}
	}
