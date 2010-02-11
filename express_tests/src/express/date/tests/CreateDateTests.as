package express.date.tests
{
	import express.date.now;
	import express.date.today;
	import express.date.tomorrow;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	public class CreateDateTests
	{
		private function checkDatesAreEqual(actual:Date, expected:Date):void
		{
			assertThat(actual.getTime(), equalTo(expected.getTime()));
		}
		
		[Test]
		public function testNow():void
		{
			var expected:Date = new Date();
			var actual:Date = now();
			checkDatesAreEqual(actual, expected);
		}
		
		[Test]
		public function testToday():void
		{
			var expected:Date = new Date(now().setHours(0, 0, 0, 0));
			var actual:Date = today();
			checkDatesAreEqual(actual, expected);
		}
		
		[Test]
		public function testTomorrow():void
		{
			var expected:Date = new Date(now().fullYear, now().month, now().date+1);
			var actual:Date = tomorrow();
			checkDatesAreEqual(actual, expected);
		}
	}
}