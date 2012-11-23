package com.gb.puremvc.controller
{
	import com.gb.puremvc.model.vo.StartupMonitorVO;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.loadup.model.LoadupMonitorProxy;
	
	public class StartupMonitorRegisterCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			var data:StartupMonitorVO = StartupMonitorVO(notification.getBody());
			
			facade.registerProxy(new LoadupMonitorProxy());	
			
			var monitor:LoadupMonitorProxy = LoadupMonitorProxy(facade.retrieveProxy(LoadupMonitorProxy.NAME));
			monitor.expectedNumberOfResources = data.expectedResources;
		}
	}
}