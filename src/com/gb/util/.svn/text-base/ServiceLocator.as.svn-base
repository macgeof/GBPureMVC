package com.gb.util
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.gb.model.*;
	import com.lassie.lib.IMediaLibrary;
	
	import flash.text.StyleSheet;

	/**
	 * Provides a means of storing and retrieving core framework resources and services
	 * by key.
	 * <p>
	 * <code>var dictionary:IDictionary = ServiceLocator.getInstance().getDictionary("myDictionary");</code></p>
	 */
	public class ServiceLocator
	{
		private static var _instance:ServiceLocator;				
		
		private var dictionaries:Object = {};
		private var settings:Object = {};
		private var styleSheets:Object = {};
		private var libraries:Object = {};
		private var loaders:Object = {};
	
		private var _layoutNamespace:Namespace;
		
		// TODO: error checking
		// TODO: generic addService method
		
		/**
		 * Returns the singleton instance of the <code>ServiceLocator</code>.
		 * 
		 * @return 	the singleton instance of the <code>ServiceLocator</code>
		 */
		public static function getInstance():ServiceLocator
		{
			if (!_instance) 
			{
				_instance = new ServiceLocator();
			}
			
			return _instance;
		}
		
		/**
		 * Adds an instance of <code>IDictionary</code> with the supplied key.
		 */
		public function addDictionary(value:IDictionary, key:String):Boolean
		{
			dictionaries[key] = value;
			return true;
		}
		
		/**
		 * Returns the instance of <code>IDictionary</code> associated
		 * with the supplied key.
		 */
		public function getDictionary(key:String):IDictionary
		{
			return dictionaries[key];
		}
		
		/**
		 * Removes the instance of <code>IDictionary</code> associated
		 * with the supplied key.
		 */
		public function removeDictionary(key:String):Boolean
		{
			if (dictionaries[key])
			{
				dictionaries[key] = null;
				delete dictionaries[key];
				return true;
			}
			
			return false;
		}
		
		/**
		 * Adds an instance of <code>ISettings</code> with the supplied key.
		 */
		public function addSettings(value:ISettings, key:String):Boolean
		{
			settings[key] = value;
			return true;
		}
		
		/**
		 * Returns the instance of <code>ISettings</code> associated
		 * with the supplied key.
		 */
		public function getSettings(key:String):ISettings
		{
			return settings[key];
		}
		
		/**
		 * Removes the instance of <code>IDictionary</code> associated
		 * with the supplied key.
		 */
		public function removeSettings(key:String):Boolean
		{
			if (settings[key])
			{
				settings[key] = null;
				delete settings[key];
				return true;
			}
			
			return false;
		}		
		
		/**
		 * Adds an instance of <code>StyleSheet</code> with the supplied key.
		 */
		public function addStyleSheet(value:StyleSheet, key:String):Boolean
		{
			styleSheets[key] = value;
			return true;
		}
		
		/**
		 * Returns the instance of <code>StyleSheet</code> associated
		 * with the supplied key.
		 */
		public function getStyleSheet(key:String):StyleSheet
		{
			return styleSheets[key];
		}
		
		/**
		 * Removes the instance of <code>StyleSheet</code> associated
		 * with the supplied key.
		 */
		public function removeStyleSheet(key:String):Boolean
		{
			if (styleSheets[key])
			{
				styleSheets[key] = null;
				delete styleSheets[key];
				return true;
			}
			
			return false;
		}		
		
		/**
		 * Adds an instance of <code>IMediaLibrary</code> with the supplied key.
		 */
		public function addLibrary(value:IMediaLibrary, key:String):Boolean
		{
			libraries[key] = value;
			return true;
		}
		
		/**
		 * Returns the instance of <code>IMediaLibrary</code> associated
		 * with the supplied key.
		 */
		public function getLibrary(key:String):IMediaLibrary
		{
			return libraries[key];
		}
		
		/**
		 * Removes the instance of <code>IMediaLibrary</code> associated
		 * with the supplied key.
		 */
		public function removeLibrary(key:String):Boolean
		{
			if (libraries[key])
			{
				libraries[key] = null;
				delete libraries[key];
				return true;
			}
			
			return false;
		}				

		/**
		 * Adds an instance of <code>BulkLoader</code> with the supplied key.
		 */
		public function addLoader(value:BulkLoader, key:String):Boolean
		{
			loaders[key] = value;
			return true;
		}
		
		/**
		 * Returns the instance of <code>BulkLoader</code> associated
		 * with the supplied key.
		 */
		public function getLoader(key:String):BulkLoader
		{
			return loaders[key];
		}
		
		/**
		 * Removes the instance of <code>BulkLoader</code> associated
		 * with the supplied key.
		 */
		public function removeLoader(key:String):Boolean
		{
			if (loaders[key])
			{
				loaders[key] = null;
				delete loaders[key];
				return true;
			}
			
			return false;
		}	
		
		/**
		 * Returns the layout namespace for the application. 
		 * <p>
		 * Used by view components in Lexus implementations which 
		 * support Hebrew right to left layouts.</p> 
		 */ 
		public function get layoutNamespace():Namespace
		{
			return _layoutNamespace;
		}

		/**
		 * Sets the layout namespace for the application. 
		 * <p>
		 * Used by view components in Lexus implementations which 
		 * support Hebrew right to left layouts.</p> 
		 */ 
		public function set layoutNamespace(value:Namespace):void
		{
			_layoutNamespace = value;
		}
	}
}