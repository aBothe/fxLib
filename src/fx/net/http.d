module fx.net.http;
import fx.myfx,
std.stdio,fx.list,
std.conv,
std.string;

/***
* Represents response data which comes from a HTTP server.
*/
class HTTPanswer:FXObject
{
	public:
	string Protocol="HTTP/1.1";///
	string Status="OK";///
	uint StatusNum=200;///
	string Server="UnknownServer";///
	string ContentType="text/html";///
	string Connection="close";///
	string Location;///
	uint ContentLength;///
	string Content;///

	string TransferEncoding; /// chunked?

	string toString()///builds a complete response answer which can be sent to a HTTP client, e.g. Browser
	{
		ContentLength=Content.length;
		string ret=
		Protocol~" "~to!(string)(StatusNum)~" "~Status~"\r\n"~
		"Server: "~Server~"\r\n"~
		(Location!=""?"Location: "~Location~"\r\n":"")~
		((Content.length>0)?"Content-Length: "~to!(string)(Content.length)~"\r\n":"")~
		(ContentType!=""?"Content-Type: "~ContentType~"\r\n":"")~
		(Connection!=""?"Connection: "~Connection~"\r\n":"")~
		"\r\n"~Content;
		return ret;
	}

	this(){}///

	this(string[] lines)///for clients: analyse response data from server
	{
		int ti=indexOf(lines[0]," ");
		Protocol=lines[0][0 .. ti];
		Status=lines[0][ti+1 .. $];
		StatusNum=parse!(int)(Status);

		foreach(ln; lines[1 .. $])
		{
			int ti2=indexOf(ln,":");
			if(ti2<0) continue;

			switch(ln[0 .. ti2])
			{
				case "Server":
					Server=strip(ln[ti2+1 .. $]);
					break;
				case "Content-Type":
					ContentType=strip(ln[ti2+1 .. $]);
				break;
				case "Content-Length":
					ContentLength=to!(uint)( strip(ln[ti2+1 .. $]) );
				break;
				case "Transfer-Encoding":
					TransferEncoding=strip(ln[ti2+1 .. $]);
				break;
				default:break;
			}
		}
	}
}

///Data structure that goes to server
class HTTPrequest:FXObject
{
	public:
	URL Url;///
	bool manual=false;///User will fill entire request data manually and stores it into Content
	string Method="GET";///
	string Protocol="HTTP/1.1";///

	string[string] PostVariables;///

	string[string] Headers;///
	string Content;///

	string toString()///builds the complete request string which goes to server directly
	{
		if(manual) return Content;
		
		string mlist="";

		if(!Method) Method="GET";
		if(!Protocol) Protocol="HTTP/1.1";

		if(PostVariables.keys.length>0)
		{
			Method="POST";
			Content.length=0;
			Headers["Content-Type"]="application/x-www-form-urlencoded";
			int i=0;
			foreach(name, value; PostVariables)
			{
				Content~=(i>0?"&":"")~name~"="~value;
				i++;
			}
		}

		if(Content.length>0) Headers["Content-Length"]=to!(string)(Content.length);
		mlist~=(Method);
		mlist~=" ";
		mlist~=(Url.toHTTPResource());
		mlist~=" ";
		mlist~=(Protocol);
		mlist~=("\r\nHost:");
		mlist~=(Url.Host);
		mlist~=("\r\n");
		foreach(k, v; Headers) mlist~=(k~": "~v~"\r\n");
		mlist~=("\r\n");
		if(Content.length>0) mlist~=(Content);
		return cast(string)mlist;
	}

	this(string url)///creates HTTPRequest with the target url
	{
		Url=new URL(url);
	}

	this(){Url=new URL();}///creates empty request


