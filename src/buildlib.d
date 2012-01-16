import std.string,std.conv,std.process, core.thread, core.memory, std.file, std.path, std.c.windows.windows;
import std.stdio, std.math, std.datetime,std.array;

void main(string[] args)
{
	string exedir=std.path.dirName(args[0]);
	StopWatch sw;
	
	sw.start();

	uint cThreads=4;
	if(args.length<2)
	{
		writeln("Usage: buildlib.exe <targetlibname.lib> %FLAGS%");
		writeln("Flags:");
		writeln("-i%directory%\t\tSpecify folder where source files are stored");
		writeln("-ddoc%macrofile.ddoc%\t\tCreate documentation");
		writeln("-docdir%directory%\t\tdocumentation output path; Default is \"%targetlibname%_doc\\\"");
		writeln(" ");
		writeln("Buildlib by Alexander Bothe (alexanderbothe.com)");
		writeln("This tool compiles all d sources in a directory (by default start directory will be scanned) and outputs an import library.");
		return;
	}
	auto libs=new string[0];
	string lib=args[1];
	string obj_dir=exedir~"\\objs_"~baseName(lib);

	bool makeDoc=false;
	string ddoc, docdir=lib~"_doc";

	foreach(i,arg;args[2 .. $])
	{
		if(startsWith(arg,"-i"))
		{
			libs~=arg[2 .. $];
			continue;
		}
		if(startsWith(arg,"-ddoc"))
		{
			makeDoc=true;
			ddoc=arg[5 .. $];
			continue;
		}
		if(startsWith(arg,"-docdir"))
		{
			docdir=arg[7 .. $];
			continue;
		}
	}

	string cmp="dmd -c %s -of"~obj_dir~"\\%s"~(makeDoc?(	" -D -Dd"~docdir~(		ddoc!=""?(" "~ddoc):""		)	):"");
	string lnk="lib -c -n -p128 "~lib~" %s";
	writeln(cmp);
	try{	rmdir(obj_dir);	}catch{}

	int dmd(string src)
	{
		scope string cmd=std.string.format(cmp,src,baseName(src,".d")~".obj");
		writeln(src);
		return system(cmd);
	}

	string[] d_files;

	// Enumerate all *.d files
	foreach(scanLib;libs)
		foreach (DirEntry e; dirEntries(scanLib, SpanMode.breadth))
		{
			if(!isFile(e.name)) 
				continue;
			if(extension(e.name)!=".d") 
				continue;
			d_files~=e.name;
		}

	if(d_files.length<=10) cThreads=2;
	if(d_files.length<=6) cThreads=1;
	writeln(d_files.length," Files to compile");

	// Compile them
	Thread[] cmpThs;
	int done;
	int per_th=cast(int)((d_files.length)/cThreads);

	int k;
	for(int i; i<cThreads; i++)
	{
		Thread tth=new Thread((){
			int ti=i;
			auto tdone=done;
			auto todo=tdone+per_th;
			if(ti+1==cThreads || todo>d_files.length) todo=d_files.length;
			done=todo;

			foreach(j,src; d_files[tdone .. todo])
			{
				k++;
				if(dmd(src)!=0)
				{
					writeln("Compile Error!\n");
					return;
				}
			}
		});
		tth.start();
		cmpThs~=tth;
		Thread.sleep(700_000);
	}
	foreach(th; cmpThs) th.join();

	// Link all together
	string objs;
	foreach(src;d_files)
	{
		string obj=obj_dir~"\\"~baseName(src,".d")~".obj";
		if(!exists(obj))
		{
			writeln(src~" was not built!");
			return;
		}
		objs~=" "~obj;
	}

	writeln(format(lnk,"%objs%"));
	system(format(lnk,objs));

	sw.stop();					
								
	long diff=sw.peek().msecs;
	long th=diff/1000/60/60;
	long tm=diff/1000/60-th*60;
	double ts=cast(double)diff/1000-cast(double)tm*60;
	writeln(format("\nTotal time needed: %s s, %s min, %s h", ts, tm, th));
}
