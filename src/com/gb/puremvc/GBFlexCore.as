package com.gb.puremvc 
{
	import com.gb.puremvc.interfaces.*;
	import com.lassie.lib.IMediaLibrary;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.StyleSheet;
	
	import mx.modules.ModuleBase;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	/**
	 * Base class for cores in an GBPureMVC application. 
	 */
	public class GBFlexCore extends GBCore implements ICore
	{
		
		/**
		 * Constructor.
		 */
		public function GBFlexCore(key:String = null, data:* = null)
		{
			_key = key;
			_data = data;
		}
	}
}