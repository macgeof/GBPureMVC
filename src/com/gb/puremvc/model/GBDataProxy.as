package com.gb.puremvc.model 
{
	import com.gb.model.Dictionary;
	import com.gb.model.IDictionary;
	import com.gb.model.ISettings;
	import com.gb.model.Settings;
	import com.gb.model.enum.LoadParams;
	import com.gb.model.enum.ResourceTypes;
	import com.gb.puremvc.model.enum.Cores;
	import com.gb.puremvc.model.vo.StartupResourceVO;
	
	import flash.events.*;
	import flash.net.*;

	/**
	 * Base class for the implementation specific <code>ApplicationDataProxy</code>
	 * classe. Abstracts the logic for retrieving the path to the content XML.
	 * <p>
	 * It is an abstract class and should not be instantiated directly.</p>
	 * <p>
	 * Any implementation which requires a content XML should implement an <code>ApplicationDataProxy</code>
	 * which extends this class.</p>
	 * <p>
	 * The path to the content could come from one of two sources:</p>
	 * <ol>
	 * <li>The <code>source</code> attribute of the appropriate proxy declaration in the config XML</li>
	 * <li>The <code>contentxml</code> parameter of the <code>LoaderInfo</code> object.</li>
	 * </ol>
	 * <p>Handling both eventualities offers the flexibility to share config or
	 * content XML between multiple deployments of the same build.</p>
	*/
	public class GBDataProxy extends XMLLoaderProxy
	{
		public static const NAME:String = "GBDataProxy";
		
		/**
		 * Constructor.
		 */
		public function GBDataProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function load():void
		{
			/*
			* Means there is no path for content XML specified in the declaration
			* for this proxy in the config XML. We now check for the path in the 
			* <code>contentxml</code> parameter of the FlashVars.
			*/
			if (!resources.length)
			{
				resources = new Vector.<StartupResourceVO>();
				resources.push(new StartupResourceVO(
					loadParams.getSetting(LoadParams.CONTENT_XML),
					{id: Cores.SHELL, type: ResourceTypes.XML})
				);
			}
			
			super.load();
		}
		
		override protected function onLoad():void
		{
			super.onLoad();
			
			// Set up core settings and dictionary instances
			settings = parseSettings(xml.settings);
			dictionary = parseDictionary(xml.dictionary);
			
			// And register with service locator
			serviceLocator.addSettings(settings, Cores.SHELL);
			serviceLocator.addDictionary(dictionary, Cores.SHELL);
		}
		
		protected function parseDictionary(node:XMLList):IDictionary
		{
			var dictionary:IDictionary = new Dictionary();
			dictionary.addTerms(parseKeyValueData(node.children()));
			
			return dictionary;
		}
		
		protected function parseSettings(node:XMLList):ISettings
		{
			var settings:ISettings = new Settings();
			settings.addSettings(parseKeyValueData(node.children()));
			
			return settings;
		}
		
		protected function parseKeyValueData(xml:XMLList):Object
		{
			var data:Object = { };
			
			for (var i:int = 0; i < xml.length(); i ++)
			{
				var key:String = xml[i].@id;
				var value:String = xml[i].toString();
				
				data[key] = value;
			}
			
			return data;
		}		
		
		override public function get xml():XML
		{
			return _loader.getXML(Cores.SHELL);
		}
	}
}