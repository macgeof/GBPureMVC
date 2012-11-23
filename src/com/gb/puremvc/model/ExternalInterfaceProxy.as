﻿package com.gb.puremvc.model 
{
	import com.gb.external.*;
	import com.gb.model.enum.*;
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import flash.events.*;
	import flash.external.ExternalInterface;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	
	/**
	 * Initialises <code>ExternalInterface</code> using <code>ExternalInterfaceInitializer</code>
	 * class and sets up a call back to this class for incoming <code>ExternalInterface</code> data.
	 */
	public class ExternalInterfaceProxy extends EntityProxy 
	{
		public static const NAME:String = "ExternalInterfaceProxy";
		
		private var initializer:ExternalInterfaceInitializer = new ExternalInterfaceInitializer();
		private var _initialized:Boolean = false;
		
		/**
		 * Constructor.
		 */
		public function ExternalInterfaceProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}

		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			logger = LoggerFactory.getClassLogger(ExternalInterfaceProxy);
		}
		
		/**
		 * Starts <code>ExternalInterface</code> initialization process.
		 */
		override public function load():void
		{
           	super.load();
			
			addListeners();
			
			initializer.javascriptReady = ExternalInterfaceMethods.JAVASCRIPT_READY;
			initializer.flashReady = ExternalInterfaceMethods.FLASH_READY;
			initializer.initialize();
		}
		
		private function addListeners():void
		{
			initializer.addEventListener(ExternalInterfaceInitializer.INITIALIZED, initializedHandler);
			initializer.addEventListener(ExternalInterfaceInitializer.ERROR, errorHandler);			
		}
		
		private function removeListeners():void
		{
			initializer.removeEventListener(ExternalInterfaceInitializer.INITIALIZED, initializedHandler);
			initializer.removeEventListener(ExternalInterfaceInitializer.ERROR, errorHandler);		
		}
		
		private function initializedHandler(event:Event = null):void 
		{	
			//trace("ExternalInterfaceProxy.initialisedHandler(): ");
			//logger.debug("External interface initialized");
			_initialized = true;
			createCallback();
			dispatchLoadedEvent();
		}
		
		private function createCallback():void
		{
			// set up handler to receive external interface data from JavaScript
			ExternalInterface.addCallback(ExternalInterfaceMethods.FLASH_INTERFACE, dataReceivedHandler);				
		}
		
		private function dataReceivedHandler(data:*):void
		{
			logger.debug("Received external interface data: " + data);
			sendNotification(GBNotifications.EXTERNAL_INTERFACE_RECEIVE, data);
		}
		
		/*
		 * If external interface fails to initialise we'll output a message
		 * to the logger but continue with the rest of the loading as normal. 
		 * This allows us to side-step the issue of external interface failing
		 * in the development environment because there is no access to the 
		 * associated JavaScript.
		 */
		private function errorHandler(event:ErrorEvent = null):void 
		{
			//trace("ExternalInterfaceProxy.errorHandler(): error: " + event.text);
			logger.error(event.text);
			dispatchLoadedEvent();
        }
		
		private function dispatchLoadedEvent():void
		{
			removeListeners();
			sendLoadedNotification(GBNotifications.STARTUP_RESOURCE_LOADED, proxyName, proxyNameSR);
		}
		
		/**
		 * Returns <code>true</code> if <code>ExternalInterface</code> has been successfuly initialised.
		 * 
		 * @return 	<code>true</code> if <code>ExternalInterface</code> has been successfully intialised
		 */
		public function get initialized():Boolean { return _initialized; }
	}
}