module fx.customcontrols.piechart;
import fx.fxdef, fx.win32, std.conv, std.string, std.math,
fx.control, fx.event;

/**Draw various function graphs into a window control
*/
class Pie : Control
{
	private void Paint(Object sender,HDC dc)
	{
		HANDLE	pen=(lineCol>=0?CreatePen(PS_SOLID,1,lineCol):CreatePen(PS_NULL,0,0));
		HANDLE	fpen=CreatePen(PS_SOLID,1,0x000000);
		HANDLE	brush=CreateSolidBrush(pieCol);
		HANDLE	font;
		Point M=Size;
		M.x=M.x/2;
		M.y=M.y/2;
		auto r=cast(int)fmin(M.x,M.y);
		BeginPath(dc);

		SelectObject(dc, pen);
		if(showDescription)
		{
			font=GetStockObject(12);
			//font=CreateFontA(16,9	,0,0,400	,0,0,0,	DEFAULT_CHARSET,	OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,	CLEARTYPE_QUALITY,	FF_DONTCARE, cast(char*)"Arial");
			SelectObject(dc, font);
		}
		SelectObject(dc, brush);

		if(mvalue>360)	mvalue=0;
		if(mvalue<0)	mvalue=360;
		if(mstart>360)	mstart=0;
		if(mstart<0)	mstart=360;

		float x=0f;

		//SetDCBrushColor(dc,cast(uint)tst*0xFF);
		MoveToEx(dc, M.x, M.y, null);
		//DrawArc(dc,M,r,mstart,mvalue);
		AngleArc(dc,M.x,M.y, r, mstart, mvalue);
		LineTo(dc, M.x, M.y);

		EndPath(dc);
		StrokeAndFillPath(dc);

		if(showDescription)
		{
			wstring s;
			SetBkColor(dc,0xFFFFFF);
			SelectObject(dc, fpen);
			SetTextAlign(dc,TA_CENTER);
			if(DescriptionCallBack)
				s=DescriptionCallBack(mstart,mvalue);
			else
				s=to!(wstring)(cast(int)(mvalue/360*100))~"%";

			x=(PI/180)*((mvalue/2+90));
			TextOutW(dc,	M.x+cast(int)(r*0.5*sin(x)),	M.y+cast(int)(r*0.5*cos(x)),	cast(wchar*)s,s.length);
		}

		DeleteObject(pen);
		if(showDescription)	DeleteObject(font);
		DeleteObject(fpen);
		DeleteObject(brush);
	}

	private int EraseBG(WindowEvent e)
	{
		HDC dc=cast(HDC) e.wParam;
		Point sz=Size;

		HANDLE	brush=CreateSolidBrush(bgCol), prevb,prevp;
		prevb=SelectObject(dc, brush);
		prevp=SelectObject(dc, GetStockObject(NULL_PEN));
		Rectangle(dc,0,0,sz.x+2,sz.y+2);
		DeleteObject(brush);
		SelectObject(dc, prevb);
		SelectObject(dc, prevp);
		return 0;
	}

	float getAngleAt(Point P)///
	{
		float ret=mstart;

		/*	Calculate circle middle	*/
		Point M=Size;
		M.x=M.x/2;
		M.y=M.y/2;

		/*	Calculate vertical and horizontal differences	*/
		float p=abs(P.x-M.x);
		float h=P.y-M.y;

		if(p==0 && h<0) return 90f;
		if(p==0) return 270f;
		if(h==0 && P.x<M.x) return 180f;

		h=abs(h);

		/*	Result is arcus tangent of height/width	(Triangle calculations)	*/
		if(	(P.x<M.x && P.y<M.y)	||	(P.x>M.x && P.y>M.y))
			ret+=(180/PI)*(	PI/2-atan(h/p)	);
		else
			ret+=(180/PI)*(	atan(h/p)	);

			if(P.x<M.x && P.y<M.y)	ret+=90f;
		else	if(P.x<M.x && P.y>M.y)	ret+=180f;
		else	if(P.x>M.x && P.y>M.y)	ret+=270f;

		return ret;
	}


	public wstring delegate(float start,float angle) DescriptionCallBack;/***/

	///
	this(Control par, int x,int y,int h, int st=0, int exst=0) {
		super(par,"mRawClass",x,y,h,h,st,exst);
		OnPaint~=&Paint;
		AddEvent(WM_ERASEBKGND,&EraseBG);

		lineCol=	0x333333;
		pieCol=	0xAAAAAA;
		bgCol=	0xFFFFFF;

		mstart=0;
		value=200;

		showDescription=false;
	}
	bool showDescription;///
	private float mstart,mvalue;
	int lineCol///
	,pieCol;///
	int bgCol;///

	float value()/***/ {	return mvalue;	}
	float value(float v)/**ditto*/ {	mvalue=v;	Redraw();	return mvalue;	}
	float startvalue()/***/ {	return mstart;	}
	void startvalue(float v)/**ditto*/ {	mstart=v;	Redraw();}
}
