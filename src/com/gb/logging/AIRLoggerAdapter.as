package com.gb.logging 
{	
	import com.gb.logging.AIRLogger;
	
	import org.as3commons.logging.impl.AbstractLogger;
	import org.as3commons.logging.LogLevel;
	
	/**
	 * Adapts <code>AIRLogger</code> class for use with the logging framework.
	 */
	public class AIRLoggerAdapter extends AbstractLogger
	{
		private var _level:int;
		
		/**
		 * Constructor.
		 * 
		 * @param	name	the logger name
		 */
		public function AIRLoggerAdapter(name:String = null) 
		{
			super(name);
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function log(level:uint, message:String, params:Array):void 
		{
			if (level >= this._level) 
			{
				// add datetime
				message = (new Date()).toString() + " \n" + LogLevel.toString(level) + " - " + message;	
				// empty string for classPackage parameter as the fully qualified class is stored in name property
				AIRLogger.log(message);			
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