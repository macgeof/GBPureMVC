package com.gb.model
{
	/**
	 * The interface definition for dictionaries. 
	 */
	public interface IDictionary 
	{
		/**
		 * Adds an <code>Array</code> of key value pairs to the dictionary.
		 * <p>
		 * Elements should follow the format {value:String, key:String}</p>
		 * 
		 * @param	value	<code>Array</code> of key value pairs to add.	
		 */
		function addTerms(value:Object):void;
		
		/**
		 * Adds a <code>String</code> to the dictionary.
		 * 
		 * @param 	value	the <code>String</code> to add to the dictionary
		 * @param 	key		the key of <code>String</code> used to retrieve it
		 */
		function addTerm(value:String, key:String):void;
		
		/**
		 * Returns the <code>String</code> associated with the supplied key.
		 * 
		 * @param 		key		the key for the <code>String</code>
		 * 
		 * @returns 	the <code>String</code> associated with the supplied key
		 */
		function getTerm(key:String):String;
	}
	
}