package com.gb.logging 
{	
	import com.blitzagency.xray.logger.XrayLogger;
	
	import org.as3commons.logging.impl.AbstractLogger;
	import org.as3commons.logging.LogLevel;
	
	/**
	 * Adapts <code>XrayLogger</code> for use with the logging framework.
	 */
	public class XrayLoggerAdapter extends AbstractLogger
	{
		private var _level:int;
				
		public function XrayLoggerAdapter(name:String = null) 
		{
			super(name);
		}
		
		// XRay log method signature
		// public function log(message:String, caller:String, classPackage:String, level:Number, dump:Object=null):void 		
		override protected function log(level:uint, message:String, params:Array):void 
		{
			if (level >= this._level) 
			{
				// add datetime
				message = (new Date()).toString() + " \n" + LogLevel.toString(level) + " - " + message;	
				// empty string for classPackage parameter as the fully qualified class is stored in name property
				XrayLogger.getInstance().log(message, name, " ", level, params);			
				trace(name + "\n" + message);
			}
		}		
		
		public function set level(value:int):void 
		{
			_level = value;
		}		
		
		/**
		 * @inheritDoc
		 */
		override public function get debugEnabled():Boolean 
		{
			return (_level <= LogLevel.DEBUG);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get infoEnabled():Boolean 
		{
			return (_level <= LogLevel.INFO);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get warnEnabled():Boolean 
		{
			return (_level <= LogLevel.WARN);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get errorEnabled():Boolean 
		{
			return (_level <= LogLevel.ERROR);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get fatalEnabled():Boolean 
		{
			return (_level <= LogLevel.FATAL);
		}

	}
}