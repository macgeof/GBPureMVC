package com.gb.external
{
	import flash.events.*;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;

	/**
	 * Handles initialization of <code>ExternalInterface</code> by polling parent page 
	 * for the availability of the supplied <code>JavaScript</code> ready method before 
	 * indicating Flash availibility by calling supplied flash ready method.  
	 */
	public class ExternalInterfaceInitializer extends EventDispatcher
	{		
		/**
		 * Defines the value of the type property of a initialized event object
		 */
		public static const INITIALIZED:String = "initialized";
		
		/**
		 * Defines the value of the type property of a initialized event object
		 */
		public static const ERROR:String = "error";
		
		// Handshake methods.
		private var _javascriptReady:String = "fiJavascriptReady";
		private var _flashReady:String = "fiFlashReady";
		
		// Timer settings for polling the parent page.
		private var _delay:int = 100;
		private var _repeat:int = 50;
		
		private var timer:Timer;
		
		/**
		 * Class initialization method. The cue to start polling the parent
		 * page for availability of <code>JavaScript</code> ready method.
		 */
		public function initialize():void
		{
            if (ExternalInterface.available) 
			{
                try
				{
					timer = new Timer(_delay, _repeat);
					timer.addEventListener(TimerEvent.TIMER, timerHandler);
					timer.start();
                } 
				catch (error:SecurityError) 
				{
                    //trace("A SecurityError occurred: " + error.message + "\n");
					dispatchErrorEvent(error);
                } 
				catch (error:Error) 
				{
                    //trace("An Error occurred: " + error.message + "\n");
					dispatchErrorEvent(error);
                }
            } 
			else 
			{
				dispatchErrorEvent(new Error("ExternalInterface is not available"));
            }	
		}
		
        private function timerHandler(event:TimerEvent):void 
		{
			if (timer.currentCount < timer.repeatCount)
			{
				call();
			}
			else
			{
				stop();
				var msg:String = "Tried JavaScript method " 
											+ _javascriptReady 
											+ " " 
											+ timer.repeatCount 
											+ " times, stopping";
											
				dispatchErrorEvent(new Error(msg));
			}
        }
		
		private function call():void
		{							
			if (ExternalInterface.call(_javascriptReady))
			{
				stop();
				dispatchInitialisedEvent();
			}
		}
		
		/**
		 * Stops the polling of the parent page.
		 */
		public function stop():void
		{
			timer.stop();
		}
		
		private function dispatchInitialisedEvent():void
		{
			dispatchEvent(new Event(INITIALIZED));
			
			/*
			 * Any callbacks should be set up by interested parties on receipt
			 * of the INITIALIZED event dispatched above. 
			 * The following call lets the JavaScript know that we are ready
			 * to receive calls. This provides the hook for setting via JavaScript
			 * any properties required during start up. 
			 */							
			ExternalInterface.call(_flashReady);
		}
		
		private function dispatchErrorEvent(error:Error):void
		{
			//trace("........ ExternalInterfaceManager.dispatchErrorEvent(): ");
			dispatchEvent(new ErrorEvent(ERROR, false, false, error.message));
		}
		
		public function set flashReady(value:String):void 
		{
			_flashReady = value;
		}
		
		public function set javascriptReady(value:String):void 
		{
			_javascriptReady = value;
		}
		
		public function set delay(value:int):void 
		{
			_delay = value;
		}
		
		public function set repeat(value:int):void 
		{
			_repeat = value;
		}
	}
}