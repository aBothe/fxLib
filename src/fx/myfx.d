/++
FX Framework - made by Alexander Bothe (alexanderbothe.com)

Only this file must be included to use the big part of this framework
+/
module fx.myfx;



pragma(lib,"fx.lib");
pragma(lib,"kernel32.lib");
pragma(lib,"user32.lib");
pragma(lib,"gdi32.lib");
pragma(lib,"comdlg32.lib");
pragma(lib,"COMCTL32.LIB");
pragma(lib,"shell32.lib");
pragma(lib,"WS2_32.lib");
pragma(lib,"wsock32.lib");
//pragma(lib,"uxtheme.lib");

public
{
	import fx.fxobject;
	import fx.fxdef;
	import fx.file;
	import fx.win32;
	//import fx.console;
	import fx.control;
	import fx.window;
	import fx.application;
	import fx.event;
	//import fx.mp3;
	import fx.memory;
	import fx.string;


	import fx.controls.button;
	import fx.controls.textbox;
	import fx.controls.combobox;
	import fx.controls.listview;
	import fx.controls.listbox;
	//import fx.controls.mdi;
	import fx.controls.ipbox;
	//import fx.controls.tab;
	import fx.controls.filedialog;
	import fx.controls.progressbar;
	import fx.controls.toolbar;
	import fx.controls.timer;
	import fx.controls.notifyicon;
	import fx.controls.treeview;
	//import fx.controls.statusbar;


	import fx.customcontrols.piechart;
	import fx.customcontrols.lineDiagram;
}
