
pragma(lib,"fx.lib");

import fx.myfx;

class MyWin:Window
{
	this(){
		Size=Point(200,150);
		Text="Hello World!"w;

		auto b=new Button(this,"Click me!"w,10,10, 100,25);
		b.OnClick~=(Object sender){
			MessageBox.Show(
				"That was a button."w,
				"Caption"w);
		};
	}
}

void main()
{
	auto w=new MyWin();
	w.Show();
	
	Application.Run();
}