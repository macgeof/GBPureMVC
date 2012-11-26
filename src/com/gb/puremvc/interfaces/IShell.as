package com.gb.puremvc.interfaces 
{
	/**
	 * Interface definition for shell document class.
	 */
	public interface IShell 
	{
		/**
		 * Returns the concrete root <code>Mediator</code> for the shell.
		 * 
		 * @return 	the concrete root <code>Mediator</code> for the shell
		 */		
		function get applicationMediator():Class;
		
		function coreTransitionedOut(__core:ICore):void;
	}
}