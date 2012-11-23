/*
 Copyright (c) 2008 AllFlashWebsite.com
 All rights reserved.
 
 Some code compiled from forum:
 http://forums.puremvc.org/index.php?PHPSESSID=a0b1441c9f879cef0256b86ddc30fe29&topic=286.msg1104#msg1104

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @ignore
 */
 
package com.gb.puremvc.model
{
	import com.afw.swfaddress.SWFAddressUtil;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.asual.swfaddress.*;
	
	import flash.external.ExternalInterface;
	
	import org.as3commons.logging.LoggerFactory;
	
	/**
	 * Initialises and exposes methods of <code>SWFAddress</code>.
	 */	
    public class SWFAddressProxy extends EntityProxy
    {
        public static const NAME:String = 'SWFAddressProxy';
		
		private var _initialized:Boolean = false;
		
		/**
		 * Constructor.
		 */
        public function SWFAddressProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
        }
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			logger = LoggerFactory.getClassLogger(SWFAddressProxy);
		}
		
		/**
		 * Initialises <code>SWFAddress</code> by listening for the first <code>CHANGE</code> event.
		 */
		override public function load():void
		{
			super.load();
			
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, addressChangeHandler);
		}
		
		private function addressChangeHandler(event:SWFAddressEvent):void
		{
			setTargetURL(event.value);
			
			if (!_initialized)
			{
				_initialized = true;
				sendLoadedNotification(GBNotifications.STARTUP_RESOURCE_LOADED, proxyName, proxyNameSR);
			}
		}		
		
		/**
		 * Returns the deep linking value without the query string.
		 */
		public function getPath():String
		{
			return SWFAddress.getPath();
		}		
		
		/**
		 * Returns the base address of the document. 
		 */
		public function getBaseURL():String
		{
			return SWFAddress.getBaseURL();
		}
		
		/**
		 * Returns the deep linking value as an <code>Array</code> with 
		 * an element representing each segment of the <code>URL</code>.
		 */
		public function getSegments():Array
		{
			return SWFAddressUtil.segmentURI(SWFAddress.getPath());
		}
		
		/**
		 * Requests a new <code>URL</code> via <code>SWFAddress</code>
		 * 
		 * @param	the <code>URL</code> request
		 */
		public function requestURL(url:String):void
		{
			if (ExternalInterface.available)
				SWFAddress.setValue(url);
			else
				setTargetURL(url);
		}
		
		/**
		 * Sets the page title.
		 * 
		 * @param	the new page title
		 */
		public function setTitle(title:String):void
		{
			SWFAddress.setTitle(title);
		}
		
		private function setTargetURL(url:String):void
		{
			logger.info("Address changed: " + url);
			sendNotification(GBNotifications.ADDRESS_CHANGED, url);		
		}

		/**
		 * Returns <code>true</code> if <code>SWFAddress</code> has 
		 * initialized successfully.
		 */
		public function get initialized():Boolean
		{
			return _initialized;
		}
     }
}