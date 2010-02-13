package express.reflection.tests
{
	import express.embed;
	import express.reflection.Reflection;
	
	import flash.geom.Point;
	
	import org.flexunit.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.core.allOf;
	import org.hamcrest.object.equalTo;

	public class ReflectionPrototypeTests
	{
		[Before]
		public function before():void
		{
			embed(Reflection);
		}
		
		[Test]
		public function testClass():void
		{
			assertThat("Hello".clazz(), equalTo(String));
		}
		
		[Test]
		public function testClassName():void
		{
			assertThat("Hello".className(), equalTo("String"));
			assertThat(new Point().className(), equalTo("Point"));
		}
		
		[Test]
		public function testQualifiedClassName():void
		{
			assertThat("Hello".qualifiedClassName(), equalTo("String"));
			assertThat(new Point().qualifiedClassName(), equalTo("flash.geom::Point"));
		}
		
		[Test]
		public function testMethods():void
		{
			var obj:ReflectionObject = new ReflectionObject();
			assertThat(obj.methods(), allOf(arrayWithSize(2), hasItems(equalTo("helloWorld"), equalTo("theTime"))));
		}
		
		[Test]
		public function testProperties():void
		{
			var obj:ReflectionObject = new ReflectionObject();
			assertThat(obj.properties(), allOf(arrayWithSize(2), hasItems(equalTo("num1"), equalTo("num2"))));
		}
	}
}

class ReflectionObject
{
	public var num1:int = 1;
	public var num2:int = 2;
	
	public function helloWorld():String
	{
		return "hello world";
	}
	
	public function theTime():Date
	{
		return new Date();
	}
}