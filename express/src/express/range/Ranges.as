package express.range
{
	import express.IExpressable;
	import express.Prototype;
	
	public class Ranges implements IExpressable
	{
		public function Ranges()
		{
		}
		
		public function prototypes():void
		{
			Prototype.addMethod(Number, "to", function(value:Number):IRange
			{
				return new NumericRange(this, value);
			});
		}
	}
}