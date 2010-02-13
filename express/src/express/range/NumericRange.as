package express.range
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/**
	 * An inclusive set of objects from a beginning value to an
	 * ending value, where the objects in the range are numbers.
	 * 
	 * @author Dan Schultz
	 */
	public class NumericRange extends Proxy implements IRange
	{
		/**
		 * Creates a new range. If <code>to</code> if lower than 
		 * <code>from</code>, or vice-versa, the values are swapped.
		 * 
		 * @param from The lower boundary of this range.
		 * @param to The upper boundary of this range.
		 */
		public function NumericRange(from:int, to:int)
		{
			_from = (to < from) ? to : from;
			_to = (from > to) ? from : to;
		}
		
		/**
		 * @inheritDoc
		 */
		public function equalTo(range:IRange):Boolean
		{
			return range != null && 
				   from == range.from &&
				   to == range.to;
		}
		
		/**
		 * @inheritDoc
		 */
		public function contains(value:Object):Boolean
		{
			// catch any errors in case a client tries to compare an
			// object that does not support Flash's compare to operators.
			try {
				return value >= _from && value <= _to;
			} catch (e:Error) {
				
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function random():Object
		{
			return this[Math.round((Math.random() * (length-1)))];
		}
		
		private var _values:Array;
		/**
		 * @inheritDoc
		 */
		public function toArray():Array
		{
			if (_values == null) {
				_values = [];
				for (var i:int = _from; i <= _to; i++) {
					_values.push(i);
				}
			}
			return _values.concat();
		}
		
		/**
		 * @private
		 */
		override flash_proxy function deleteProperty(name:*):Boolean
		{
			return false;
		}
		
		/**
		 * @private
		 */
		override flash_proxy function getProperty(name:*):*
		{
			if (name is QName) {
				name = name.localName;
			}
			
			var index:int = -1;
			try {
				// If caller passed in a number such as 5.5, it will be floored.
				var n:Number = parseInt(String(name));
				if (!isNaN(n)) {
					index = int(n);
				}
			} catch(e:Error) {
				
			}
			
			if (index == -1) {
				throw new ArgumentError("Could not get value in range for name " + name);
			}
			
			return from + index;
		}
		
		/**
		 * @private
		 */
		override flash_proxy function hasProperty(name:*):Boolean
		{
			if (name is QName) {
				name = name.localName;
			}
			
			var index:int = -1;
			try {
				// If caller passed in a number such as 5.5, it will be floored.
				var n:Number = parseInt(String(name));
				if (!isNaN(n)) {
					index = int(n);
				}
			} catch(e:Error) {
				
			}
			
			return index >= 0 && index < length;
		}
		
		/**
		 * @private
		 */
		override flash_proxy function nextName(index:int):String
		{
			return (index - 1).toString();
		}
		
		/**
		 * @private
		 */
		override flash_proxy function nextNameIndex(index:int):int
		{
			return (index < length) ? index + 1 : 0;
		}
		
		/**
		 * @private
		 */
		override flash_proxy function nextValue(index:int):*
		{
			return this[index-1];
		}
		
		/**
		 * @private
		 */
		override flash_proxy function setProperty(name:*, value:*):void
		{
			throw new IllegalOperationError("Cannot set property '" + name + "' on range.");
		}
		
		private var _from:int;
		/**
		 * @inheritDoc
		 */
		public function get from():Object
		{
			return _from;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get length():int
		{
			return _to - _from + 1;
		}
		
		private var _to:int;
		/**
		 * @inheritDoc
		 */
		public function get to():Object
		{
			return _to;
		}
	}
}