package express
{
	import flash.utils.Dictionary;

	public class ExpressCore
	{
		private var _classes:Dictionary = new Dictionary();
		
		public function ExpressCore()
		{
			
		}
		
		private static var INSTANCE:ExpressCore;
		public static function getInstance():ExpressCore
		{
			if (!INSTANCE) {
				INSTANCE = new ExpressCore();
			}
			return INSTANCE;
		}
		
		public function initialize(clazz:Class):Boolean
		{
			try {
				var o:Object = new clazz();
				if (o is IExpressable && _classes[clazz] == null) {
					IExpressable( o ).prototypes();
					_classes[clazz] = true;
					return true;
				}
			} catch (e:Error) {
				
			}
			return false;
		}
	}
}