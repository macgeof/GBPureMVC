package com.gb.model
{
	import com.gb.model.ISettings;	
	
	/**
	 * Basic settings class which facilitates the storage and retrieval of 
	 * values of various types via a key.  
	 */
	public class Settings implements ISettings
	{
		// Settings data.
		protected var _data:Object;
		
		/**
		 * @inheritDoc
		 */
		public function addSettings(value:Object):void 
		{
			if (!_data) _data = {};
			
			for (var key:String in value)
				_data[key] = value[key];
		}
		
		/**
		 * @inheritDoc
		 */
		public function addSetting(value:*, key:String):void
		{
			if (!_data) _data = {};
			_data[key] = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getSetting(key:String):*
		{
			return _data[key];
		}
	}
}