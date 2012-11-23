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
	public class GBFlexCore extends ModuleBase implements ICore
	{		
		protected var facade:ICoreFacade;			
		
		protected var _key:String;
		protected var __parent:DisplayObject;	
		protected var _data:*;
		
		/**
		 * Constructor.
		 */
		public function GBFlexCore(key:String = null, data:* = null)
		{
			_key = key;
			_data = data;
		}
		
		/**
		 * @inheritDoc
		 */
		public function startup():void
		{
			throw new Error("Please instantiate and start a concrete Facade in the subclass");
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			facade.destroy();
			Facade.removeCore(key);
		}

		/**
		 * @inheritDoc
		 */
		public function get coreMediator():Class
		{
			throw new Error("Please define a concrete CoreMediator class in the subclass");
		}
		
		/**
		 * @inheritDoc
		 */
		public function get coreProxy():Class
		{
			throw new Error("Please define a concrete CoreProxy class in the subclass");
		}
		
		public function get key():String { return _key; }
		
		public function set key(value:String):void 
		{
			_key = value;
		}
		
		public function get _parent():DisplayObject { return __parent; }

		public function set _parent(value:DisplayObject):void
		{
			__parent = value;
		}

		public function get data():* { return _data; }
		
		public function set data(value:*):void
		{
			_data = value;
		}		
	}
}