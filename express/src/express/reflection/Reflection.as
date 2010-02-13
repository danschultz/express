package express.reflection
{
	import express.IExpressable;
	import express.Prototype;
	
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	public class Reflection implements IExpressable
	{
		public function Reflection()
		{
			
		}
		
		public function prototypes():void
		{
			Prototype.addMethod(Object, "clazz", function():Class
			{
				return Class( getDefinitionByName(this.qualifiedClassName()) );
			});
			Prototype.addMethod(Object, "className", function():String
			{
				var fullName:String = getQualifiedClassName(this);
				var index:int = fullName.indexOf("::");
				return fullName.substring(index != -1 ? index + 2 : 0);
			});
			Prototype.addMethod(Object, "qualifiedClassName", function():String
			{
				return getQualifiedClassName(this);
			});
			Prototype.addMethod(Object, "methods", function(inherited:Boolean = false):Array
			{
				throw new ArgumentError("Reflection.methods() is not implemented.");
				return [];
			});
			Prototype.addMethod(Object, "properties", function(inherited:Boolean = false):Array
			{
				throw new ArgumentError("Reflection.properties() is not implemented.");
				return [];
			});
		}
	}
}