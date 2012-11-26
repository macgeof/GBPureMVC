package com.gb.puremvc.model.enum
{
	/**
	 * Enumeration of framework notification constants.
	 */
	public class GBNotifications
	{
		// Startup notification name constants.
		public static const STARTUP:String = "startup";
		public static const DESTROY:String = "destroy";
		
		public static const STARTUP_MONITOR_CONFIGURE:String = "startupMonitorConfigure";
		public static const STARTUP_MONITOR_ADD_RESOURCES:String = "startupMonitorAddResources";
		public static const STARTUP_STARTED:String = "startupStarted";
		public static const STARTUP_COMPLETE:String = "startupComplete";
		
		// Startup manager notification constants
		public static const STARTUP_RESOURCE_LOADING:String = "startupResourceLoading";
		public static const STARTUP_RESOURCE_LOADED:String = "startupResourceLoaded";
		public static const STARTUP_RESOURCE_FAILED:String = "startupResourceFailed"; 
		
		// Error notification name constants.
		public static const ERROR:String = "error";
		public static const ERROR_INITIALIZED:String = "errorInitialized";
		
		// ExternalInterface notifications name constants. 
		public static const EXTERNAL_INTERFACE_SEND:String = "externalInterfaceSend";
		public static const EXTERNAL_INTERFACE_RECEIVE:String = "externalInterfaceReceive";
		
		// SWFAddress notification name constants.
		public static const ADDRESS_CHANGED:String = "addressChanged";
		
		// Logger notification names.
		public static const LOGGER_INITIALIZED:String = "loggerInitialized";
		
		//interface methods for cores
		public static const PAUSE:String = "pauseCore";
		public static const PLAY:String = "playCore";
		public static const STOP:String = "stopCore";
		public static const ENABLE:String = "enableCore";
		public static const DISABLE:String = "disableCore";
	}
}