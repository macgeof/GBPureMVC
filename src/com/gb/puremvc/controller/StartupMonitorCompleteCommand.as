package com.gb.puremvc.controller 
{
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	/**
	 * Converts LOADING_COMPLETE notification of <code>StartupMonitor</code> into the 
	 * STARTUP_COMPLETE notification used by convention as the hook for initialising
	 * views in GB implementations. 
	 */
    public class StartupMonitorCompleteCommand extends SimpleCommand
    {
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			sendNotification(GBNotifications.STARTUP_COMPLETE);	
		}
    }
}