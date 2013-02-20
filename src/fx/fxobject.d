module fx.fxobject;
import std.c.stdlib;
import core.memory;
///A basic class that don't use the D GC to allocate its memory
class FXObject : Object 
{
	///
	new( uint size ) {
         return malloc( size ); // Use good old malloc to allocate memory
     }

	///
     delete( void* p ) {
		p.clear();
		p.free(); // And free it with good old free.
     }
}