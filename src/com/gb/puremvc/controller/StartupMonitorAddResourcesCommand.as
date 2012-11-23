package com.gb.puremvc.controller 
{
	import com.gb.puremvc.model.*;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.gb.puremvc.model.vo.StartupMonitorVO;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.loadup.interfaces.ILoadupProxy;
	import org.puremvc.as3.multicore.utilities.loadup.model.LoadupMonitorProxy;
	import org.puremvc.as3.multicore.utilities.loadup.model.LoadupResourceProxy;
	
	/**
	 * Adds the list of <code>IStartupProxy</code> instances to the <code>StartupMonitorProxy</code>
	 * and closes the monitor's resource list.
	 */
    public class StartupMonitorAddResourcesCommand extends SimpleCommand
    {
		/**
		 * @inheritDoc
		 */
		override public function execute(notification:INotification):void    
        {
			super.execute(notification);
			
			var data:StartupMonitorVO = StartupMonitorVO(notification.getBody());
			
			var proxies:Vector.<ILoadupProxy> = data.proxies;
			var monitor:LoadupMonitorProxy = LoadupMonitorProxy(facade.retrieveProxy(LoadupMonitorProxy.NAME));

			var rPreviousProxy:IProxy; 
			
			try
			{
				for (var i:int = 0; i < proxies.length; i ++)
				{	
					// Create a new instance of proxy and register with facade.
					var startupProxy:ILoadupProxy = ILoadupProxy(proxies[i]);
					facade.registerProxy(startupProxy);
					
					// Create supporting startup resource proxy.
					var rStartupProxy:LoadupResourceProxy = new LoadupResourceProxy((startupProxy as EntityProxy).proxyNameSR, startupProxy);
					facade.registerProxy(rStartupProxy);
					
					// Dependency of this startup proxy is the previously created dynamic proxy
					// this ensures an asynchronous load of all resources.
					if (rPreviousProxy != null) rStartupProxy.requires = [rPreviousProxy];
					monitor.addResource(rStartupProxy);
					
					rPreviousProxy = rStartupProxy;
				}			
				
				data.listOpen ? monitor.keepResourceListOpen() : monitor.closeResourceList();
			}
			catch (error:Error)
			{
				sendNotification(GBNotifications.ERROR, error);
			}
        }
    }
}