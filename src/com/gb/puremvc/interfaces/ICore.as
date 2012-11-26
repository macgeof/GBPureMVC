package com.gb.puremvc.interfaces 
{
	import com.gb.transitions.AbstractTransition;
	
	import flash.display.DisplayObject;

	/**
	 * Interface definition for the document classes of PureMVC multicore modules.
	 */
	public interface ICore
	{
		/**
		 * Starts up the core in the traditional PureMVC sense.
		 */  
		function startup():void;
		
		/**
		 * Destroys the core.
		 */
		function destroy():void;
		
		/**
		 * Transitions out the core - can be used to sequence removal of core
		 */
		function transitionOut(__transition:AbstractTransition):void;
		
		/**
		 * Transitions in the core - can be used to sequence creation of core
		 */
		function transitionIn(__transition:AbstractTransition):void;

		/**
		 * Returns the concrete root <code>Mediator</code> for this core.
		 * 
		 * @return 	the concrete root <code>Mediator</code> for this core.
		 */
		function get coreMediator():Class;
		
		/**
		 * Returns the concrete <code>Proxy</code> for this core.
		 * 
		 * @return 	the concrete <code>Proxy</code> for this core.
		 */		
		function get coreProxy():Class;
		
		function get key():String;
		function set key(value:String):void;
		
		function get _parent():DisplayObject
		function set _parent(value:DisplayObject):void;		
		
		function get data():*
		function set data(value:*):void;
		
		function pause():void;
		function stop():void;
		function play():void;
		function enable():void;
		function disable():void;
	}
}