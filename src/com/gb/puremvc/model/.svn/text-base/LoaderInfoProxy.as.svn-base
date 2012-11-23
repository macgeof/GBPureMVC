package com.gb.puremvc.model 
{
	import com.gb.model.*;
	import com.gb.model.enum.Countries;
	import com.gb.model.enum.Languages;
	import com.gb.model.enum.LoadParams;
	import com.gb.model.enum.SettingsTypes;
	import com.gb.util.ServiceLocator;
	
	import flash.display.LoaderInfo;
	
	import org.as3commons.logging.*;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	/**
	 * Retrieves the root <code>LoaderInfo</code> object and adds it as an 
	 * instance of <code>ISettings</code> to the <code>ServiceLocator</code>.
	 */
	public class LoaderInfoProxy extends Proxy
	{
		public static const NAME:String = "LoaderInfoProxy";
		
		private var logger:ILogger = LoggerFactory.getClassLogger(LoaderInfoProxy);
		
		/**
		 * Constructor.
		 */
		public function LoaderInfoProxy(name:String = null, data:Object = null) 
		{
			super(name, data);
		}	
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void 
		{
			super.onRegister();

			// Create a settings instance to contain the LoaderInfo parameters object.
			var settings:ISettings = new Settings();
			settings.addSettings(parameters);
			
			// Set defaults for language and country settings.
			if (settings.getSetting(LoadParams.COUNTRY) == undefined)
				settings.addSetting(Countries.EU, LoadParams.COUNTRY);
			
			if (settings.getSetting(LoadParams.LANGUAGE) == undefined)
				settings.addSetting(Languages.EN, LoadParams.LANGUAGE); 
			
			// Add settings instance to the ServiceLocator.
			ServiceLocator.getInstance().addSettings(settings, SettingsTypes.LOAD_PARAMS);
		}
		
		/**
		 * Returns the parameters of the root <code>LoaderInfo</code> instance.
		 * 
		 * @return 	the parameters of the root <code>LoaderInfo</code> instance
		 */
		public function get parameters():Object
		{
			return (getData() as LoaderInfo).parameters;
		}			
		
		/**
		 * Returns the root <code>LoaderInfo</code> instance.
		 * 
		 * @return 	the root <code>LoaderInfo</code> instance
		 */
		public function get loaderInfo():LoaderInfo
		{
			return getData() as LoaderInfo;
		}	
	}
}