package com.gb.model
{
	/**
	 * The interface definition for settings. 
	 */
	public interface ISettings 
	{
		/**
		 * Adds an <code>Array</code> of key value pairs to the settings.
		 * <p>
		 * Elements should follow the format {value:*, key:String}</p>
		 * 
		 * @param	value	<code>Array</code> of key value pairs to add.	
		 */
		function addSettings(value:Object):void;
		
		/**
		 * Adds an item to the settings.
		 * 
		 * @param 	value	the item to add to the settings
		 * @param 	key		the key of the item used to retrieve it
		 */
		function addSetting(value:*, key:String):void;
		
		/**
		 * Returns the item associated with the supplied key.
		 * 
		 * @param 		key		the key for the item
		 * 
		 * @returns 	the item associated with the supplied key
		 */
		function getSetting(key:String):*;
	}
	
}