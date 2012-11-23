﻿package com.gb.puremvc.controller 
{
	import com.gb.puremvc.model.ConfigurationProxy;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.gb.puremvc.model.vo.StartupMonitorVO;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.utilities.loadup.interfaces.ILoadupProxy;

	/**
	 * 
	 */
    public class ApplicationStartupCommand extends AbstractStartupCommand
    {
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			var proxies:Vector.<ILoadupProxy> = new Vector.<ILoadupProxy>();
			proxies.push(new ConfigurationProxy(ConfigurationProxy.NAME));
			
			sendNotification(GBNotifications.STARTUP_MONITOR_CONFIGURE, new StartupMonitorVO(proxies, true, 10));
		}
    }
}