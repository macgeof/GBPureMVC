package com.gb.puremvc.view
{
	import com.gb.model.*;
	import com.gb.model.enum.SettingsTypes;
	import com.gb.util.ServiceLocator;
	import com.lassie.lib.IMediaLibrary;
	
	import flash.text.StyleSheet;
	
	import org.as3commons.logging.ILogger;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	/**
	 * Base class for <code>Mediators</code> in an GBPureMVC application.
	 * <p>
	 * Exposes commonly used resources and services.</p>
	 */
	public class AbstractMediator extends Mediator
	{
		protected var serviceLocator:ServiceLocator;
		protected var logger:ILogger;
		
		// Framework resources.
		protected var styleSheet:StyleSheet;
		protected var library:IMediaLibrary;
		protected var loadParams:ISettings;
		protected var settings:ISettings; 
		protected var dictionary:IDictionary; 	
		
		/**
		 * Constructor.
		 */
		public function AbstractMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			serviceLocator = ServiceLocator.getInstance();
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