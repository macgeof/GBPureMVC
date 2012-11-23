package com.gb.puremvc.model 
{
	import com.gb.logging.XrayLoggerFactory;
	import com.gb.model.enum.LoggerTypes;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.gb.puremvc.model.enum.Cores;
	
	import flash.events.*;
	
	import org.as3commons.logging.LoggerFactory;
	
	/**
	 * Loads the <code>Xray</code> SWF from the supplied path and sets <code>XrayLoggerFactory</code> 
	 * as the <code>loggerFactory</code>.
	 * <p>
	 * There is no need ever to refer to this proxy after start up has executed. <code>Xray</code>
	 * can be retrieved via the <code>LoggerFactory</code> as follows:</p>
	 * <p>
	 * <code>var logger:ILogger = LoggerFactory.getClassLogger(ApplicationMediator);</code></p>
	 */
	public class XrayProxy extends AbstractLoaderProxy
	{
		public static const NAME:String = "XrayProxy";

		/**
		 * Constructor.
		 */
		public function XrayProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			logger = LoggerFactory.getClassLogger(XrayProxy);
		}
		
		/**
		 * @inheritDoc
		 */
		
		override protected function onLoad():void
		{
			super.onLoad();
			
			// set XrayLoggerFactory as our loggerFactory for this application
			LoggerFactory.loggerFactory = new XrayLoggerFactory();		
			
			sendNotification(
				GBNotifications.LOGGER_INITIALIZED, 
				_loader.getContent(Cores.SHELL), 
				LoggerTypes.XRAY
			);
		}
	}
}