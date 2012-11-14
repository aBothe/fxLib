module fx.customcontrols.lineDiagram;
import fx.fxdef, fx.win32, fx.event, fx.control;

/// Control class which draws function graphs into windows
class LineDiagram : Control
{
	private void Paint(Object sender,HDC dc)
	{
		SelectObject(dc, GetStockObject(DC_PEN));
		Point M=Size;

		SetDCPenColor(dc,rasterCol);
		/*	Draw rasters	*/
		MoveToEx(dc,M.x/2,0,null);
		LineTo(dc,M.x/2,M.y);

		MoveToEx(dc,0,M.y/2,null);
		LineTo(dc,M.x,M.y/2);

		/*	Draw spline	*/
		double val;
		int fcol=lineCol;
		foreach(eh; Functions)
		{
			BeginPath(dc);
			MoveToEx(dc,-1,M.y/2,null);
			for(int i=-1; i<M.x; i++)
			{
				try{
				val=eh(cast(double)(i-M.x/2)	,fcol);
				}catch{break;}
				LineTo(dc,	i,	M.y/2-cast(int)val	);
			}
			EndPath(dc);
			SetDCPenColor(dc,fcol);
			StrokePath(dc);
		}
	}

	public:
	///
	static alias double delegate(double x,ref int functionCol) FunctionsEH;
	/**Functions to draw
	*Type is double delegate(double x,ref int graphCol)
	*Example:
	*---
	*auto diag=new LineDiagram(this,0,0, 600,500);
	*diag.Functions~=delegate double(double x,ref int col)
	*{
	*col=0xFF0000;
	*return x*x;
	*};
	*diag.Redraw();
	*---
	*/
	FunctionsEH[] Functions;

	///
	this(Control par, int x,int y,int h, int st=0, int exst=0) {
		super(par,"mRawClass",x,y,h,h,st,exst);
		OnPaint~=&Paint;

		lineCol=	0xFF0000;
		rasterCol=	0xAAAAAA;
		bgCol=	0xFFFFFF;
	}

	int lineCol///
	,rasterCol;///
	int bgCol;///
}
