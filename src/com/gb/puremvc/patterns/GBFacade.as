package com.gb.puremvc.patterns
{
	import com.gb.puremvc.controller.*;
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import flash.display.LoaderInfo;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.loadup.controller.LoadupResourceFailedCommand;
	import org.puremvc.as3.multicore.utilities.loadup.controller.LoadupResourceLoadedCommand;
	import org.puremvc.as3.multicore.utilities.loadup.model.LoadupMonitorProxy;
		
	/**
	 * Base class for the concrete shell <code>Facade</code> in an GBPureMVC application.
	 * <p>
	 * Abstracts framework startup functionality.</p> 
	 */
    public class GBFacade extends Facade implements IFacade
    {		
		// Framework version.
		public static const GB_FRAMEWORK_VERSION:String = "3.0.0.r.34";
		
		private var _name:String = "";
		private var _version:String = "0.0.0.r.0";
		
		/**
		 * Constructor.
		 * 
		 * @param	String 	unique key for this PureMVC application
		 * 					
		 */
		public function GBFacade(key:String)
		{
			super(key);
		}
		
        /*
         * Register Commands with the Controller 
         */
        override protected function initializeController() : void 
        {
            super.initializeController();         
			
			// Register commands associated with the startup manager.
			registerCommand(GBNotifications.STARTUP_MONITOR_CONFIGURE, StartupMonitorConfigureCommand);
			registerCommand(GBNotifications.STARTUP_MONITOR_ADD_RESOURCES, StartupMonitorAddResourcesCommand);
			registerCommand(GBNotifications.STARTUP_RESOURCE_LOADED, LoadupResourceLoadedCommand);
			registerCommand(GBNotifications.STARTUP_RESOURCE_FAILED, LoadupResourceFailedCommand);
			registerCommand(LoadupMonitorProxy.LOADING_COMPLETE, StartupMonitorCompleteCommand);

			// Register external interface commands.
			registerCommand(GBNotifications.EXTERNAL_INTERFACE_SEND, ExternalInterfaceSendCommand);
        }
        
		/**
		 * Starts up application.
		 * 
		 * @param	Object		reference to document class
		 * @param 	Class		custom startup command. Optional, defaults to core framework command
		 */
        public function startup(application:Object, startupCommand:Class = null):void
        {
			// Default to standard GBPureMVC startup command if a custom command isn't specified.
			if (!startupCommand)
				startupCommand = ApplicationStartupCommand;
			
			registerCommand(GBNotifications.STARTUP, startupCommand);
			sendNotification(GBNotifications.STARTUP, application);
		}

		public function set name(value:String):void
		{
			_name = value;			
		}
		
		public function get name():String
		{
			return _name;
		}

		public function set version(value:String):void
		{
			_version = value;	
		}
		
		public function get version():String
		{
			return _version;
		}
    }
}