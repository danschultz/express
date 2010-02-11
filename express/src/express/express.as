package express
{
	/**
	 * Initializes a class for use within the Express framework.
	 * 
	 * @param clazz The class to initialize.
	 */
	public function express(clazz:Class):void
	{
		ExpressCore.getInstance().initialize(clazz);
	}
}