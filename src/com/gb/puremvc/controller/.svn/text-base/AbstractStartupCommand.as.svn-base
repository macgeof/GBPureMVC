package com.gb.puremvc.controller 
{
	import com.gb.puremvc.interfaces.IShell;
	import com.gb.puremvc.model.*;
	
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	/**
	 * This is the classic <code>StartupCommand</code> in the PureMVC sense. 
	 * <p>
	 * Instantiates and registers the concrete <code>Mediator</code> specified in the document
	 * class of the implementation</p> 
	 */
    public class AbstractStartupCommand extends SimpleCommand 
    {
		/**
		 * @inheritDoc
		 */
		override public function execute(notification:INotification):void    
        {
			super.execute(notification);
			
			// Retrieve document class reference from notification.
			var application:DisplayObject = DisplayObject(notification.getBody());
			
			// Retrieve concrete application mediator.
			var applicationMediatorClass:Class = IShell(application).applicationMediator;
			
			// Register and populate proxy to store and expose root LoaderInfo object.
			facade.registerProxy(new LoaderInfoProxy(LoaderInfoProxy.NAME, application.loaderInfo));				
			
			// Register new instance of concrete application mediator with facade.
			facade.registerMediator(new applicationMediatorClass(applicationMediatorClass.NAME, application));		
        }
    }
}