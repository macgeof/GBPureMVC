package com.gb.puremvc.interfaces 
{
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
	}
}