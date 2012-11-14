module fx.list;
import fx.memory, std.algorithm, std.stdio, core.stdc.string, std.conv, std.traits;

///Interface for every type of list
interface IList(T)
{
	public:
	//void Add(T);
	//void AddRange(T[]);
	void Clear();
	int Count();
	int IndexOf(T);
	int LastIndexOf(T);
	void Remove(T);
	void RemoveAt(int);
	ref T opIndex(int);
	int opApply(int delegate(ref T));
	void opIndexAssign(T,int);
	ref T[] ToArray();
}

List!(T) Array(T)(T[] ar ...)
{
    return new List!(T)(ar);
}


///List of elements
class List(ListItem) : IList!(ListItem)
{
	alias Unqual!(ListItem) U;
protected:
	ListItem[] m_t;
public:
	
	new( uint size ) {
         return Memory.AllocatePtr!(void)( size ); // Use good old malloc to allocate memory
     }

     delete( void* p ) {
         Memory.Free( p ); // And free it with good old free.
     }
	
	///
	int opApply(int delegate(ref ListItem) dg)
	{
		int result = 0;
		for (int i = 0; i < m_t.length; i++)
		{
		 result = dg(m_t[i]);
		 if (result)
			break;
		}
		return result;
	}
	///
	this()	{}
	///
	this(IList!(ListItem) list)	
	{
		AddRange(list.ToArray());
	}
	///
	this(ListItem[] array)
	{
		m_t=array;// copy existing array content into list
	}
	///
	this(uint length)
	{
		Count=length;
	}
	
	~this()
	{
		Clear();
	}
	
	///
	void opAssign(ref IList!(ListItem) list)
	{
		this.m_t=list.ToArray;
	}

	///Returns item at index i
	ref ListItem opIndex(int i)
	{
		return m_t[i];
	}

	///
	void opIndexAssign(ListItem v,int i)
	{
		m_t[i]=v;
	}

	///Adds new Item of type T to the list
	void Add(T)(T t)
	{
		m_t=Memory.Resize!(ListItem)(m_t,m_t.length+1);
		m_t[$-1]=to!(ListItem)(t);
	}
	///ditto
	ref ListItem[] opCat(ListItem t)
	{
		Add(t);
		return m_t;
	}
	///ditto
	ref ListItem[] opAddAssign(ListItem t)
	{
		Add(t);
		return m_t;
	}
	
	///ditto
	void opSliceAssign(ListItem t)
	{
		Add(t);
	}

	///Adds a range of items to the list
	void AddRange(T)(T[] t)
	{
		m_t=Memory.Resize!(ListItem)(m_t,m_t.length+t.length);
		m_t[$-t.length .. $]=to!(ListItem[])(t);
	}
	///ditto
	ref ListItem[] opCat(ListItem[] t)
	{
		AddRange(cast(ListItem[])t);
		return m_t;
	}
	///ditto
	ref ListItem[] opAddAssign(ListItem[] t)
	{
		AddRange(t);
		return m_t;
	}
	///ditto
	void opSliceAssign(ListItem[] t,uint from, uint to)
	{
		m_t[from .. to]=t;
	}
	///ditto
	void opSliceAssign(ListItem t,uint from, uint to)
	{
		for(uint i=from;i<to;i++) m_t[i]=t;
	}

	///Resets the list content
	void Clear()
	{
		Memory.Free(m_t);
		m_t=null;
	}

	///Returns the count of items in the list
	int Count()
	{
		return m_t.length;
	}
	///Sets the count of items in the list 
	void Count(uint length)
	{
		m_t=Memory.Resize!(ListItem)(m_t,length);
	}

	///Seeks for an item
	int IndexOf(ListItem t)
	{
	foreach(int i,ListItem ts;m_t) if(ts==t) return i;
	return -1;
	}
	///ditto
	int LastIndexOf(ListItem t)
	{
	foreach_reverse(int i,ListItem ts;m_t) if(ts==t) return i;
	return -1;
	}

	///Removes item t from list
	void Remove(ListItem t)
	{
		int ti=0;
		foreach(int i,ListItem ts;m_t)
			if(ts==t) ti=i;
		
		RemoveAt(ti);
	}

	///Removes item at index i
	void RemoveAt(int i)
	{
		m_t[i]=m_t[$-1];
		/*if(i<m_t.length-2)// TODO: Correct this
		{
			auto nt=Memory.Allocate!(T)(Count-1);
			//nt[0 .. i]=m_t[0 .. i];
			//nt[i+1 .. $-i-2]=m_t[i+1 .. $-i];
			Clear();
			m_t=nt;
			return;
		}
		else if(i==m_t.length-2)
		{
			m_t[$-2]=m_t[$-1];
		}*/
		m_t = Memory.Resize!(ListItem)(m_t,m_t.length-1);
	}
	
	/// Sorts the entire array by using the standard sorting function
	static if(!is(ListItem:Object)) void Sort()
	{
		sort(m_t);
	}
	///Sorts the array using an own comparing algorithm
	void SortBy(alias fun)() // bool delegate(T a,T b) comparer
	{
		sort!(fun)(m_t);
	}
	
	/// Return the list as an array 
	ref ListItem[] ToArray()
	{
		return m_t;
	}
}


/*
import fx.win32;



class ControlCollection : ICollection!(Control)

{

private:

alias Control T;

T m_own;

T[] m_t;

public:

this(Control owner)

{

m_own=owner;

}

T owner()

{

return m_own;

}

void Add(T t)

{

SetParent(t.handle,m_own.handle);

m_t.length=m_t.length+1;

m_t[$-1]=t;

}



void AddRange(T[] t)

{

foreach(T tt;t)SetParent(tt.handle,m_own.handle);

m_t~=t;

}



void Clear()

{

m_t.length=0;

}



int count()

{

return m_t.length;

}



int IndexOf(T t)

{

foreach(int i,T ts;m_t)

if(ts==t) return i;

return -1;

}



void Remove(T t)

{

int ti=0;

foreach(int i,T ts;m_t)

if(ts==t) ti=i;



if(ti!=m_t.length-1)

	m_t[ti]=m_t[$-1];

m_t = m_t[0..$-1];

}



void RemoveAt(int i)

{

if(i!=m_t.length-1)

	m_t[i]=m_t[$-1];

m_t = m_t[0..$-1];

}

}

*/

