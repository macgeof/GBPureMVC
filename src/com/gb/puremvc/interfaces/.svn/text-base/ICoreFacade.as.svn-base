package com.gb.puremvc.interfaces 
{
	import com.gb.puremvc.GBCore;
	import com.gb.puremvc.controller.CoreStartupCommand;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	
	/**
	 * Interface definition for the concrete <code>Facade</code> class of a 
	 * PureMVC multicore module.
	 */
	public interface ICoreFacade extends IFacade
	{
		/**
		 * Starts up the core <code>Facade</code> in the PureMVC sense.
		 * 
		 * @param	core				reference to the core document class
		 * @param 	StartupCommand		optional custom StartupCommand which should extend 
		 * 								<code>CoreStartupCommand</code>. Defaults to <code>
		 * 								CoreStartupCommand</code> if none is specified. 
		 * 
		 */		
		function startup(core:Object, StartupCommand:Class = null):void;
		
		/**
		 * Destroys the core.
		 */
		function destroy():void;
	}
}