package com.gb.model
{
	import com.gb.model.IDictionary;	
	
	/**
	 * Basic dictionary class which facilitates the storage and retrieval of 
	 * <code>String</code> instances via a key.  
	 */
	public class Dictionary implements IDictionary
	{
		// Dictionary data.
		protected var _data:Object;
		
		/**
		 * @inheritDoc
		 */
		public function addTerms(value:Object):void 
		{
			if (!_data) _data = {};
			
			for (var key:String in value)
				_data[key] = value[key];
		}
		
		/**
		 * @inheritDoc
		 */
		public function addTerm(value:String, key:String):void
		{
			if (!_data) _data = {};
			_data[key] = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getTerm(key:String):String
		{
			return _data[key] || "[" + key + "]";
		}
	}
}