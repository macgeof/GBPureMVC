package com.gb.puremvc.view.components 
{
	import flash.display.Sprite;
	import flash.text.*;
	
	/**
	 * Basic error reporting component for the GBPureMVC framework. 
	 */
	public class ErrorReport extends Sprite
	{
		private var output:TextField;
		
		/**
		 * Constructor.
		 */
		public function ErrorReport(width:Number = 400, height:Number = 150) 
		{
			graphics.beginFill(0xffffff, 1);
			graphics.lineStyle(1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			output = new TextField();
			//output.autoSize = TextFieldAutoSize.LEFT;
			output.width = width;
			output.height = height;
			//output.border = true;
			output.multiline = true;
			output.defaultTextFormat = new TextFormat("Verdana", 10);
			addChild(output);
		}
		
		public function setText(value:String):void
		{
			output.text = value;
		}
		
		public function appendText(value:String):void
		{
			output.appendText(value);
			output.scrollV = 0;
		}
	}
	
}