	this(void[] raw)///for servers: reinterprete raw HTTP request inclusive its content
	{
		static const string nsep="\n";
		static const string wsep="\r\n";
		static const string wdsep="\r\n\r\n";
		static const string ndsep="\n\n";

		if(raw.length<=0) return;
		scope string data=cast(string)raw;
		bool isWin=indexOf(data,wsep)==-1;
		scope string lnsep=isWin?nsep:wsep;
		scope string lndsep=isWin?ndsep:wdsep;

		int has_content;
		try{
		has_content=indexOf(data, lndsep);
		}catch{has_content=-1;} // indexOf could crash on binary data
		if(has_content<0) has_content=data.length;

		scope string[] lns=split( data[0 .. has_content] ,lnsep);

		// First line should content method, file, getvariables and protocol version
		scope string[] ts=split(lns[0]," ");
		if(ts.length==3)
		{
			Method=ts[0];
			Url=new URL(ts[1]);
			Protocol=ts[2];
		}

		// Handle usual HTTP headers
		foreach(l;lns[1 .. $])
		{
			int fseek=indexOf(l,": ");
			if(fseek>0)		Headers[l[0 .. fseek]]=l[fseek+2 .. $];
		}

		// Handle additional content
		if(has_content>0)
		{
			if(Method=="POST")
			{
				scope string[] tvars=split(data[has_content+lndsep.length .. $],"&");
				foreach(tv;tvars)
				{
					scope string[] t2v=split(tv,"=");
					//PostVariables~=Variable(t2v[0],t2v[1]);
					PostVariables[t2v[0]]=t2v[1];
					//delete t2v;
				}
			}else
				Content=data[has_content+lndsep.length .. $];
		}
		delete data;
		delete lns;
	}
}

///Represents an Uniform Resource Locator which is used by HTTPRequest
class URL:FXObject
{
	public:
		string Host///
		, Resource;///
		string[string] Get;///

	this()	{}///
	this(string Host,string Resource,string[string] GetVariables)///
	{
		this.Host=Host;
		this.Resource=Resource;
		Get=GetVariables;
	}
	this(string url)///
	{
		parseString(url);
	}

	/**Extracts url info from single url
	*Example:
	*---
	*mURL=new URL();
	*mURL.parseString("www.xyz.com/dir1/dir2/file.php?abc=1");
	*assert(mURL.Host=="www.xyz.com");
	*assert(mURL.Resource=="dir1/dir2/file.php");
	*assert(mURL.Get["abc"]=="1");
	*---
	*/
	void parseString(string url)
	{
		auto murl=url;
		if(startsWith(url,"http://"))
			murl=url[7 .. $];

		auto fseek=indexOf(murl,"/"); // first left separator between srv and file

		int getseek=indexOf(murl,"?");
		if(getseek>=0)
		{
			auto tget=split(murl[getseek+1 .. $],"&");
			foreach(gv; tget)
			{
				auto t2get=split(gv,"=");
				if(t2get.length>1)
					Get[t2get[0]]=t2get[1];
			}
		}else{
			getseek=murl.length;
		}

		Resource=murl[fseek .. getseek];

		Host=murl[0 .. fseek];
	}

	/**Retrieve basename from the Resource-Member
	*Example:
	*resource=index.php?a=2&b=1
	*return index.php
	*/
	string Filename()
	{
		int lseek=lastIndexOf(Resource,"/");// most right separator of filename
		int getseek=indexOf(Resource[0 .. $],"?");
		if(getseek==-1) getseek=Resource.length;
		return Resource[lseek+1 .. getseek];
	}

	///builds URL
	string toString()
	{
		return Host~toHTTPResource();
	}

	string toHTTPResource()///builds Resource locator without host name
	{
		auto hasGet=Get.length>0;
		scope string gets;

		int i;
		if(hasGet)
			foreach(name,value; Get)
			{
				gets~=(i>0?"&":"")~name~"="~value;
				i++;
			}
		return "/"~Resource~(hasGet?("?"~gets):"");
	}
}

T entPurify(T)(T s)///
{
	T ret=s;
	string[string] rep=[
	"&amp;":"&",	"&auml;":"\u00E4",
	"&uuml;":"\u00FC",	"&ouml;":"\u00F6",
	"&Auml;":"\u00C4",	"&Uuml;":"\u00DC",
	"&Ouml;":"\u00D6",	"&szlig;":"\u00DF",
	"&#039;":"'",	"&#x27;":"'"
	];
	foreach(from,to; rep)		ret=replace!(T)(ret,cast(T)from,cast(T)to);
	return ret;
}
