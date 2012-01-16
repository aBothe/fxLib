import fx.memory;
///A basic class that don't use the D GC to allocate its memory
class FXObject : Object 
{
	///
	new( uint size ) {
         return Memory.AllocatePtr!(void)( size ); // Use good old malloc to allocate memory
     }

	///
     delete( void* p ) {
         Memory.Free( p ); // And free it with good old free.
     }
}