package com.gb.puremvc 
{
	import com.gb.puremvc.controller.ApplicationStartupCommand;
	import com.gb.puremvc.interfaces.*;
	import com.gb.puremvc.patterns.GBFacade;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.modules.ModuleBase;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	import spark.modules.Module;
	
	/**
	 * Base class for Flex document classes of an GBPureMVC application. 
	 * <p>
	 * Abstracts the ugly logic required to ensure that application
	 * is not initialised before <code>Stage</code> and <code>Stage</code>
	 * dimensions are set.</p>
	 */
	public class GBFlexApplication extends Module implements IShell
	{
		private static const RESIZE_TIMER_DELAY:int = 500;
		private static const RESIZE_TIMER_REPEAT:int = 10;
		
		protected var facade:GBFacade;
		protected var resizeTimer:Timer;
		
		/**
		 * Constructor.
		 */
		public function GBFlexApplication():void 
		{	
			// ensure stage is set before we proceed
			if (stage)
			{
				addedToStageHandler();
			}
			else 
			{
				addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			}
		}
		
		protected function startup():void
		{
			throw new Error("Please instantiate and startup a concrete facade in the subclass");
		}
		
		public function get applicationMediator():Class
		{
			throw new Error("Please define a concrete ApplicationMediator class in subclass");
		}
		
		protected function addedToStageHandler(event:Event = null):void
		{
			if (event) 
				removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			/*
			 * If stage dimensions aren't set at this point we delay 
			 * initialisation until we get a stage resize event.
			 */
			
			if (!isStageSet())
			{
				stage.addEventListener(Event.RESIZE, resizeHandler);
				
				// Start a timer going - kludgy bug fix for IE
				startResizeTimer();
			}
			else
			{
				init();
			}
		}
		
		private function startResizeTimer():void
		{
			resizeTimer = new Timer(RESIZE_TIMER_DELAY, RESIZE_TIMER_REPEAT);
			resizeTimer.addEventListener(TimerEvent.TIMER, resizeTimerHandler);
			resizeTimer.start();
		}
		
		private function resizeTimerHandler(event:TimerEvent):void
		{
			if (isStageSet())
			{
				resizeTimer.stop();
				resizeTimer.removeEventListener(TimerEvent.TIMER, resizeTimerHandler);
				
				resizeHandler(event);
			}
		}		
		
		protected function resizeHandler(event:Event = null):void
		{
			if (isStageSet())
			{
				stage.removeEventListener(Event.RESIZE, resizeHandler);
				init();
			}
		}
		
		// returns true if stage dimensions are set
		protected function isStageSet():Boolean
		{
			return !(stage.stageWidth == 0 && stage.stageHeight == 0);
		}
		
		protected function init(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			startup();
		}	
	}
}