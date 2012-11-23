package com.gb.logging 
{
	import org.as3commons.logging.ILoggerFactory;
	import org.as3commons.logging.ILogger;
	
	import com.gb.logging.XrayLoggerAdapter;
	
	/**
	 * Factory for <code>XrayLoggerAdapter</code>.
	 */
	public class XrayLoggerFactory implements ILoggerFactory
	{
		public function getLogger(name:String):ILogger
		{
			return new XrayLoggerAdapter(name);
		}
	}
}