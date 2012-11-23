﻿package com.gb.puremvc.model 
{
	import com.gb.model.enum.LoadParams;
	import com.gb.puremvc.model.enum.Cores;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.gb.puremvc.model.vo.StartupMonitorVO;
	import com.gb.puremvc.model.vo.StartupResourceVO;
	import com.gb.util.XMLUtil;
	
	import flash.events.*;
	import flash.utils.getDefinitionByName;
	
	import org.puremvc.as3.multicore.utilities.loadup.interfaces.ILoadupProxy;
	
	/**
	 * Loads the config XML from path specified in <code>configxml</code> parameter of 
	 * <code>flashVars</code> or from default path if not defined. 
	 * <p>
	 * Data is exposed as raw XML via the <code>Proxy.getData()</code> method.</p> 
	 */
	public class ConfigurationProxy extends XMLLoaderProxy
	{
		public static const NAME:String = "ConfigurationProxy";		
		public static const DEFAULT_PATH:String = "xml/config.xml";
		
		private static const ASYNCH:String = "asynch";
		private static const ORDER:String = "order";		
		
		/**
		 * Constructor.
		 */
		public function ConfigurationProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function load():void 
		{
			var url:String = loadParams.getSetting(LoadParams.CONFIG_XML);
			
			// Use default path if config not specified in flashVars
			if (url == null)
				url = DEFAULT_PATH;
			
			resources = new Vector.<StartupResourceVO>();
			resources.push(new StartupResourceVO(url, {id: LoadParams.CONFIG_XML}));
	
			super.load();
        }

		override protected function onLoad():void 
		{	
			// Parse the proxies into value object expected by add resources command
			// Types other than ASYNCH no longer supported but check included to avoid breaking legacy XML
			var proxies:Vector.<ILoadupProxy> = parseProxies(sort(xml.proxy).(@type == ASYNCH));

			sendNotification(GBNotifications.STARTUP_MONITOR_ADD_RESOURCES, 
				new StartupMonitorVO(proxies, false));
		}
		
		private function parseProxies(proxies:XMLList):Vector.<ILoadupProxy>
		{
			var vector:Vector.<ILoadupProxy> = new Vector.<ILoadupProxy>();
			
			for each (var proxy:XML in proxies)
			{	
				// Resolve proxy class name
				var proxyClass:Class = Class(getDefinitionByName(proxy.@classPath));
				var proxySource:Vector.<StartupResourceVO> = parseProxySources(proxy);
				
				vector.push(new proxyClass(proxyClass.NAME, proxySource));
			}		
			
			return vector;
		}
		
		private function parseProxySources(proxy:XML):Vector.<StartupResourceVO>
		{
			var vector:Vector.<StartupResourceVO> = new Vector.<StartupResourceVO>();
			if (proxy.children().length() > 0)
			{			
				for each (var asset:XML in proxy.asset)
					vector.push(new StartupResourceVO(asset.@source, {id: asset.@name}));				
			}
			// For instances in which only a single source is specified
			else if (proxy.hasOwnProperty("@source"))
				vector.push(new StartupResourceVO(proxy.@source, {id: Cores.SHELL}));

			return vector;			
		}
		
		private function sort(xmlList:XMLList):XMLList
		{
			// If order attribute is omitted from any of the declarations
			// we return the list unsorted. 
			for each (var item:XML in xmlList)
				if (!item.hasOwnProperty("@" + ORDER)) 
					return xmlList;
			
			return XMLUtil.sortXMLByAttribute(xmlList, ORDER, Array.NUMERIC);
		}
		
		override public function get xml():XML
		{
			return getXML(LoadParams.CONFIG_XML);
		}
	}
}