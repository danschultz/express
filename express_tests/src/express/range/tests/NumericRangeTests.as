package express.range.tests
{
	import express.array.Arrays;
	import express.embed;
	import express.range.IRange;
	import express.range.NumericRange;
	import express.range.Ranges;
	import express.range.from;
	
	import flash.errors.IllegalOperationError;
	
	import org.flexunit.assertThat;
	import org.flexunit.assumeThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.core.allOf;
	import org.hamcrest.core.anyOf;
	import org.hamcrest.core.isA;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.number.greaterThanOrEqualTo;
	import org.hamcrest.number.lessThan;
	import org.hamcrest.number.lessThanOrEqualTo;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class NumericRangeTests
	{
		private function assumeBoundaries(from:Number, to:Number):void
		{
			assumeThat(from, lessThanOrEqualTo(to));
			assumeThat(to, greaterThanOrEqualTo(from));
		}
		
		[Before]
		public function before():void
		{
			embed(Arrays);
			embed(Ranges);
		}
		
		[DataPoints]
		[ArrayElementType("Number")]
		public static function numbers():Array
		{
			return [-13, -2, 0, 1, 10, 133];
		}
		
		[Theory]
		public function testFromTo(num1:Number, num2:Number):void
		{
			var f:Number = Math.min(num1, num2);
			var t:Number = Math.max(num1, num2);
			var range:IRange = from(num1).to(num2);
			assertThat(range.from, equalTo(f));
			assertThat(range.to, equalTo(t));
		}
		
		[Theory]
		public function testSwapBoundaries(num1:Number, num2:Number):void
		{
			var from:Number = Math.min(num1, num2);
			var to:Number = Math.max(num1, num2);
			var range:NumericRange = new NumericRange(from, to);
			assertThat(range.from, equalTo(from));
			assertThat(range.to, equalTo(to));
		}
		
		[Theory]
		public function testContains(from:Number, to:Number, value:Number):void
		{
			assumeBoundaries(from, to);
			assumeThat(value, allOf(greaterThanOrEqualTo(from), lessThanOrEqualTo(to)));
			assertThat(new NumericRange(from, to).contains(value), equalTo(true));
		}
		
		[Theory]
		public function testDoesNotContain(from:Number, to:Number, value:Number):void
		{
			assumeBoundaries(from, to);
			assumeThat(value, anyOf(greaterThan(to), lessThan(from)));
			assertThat(new NumericRange(from, to).contains(value), equalTo(false));
		}
		
		[Test]
		public function testToArray():void
		{
			var range:NumericRange = new NumericRange(1, 3);
			var values:Array = range.toArray();
			assertThat([1, 2, 3].equals(range.toArray()), equalTo(true));
		}
		
		[Theory]
		public function testRandom(from:Number, to:Number):void
		{
			assumeBoundaries(from, to);
			
			var range:NumericRange = new NumericRange(from, to);
			for (var i:int = 0; i < 100; i++) {
				var value:Number = Number( range.random() );
				var contains:Boolean = range.contains(value);
				assertThat(contains, equalTo(true));
			}
		}
		
		[Test]
		public function testForEach():void
		{
			var range:NumericRange = new NumericRange(10, 20);
			var values:Array = [];
			for each (var value:Number in range) {
				values.push(value);
			}
			assertThat(values, arrayWithSize(11));
			assertThat(values.equals(range.toArray()), equalTo(true));
		}
		
		[Test]
		public function testForIn():void
		{
			var range:NumericRange = new NumericRange(1, 3);
			var values:Array = [];
			for (var value:Number in range) {
				values.push(value);
			}
			assertThat(values, arrayWithSize(3));
			assertThat([0, 1, 2].equals(values), equalTo(true));
		}
		
		[Test]
		public function testIndexes():void
		{
			var range:NumericRange = new NumericRange(1, 3);
			var len:int = range.length;
			for (var i:int = 0; i < len; i++) {
				assertThat(range[i], equalTo(i+1));
			}
		}
		
		[Test]
		public function testAssignIndexThrowsRTE():void
		{
			var range:NumericRange = new NumericRange(0, 10);
			var error:Error;
			try {
				range[0] = 10;
			} catch (e:Error) {
				error = e;
			}
			assertThat(error, isA(IllegalOperationError));
		}
		
		[Test]
		public function testCannotDelete():void
		{
			var range:IRange = from(0).to(5);
			delete range[1];
			assertThat(range[1], equalTo(1));
		}
	}
}