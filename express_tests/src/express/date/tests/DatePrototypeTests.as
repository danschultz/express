package express.date.tests
{
	import express.date.Dates;
	import express.express;
	
	import org.flexunit.assertThat;
	import org.flexunit.assumeThat;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.number.lessThan;
	import org.hamcrest.object.equalTo;
	
	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class DatePrototypeTests
	{
		[Before]
		public function before():void
		{
			express(Dates);
		}
		
		[DataPoints]
		[ArrayElementType("Date")]
		public static function dates():Array
		{
			return [new Date(0),
					new Date(100),
					new Date(1000)];
		}
		
		[Theory]
		public function testIsAfter(before:Date, after:Date):void
		{
			assumeThat(after.time, greaterThan(before.time));
			assertThat(after.isAfter(before), equalTo(true));
		}
		
		[Theory]
		public function testIsBefore(before:Date, after:Date):void
		{
			assumeThat(before.time, lessThan(after.time));
			assertThat(before.isBefore(after), equalTo(true));
		}
		
		[Theory]
		public function testIsEqualTo(date1:Date, date2:Date):void
		{
			assumeThat(date1.time, equalTo(date2.time));
			assertThat(date1.equalTo(date2), equalTo(true));
		}
	}
}