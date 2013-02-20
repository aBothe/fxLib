module fx.controls.filedialog;
import fx.win32,fx.fxdef, std.file;
import fx.control;
import std.string, std.conv;
import core.memory;

///
class FileDialog
{
	///
	static wstring ShowModal(	bool isSaveDlg=false
							 ,wstring DefFileName="Untitled"w
							 ,wstring filter="All Files(*.*)\0*.*\0"w
							 ,int style=OFN_DONTADDTORECENT
							 ,int selectedFilter=1
							 ,wstring title=null
							 ,wstring initDir=null)
	{
		scope auto curdir=getcwd();
		
		try{
			scope wchar[1024] selfn;
			OPENFILENAMEW of;
			of.lStructSize = of.sizeof;
			of.hwndOwner = null;
			of.nMaxFile = selfn.length;

			scope wstring dfn=DefFileName, f=filter;
			if(dfn.length>selfn.length-1) dfn.length=selfn.length-1;
			if(!endsWith(dfn,"\0"w)) dfn~="\0"w;
			if(!endsWith(f,"\0"w)) f~="\0"w;
			
			of.lpstrFilter=cast(wchar*)f.ptr;
			selfn[0 .. dfn.length]=dfn;
			of.lpstrFile=cast(wchar*) selfn.ptr;


			of.nFilterIndex = selectedFilter;
			of.lpstrFileTitle =null;
			if(initDir!=null)
				of.lpstrInitialDir = cast(wchar*) (title~"\0").ptr;

			if(title!=null)
				of.lpstrTitle=cast(wchar*) (title~"\0").ptr;

			of.Flags = style;
			
			if(isSaveDlg)	{if (!GetSaveFileNameW(&of)) return null;}
			else			{if (!GetOpenFileNameW(&of)) return null;}
			
			scope auto tb=cast(wstring)of.lpstrFile[0 .. wcslen(of.lpstrFile)];
			setcwd(curdir);
			return tb.idup;
		}catch(Exception e){
			MessageBox.Show(e.msg);
		}
		
		setcwd(curdir);
		return null;
	}
}
