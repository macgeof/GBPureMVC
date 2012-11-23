package com.gb.logging 
{
	import org.as3commons.logging.ILoggerFactory;
	import org.as3commons.logging.ILogger;
	
	import com.gb.logging.AIRLoggerAdapter;
	
	/**
	 * Factory for <code>AIRLoggerAdapter</code>.
	 */
	public class AIRLoggerFactory implements ILoggerFactory
	{
		/**
		 * @inheritDoc
		 */
		public function getLogger(name:String):ILogger
		{
			return new AIRLoggerAdapter(name);
		}
	}
}