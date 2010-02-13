package express.range
{
	/**
	 * The <code>Range</code> interface defines an interface for
	 * a set of sequential values between a beginning value, and a
	 * ending value. Ranges are inclusive, which means that the 
	 * values in the range can include <code>from</code> and <code>to</code>.
	 * 
	 * @author Dan Schultz
	 */
	public interface IRange
	{
		/**
		 * Checks if two ranges are equal. Two ranges are equal when their
		 * <code>from</code> and <code>to</code> fields are the same.
		 * 
		 * @param range The range to check.
		 * @return <code>true</code> if the two ranges are equal.
		 */
		function equalTo(range:IRange):Boolean;
		
		/**
		 * Checks if the value is either greater than or equal to the
		 * <code>from</code> value, or less than or equal to the <code>to</code>
		 * value.
		 * 
		 * @param value The value to check.
		 * @return <code>true</code> if this range contains the value.
		 */
		function contains(value:Object):Boolean;
		
		/**
		 * Pulls a random value from this range that is between 
		 * <code>from</code> and <code>to</code>.
		 * 
		 * @return A random value.
		 */
		function random():Object;
		
		/**
		 * Returns a new array of all the values in this range.
		 * 
		 * @return An array of this range's values.
		 */
		function toArray():Array;
		
		/**
		 * The range's lower boundary value.
		 */
		function get from():Object;
		
		/**
		 * The number of values between <code>from</code> and <code>to</code>.
		 */
		function get length():int;
		
		/**
		 * The range's upper boundary value.
		 */
		function get to():Object;
	}
}