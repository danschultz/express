package express
{
	public final class Prototype
	{
		public static function addMethod(clazz:Class, methodName:String, method:Function):void
		{
			clazz.prototype[methodName] = method;
			clazz.prototype.setPropertyIsEnumerable(methodName, false);
		}
	}
}