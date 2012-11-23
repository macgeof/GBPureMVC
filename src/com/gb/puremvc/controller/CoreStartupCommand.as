package com.gb.puremvc.controller 
{
	import com.gb.puremvc.interfaces.ICore;
	
	import org.puremvc.as3.multicore.interfaces.*;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
    
	/**
	 * Instantiable base class for multicore startup. Can be extended in the multicore
	 * implementation to add custom startup functionality.
	 */
	public class CoreStartupCommand extends SimpleCommand 
	{
		/**
		 * @inheritDoc
		 */
		override public function execute(notification:INotification):void 
		{
			super.execute(notification);
			
			var core:ICore = ICore(notification.getBody());	
			
			// Retrieve concrete Mediator and Proxy classes from core.
			var concreteMediator:Class = core.coreMediator;
			var concreteProxy:Class = core.coreProxy;
			
			// Register the concrete proxy and mediator.
			facade.registerProxy(new concreteProxy(concreteProxy.NAME, core.data));
			facade.registerMediator(new concreteMediator(concreteMediator.NAME, core));
		}	
	}
}