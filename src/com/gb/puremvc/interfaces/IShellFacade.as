package com.gb.puremvc.interfaces
{
	import org.puremvc.as3.multicore.interfaces.IFacade;
	
	public interface IShellFacade extends IFacade
	{
		function startup(application:Object, startupCommand:Class = null):void
	}
}