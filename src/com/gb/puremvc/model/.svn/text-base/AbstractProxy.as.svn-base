package com.gb.puremvc.model
{
	import com.gb.model.*;
	import com.gb.model.enum.SettingsTypes;
	import com.gb.util.ServiceLocator;
	
	import org.as3commons.logging.ILogger;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	/**
	 * Base class for all GBPureMVC <code>Proxy</code> instances. 
	 * <p>
	 * Abstracts retrieval of <code>ServiceLocator</code> and <code>Settings</code>
	 * class containing the root <code>LoaderInfo</code> instance.</p>
	 * <p>
	 * Includes properties for other framework services and resources which should
	 * be set in the subclass.</p> 
	 */
	public class AbstractProxy extends Proxy
	{
		protected var serviceLocator:ServiceLocator; 
		protected var logger:ILogger;
		
		protected var loadParams:ISettings;
		protected var settings:ISettings; 
		protected var dictionary:IDictionary; 
		
		/**
		 * Constructor.
		 */
		public function AbstractProxy(proxyName:String = null, data:Object = null)
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			serviceLocator = ServiceLocator.getInstance();
			
			if (serviceLocator.getSettings(SettingsTypes.LOAD_PARAMS) != null)
				loadParams = serviceLocator.getSettings(SettingsTypes.LOAD_PARAMS);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRemove():void
		{
			super.onRemove();
			
			serviceLocator = null;
			loadParams = null;
		}
	}
}