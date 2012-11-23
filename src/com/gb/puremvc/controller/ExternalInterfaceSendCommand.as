package com.gb.puremvc.controller
{
	import com.gb.external.ExternalInterfaceStack;
	import com.gb.model.enum.ExternalInterfaceMethods;
	
	import org.as3commons.logging.LoggerFactory;
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	/**
	 * General command for making outgoing external interface calls.
	 * <p>
	 * For situations in which a synchronous return is expected from the call,
	 * a specific command should be written.</p>
	 */
    public class ExternalInterfaceSendCommand extends SimpleCommand implements ICommand 
    {
		/**
		 * @inheritDoc
		 */
		override public function execute(notification:INotification):void    
        {
			super.execute(notification);
			
			var data:* = notification.getBody();

			// Log the fact that we're sending some data.
			LoggerFactory.getClassLogger(ExternalInterfaceSendCommand).info(
				"Sending external interface data: " + data);			
			
			ExternalInterfaceStack.getInstance().addCall(
				ExternalInterfaceMethods.JAVASCRIPT_INTERFACE, data);
        }
    }
}