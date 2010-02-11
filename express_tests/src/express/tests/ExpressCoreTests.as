package express.tests
{
	import express.ExpressCore;
	import express.IExpressable;
	import express.date.Dates;
	
	import org.flexunit.assertThat;
	import org.flexunit.assumeThat;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;
	
	[RunWith("org.flexunit.experimental.theories.Theories")]
	public class ExpressCoreTests
	{
		[DataPoints]
		[ArrayElementType("Class")]
		public static function classes():Array
		{
			return [Dates,
					Object];
		}
		
		[Theory]
		public function testInitialize(clazz:Class):void
		{
			var o:Object = new clazz();
			assumeThat(o, isA(IExpressable));
			assertThat(new ExpressCore().initialize(clazz), equalTo(true));
		}
		
		[Theory]
		public function testInitializeNonIExpressable(clazz:Class):void
		{
			var o:Object = new clazz();
			assumeThat(o is IExpressable, equalTo(false));
			assertThat(new ExpressCore().initialize(clazz), equalTo(false));
		}
		
		[Theory]
		public function testInitializeTwice(clazz:Class):void
		{
			var o:Object = new clazz();
			var core:ExpressCore = new ExpressCore();
			assumeThat(o, isA(IExpressable));
			assertThat(core.initialize(clazz), equalTo(true));
			assertThat(core.initialize(clazz), equalTo(false));
		}
	}
}
