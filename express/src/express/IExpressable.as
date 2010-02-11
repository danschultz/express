package express
{
	/**
	 * An interface that allows a class to be used within the
	 * Express framework.
	 * 
	 * @author Dan Schultz
	 */
	public interface IExpressable
	{
		/**
		 * Initializes any prototype methods for this class.
		 */
		function prototypes():void;
	}
}