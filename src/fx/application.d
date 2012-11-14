module fx.application;
import fx.win32;

/// Window message processing
class Application
	{
			static HACCEL[] accelerators; /// Accelerator tables which shall get checked while looping
			static HWND MDIClient;///
			//static Window activeWindow;
			static this()
			{
				InitCommonControls();
			}
			static ~this()
			{
				done=true;
			}
			private static int OpenWins=0;
			static int OpenWindows() {return OpenWins;} /// retrieve count of open windows
			private static bool done=false;

			public static void delegate() OnLoop; /// Event which gets fired after a run loop

			/**
			* Starts the application message loop
			* Example:
			* ---
			* class MyWin : Window
			* {
			* 	this()
			* 	{
			* 		super("MyWindow", 50,50, 800,600, WS_OVERLAPPEDWINDOW);
			*		Show();
			* 	}
			* }
			*
			* void main()
			* {
			* 	new MyWin();
			*	Application.Run();
			* }
			* ---
			*/
			static void Run()
			{
				MSG msg;
				int ret;
				bool fail=true; // Initial 'true' to getting passed thru the MDISysAccel
				while (!done)
					{
						if (OnLoop!=null)
							ret=PeekMessageA(&msg,null,0,0,PM_REMOVE);
						else{
							ret=GetMessageA(&msg,null,0,0);
							if(ret==0) break;
						}

						try
							{
								if (ret==0)
									{
										if (OnLoop!=null) OnLoop();
										continue;
									}
							}
						catch
						{
							continue;
						}
					try
						{
							if (accelerators.length>0)
									foreach(acc;accelerators)
									{
										fail=!TranslateAcceleratorA(GetActiveWindow(),acc,&msg);
									}
								if (!TranslateMDISysAccel(MDIClient, &msg) && fail)
									{
										TranslateMessage(&msg);
										DispatchMessageA(&msg);
									}
							}
						catch
						{
							break;
						}
				}
		}

		/// Quits the loop and invoke exit of the program
		static void Quit()
			{
				PostQuitMessage(0);
				done=true;
			}
	}
