package express.object
{
	import express.IExpressable;
	import express.Prototype;
	
	import mx.utils.ObjectUtil;
	
	public class Objects implements IExpressable
	{
		public function Objects()
		{
			
		}
		
		public function prototypes():void
		{
			Prototype.addMethod(Object, "inspect", function():String
			{
				return ObjectUtil.toString(this);
			});
		}
	}
}