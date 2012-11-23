package com.gb.puremvc.patterns 
{
	import com.gb.puremvc.GBCore;
	import com.gb.puremvc.controller.*;
	import com.gb.puremvc.interfaces.ICoreFacade;
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	/**
	 * Base class for concrete core <code>Facades</code> of an GBPureMVC
	 * application. 
	 */
	public class GBCoreFacade extends Facade implements ICoreFacade
	{
		/**
		 * Constructor.
		 * 
		 * @param	key		the unique key for this core
		 */
		public function GBCoreFacade(key:String) 
		{
			super(key);
		}
		
		override protected function initializeController():void 
		{
			super.initializeController();
			
			registerCommand(GBNotifications.EXTERNAL_INTERFACE_SEND, ExternalInterfaceSendCommand);
		}
		
		/**
		 * Starts up core.
		 * 
		 * @param	Object		reference to target <code>DisplayObject</code> of core
		 * @param 	Class		custom startup command. Optional, defaults to core framework command
		 */
		public function startup(core:Object, startupCommand:Class = null):void
		{
			// Default to core startup command if a custom command isn't specified.
			if (!startupCommand)
				startupCommand = CoreStartupCommand;
			
			registerCommand(GBNotifications.STARTUP, startupCommand);
			sendNotification(GBNotifications.STARTUP, core);
		}

		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			removeCommand(GBNotifications.STARTUP);
			removeCommand(GBNotifications.EXTERNAL_INTERFACE_SEND);
			
			sendNotification(GBNotifications.DESTROY);
		}
	}
}