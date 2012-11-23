package com.gb.puremvc.model 
{
	import com.gb.model.enum.ResourceTypes;
	import com.gb.puremvc.model.vo.StartupResourceVO;
	
	import flash.events.*;
	import flash.net.*;
	
	import org.as3commons.logging.*;

	/**
	 * Loads and exposes XML loaded from path supplied in <code>source</code>
	 * attribute of <code>Proxy</code> declaration in config XML.
	 * <p>
	 * Abstracts functionality shared by <code>GBDataProxy</code> and 
	 * <code>ConfigurationProxy</code>.</p> 
	*/
	public class XMLLoaderProxy extends AbstractLoaderProxy
	{
		public static const NAME:String = "XMLLoaderProxy";
		
		/**
		 * Constructor.
		 */
		public function XMLLoaderProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}	
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			logger = LoggerFactory.getClassLogger(XMLLoaderProxy);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function load():void
		{
			// With XML we need to ensure BulkLoader knows the resource type.
			var resource:StartupResourceVO;
			
			if (resources != null)
			{
				for (var i:int = 0; i < resources.length; i ++)
				{
					resource = StartupResourceVO(resources[i]);
					resource.props.type = ResourceTypes.XML;
				}
			}
			
			super.load();
		}
		
		public function getXML(key:String):XML
		{
			return loader.getXML(key);
		}	
		
		public function get xml():XML
		{
			return null;
		}
	}
}