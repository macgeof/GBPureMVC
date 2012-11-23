package com.gb.puremvc.model 
{
    import com.gb.puremvc.model.enum.GBNotifications;
    
    import org.puremvc.as3.multicore.utilities.loadup.interfaces.ILoadupProxy;
    import org.puremvc.as3.multicore.utilities.loadup.model.LoadupResourceProxy;
  
	/**
	 * Base class for <code>Proxy</code> instances used by the PureMVC Startup Manager.
	 */
    public class EntityProxy extends AbstractProxy implements ILoadupProxy
    {
		private var _proxyNameSR:String;
		
		/**
		 * Constructor.
		 */		
        public function EntityProxy(proxyName:String = null, data:Object = null) 
		{
            super(proxyName, data);
			
			_proxyNameSR = proxyName != null ? proxyName + "SR" : null;
        }

		public function load():void
		{
			sendLoadedNotification(GBNotifications.STARTUP_RESOURCE_LOADING, proxyName, proxyNameSR);
		}
		
        protected function sendLoadedNotification(noteName:String, noteBody:Object, srName:String):void 
		{
            var srProxy:LoadupResourceProxy = facade.retrieveProxy(srName) as LoadupResourceProxy;
            if (!srProxy.isTimedOut())
			{
				// passing StartupResource proxy name allows us to distinguish it
                sendNotification(noteName, noteBody, srName);
			}
        }
		
		/**
		 * Returns the unique proxy name used by the PureMVC Startup Manager.
		 * <p>
		 * This is created by appending "SR" to the specified <code>proxyName</code>.</p>
		 * 
		 * @returns 	the unique proxy name used by the PureMVC StartupManager
		 */
		public function get proxyNameSR():String { return _proxyNameSR; }
    }
}