package express.date
{
	import express.IExpressable;
	import express.Prototype;

	public class Dates implements IExpressable
	{
		public function Dates()
		{
			
		}
		
		public function prototypes():void
		{
			Prototype.addMethod(Date, "isAfter", function(date:Date):Boolean
			{
				return this.time > date.time;
			});
			Prototype.addMethod(Date, "isBefore", function(date:Date):Boolean
			{
				return this.time < date.time;
			});
			Prototype.addMethod(Date, "equalTo", function(date:Date):Boolean
			{
				return this.time == date.time;
			});
		}
	}
}