package express.array
{
	import express.IExpressable;
	import express.Prototype;
	import express.embed;
	import express.range.IRange;
	import express.range.Ranges;
	import express.range.from;
	
	public class Arrays implements IExpressable
	{
		public function Arrays()
		{
			embed(Ranges);
		}
		
		public function prototypes():void
		{
			Prototype.addMethod(Array, "clear", function():Array
			{
				this.splice(0, this.length);
				return this;
			});
			Prototype.addMethod(Array, "clone", function():Array
			{
				return this.concat();
			});
			Prototype.addMethod(Array, "contains", function(element:Object):Boolean
			{
				return this.indexOf(element) != -1;
			});
			Prototype.addMethod(Array, "equals", function(array:Array):Boolean
			{
				// null array, return false.
				if (array == null) {
					return false;
				}
				
				// same array, return true
				if (this == array) {
					return true;
				}
				// performance optimization. different sized array, can't be the same.
				if (this.length != array.length) {
					return false;
				}
				
				var len:int = array.length;
				for (var i:int = 0; i < len; i++) {
					if (this[i] !== array[i]) {
						return false;
					}
				}
				
				return true;
			});
			Prototype.addMethod(Array, "difference", function(array:Array):Array
			{
				var result:Array = [];
				var len:int = this.length;
				for (var i:int = 0; i < len; i++) {
					var element:Object = this[i];
					if (!array.contains(element)) {
						result.push(element);
					}
				}
				return result;
			});
			Prototype.addMethod(Array, "intersection", function(array:Array):Array
			{
				var result:Array = [];
				var len:int = this.length;
				for (var i:int = 0; i < len; i++) {
					var element:Object = this[i];
					if (array.contains(element)) {
						result.push(element);
					}
				}
				return result;
			});
			Prototype.addMethod(Array, "isEmpty", function():Boolean
			{
				return this.length == 0;
			});
			Prototype.addMethod(Array, "random", function(count:uint = 1, unique:Boolean = true):Array
			{
				// if the count is greater than the length of the array when unique,
				// you will enter an infinite loop when checking to see if the value
				// has already been used.  to prevent this, just limit the count to the
				// length of the array.
				count = (unique && count > this.length) ? this.length : count;
				
				var result:Array = [];
				var indexes:Array = [];
				var range:IRange = from(0).to(this.length-1);
				for (var i:int = 0; i < count; i++) {
					var index:int = int( range.random() );
					while (unique && indexes.contains(index)) {
						index = int( range.random() );
					}
					indexes.push(index);
					result.push(this[index]);
				}
				return result;
			});
			Prototype.addMethod(Array, "randomize", function():Array
			{
				var n:int = this.length;
				while (n > 1) {
					var k:int = int( Math.random() * n );
					n = n - 1;
					var temp:Object = this[n];
					this[n] = this[k];
					this[k] = temp;
				}
				return this;
			});
			Prototype.addMethod(Array, "shuffle", function():Array
			{
				return this.randomize();
			});
			Prototype.addMethod(Array, "same", function(array:Array):Boolean
			{
				// null array, return false.
				if (array == null) {
					return false;
				}
				
				var len1:int = this.length;
				var len2:int = array.length;
				
				// same array, return true
				if (this == array) {
					return true;
				}
				
				// performance optimization. different sized array, can't be the same.
				if (len1 != len2) {
					return false;
				}
				
				// loop thru each element to see if the second array contains
				// the element from array 1.
				for (var i:int = 0; i < len1; i++) {
					if (array.indexOf(this[i]) == -1) {
						return false;
					}
				}
				
				return true;
			});
		}
	}
}