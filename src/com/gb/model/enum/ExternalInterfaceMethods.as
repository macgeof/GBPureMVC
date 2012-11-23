package com.gb.model.enum
{
	/**
	 * Enumeration of <code>ExternalInterface</code> method constants.
	 * <p>
	 * These need never be accessed directly as the <code>ExternalInterfaceSendCommand</code> 
	 * and <code>ExternalInterfaceProxy</code> classes provide shortcuts for sending and receiving external 
	 * interface data respectively.</p>
	*/
	public class ExternalInterfaceMethods
	{
		public static const JAVASCRIPT_READY:String = "fiJavascriptReady";
		public static const FLASH_READY:String = "fiFlashReady";
		
		public static const JAVASCRIPT_INTERFACE:String = "fiPageComm";
		public static const FLASH_INTERFACE:String = "flashInterface";
	}
}