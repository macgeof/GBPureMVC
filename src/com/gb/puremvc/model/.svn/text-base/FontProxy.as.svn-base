package com.gb.puremvc.model 
{
	import com.gb.puremvc.model.vo.StartupResourceVO;
	
	import flash.text.Font;
	
	import org.as3commons.logging.LoggerFactory;

	/**
	 * Loads the supplied font SWF paths. 
	 * <p>
	 * Font registration with the parent application is handled within the 
	 * individual font SWFs.</p>
	 */
	public class FontProxy extends AbstractLoaderProxy
	{
		public static const NAME:String = "FontProxy";
		
		/**
		 * Constructor.
		 */
		public function FontProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			logger = LoggerFactory.getClassLogger(FontProxy);
		}

		override protected function onLoad():void 
		{
			super.onLoad();
			
			// output available embedded fonts
			logger.info("Embedded fonts: " + getEmbeddedFontNames());
		}
		
		/**
		 * Returns a list of embedded font names.
		 * <p>
		 * Since embedded Font lookup is handled internally by 
		 * com.GB.components.GBTextField, this method probably 
		 * need never be used other than for debug purposes.</p>
		 * 
		 * @return	the list of embedded font names
		 */
		public function getEmbeddedFontNames():Array
		{
			var embeddedFonts:Array = Font.enumerateFonts(false);
			var tmp:Array = [];
			
			for (var i:int = 0; i < embeddedFonts.length; i ++) 
				tmp.push(embeddedFonts[i].fontName);

			return tmp;
		}

		/**
		 * Returns <code>true</code> if font of supplied name is embedded.
		 * <p>
		 * Since embedded Font lookup is handled internally by 
		 * <code>com.GB.components.GBTextField</code>, this method 
		 * probably need never be used.</p>
		 * 
		 * @param	name	the font name
		 * @return	<code>true</code> if font is embedded
		 */
		public function isFontEmbedded(name:String):Boolean
		{
			var embeddedFonts:Array = Font.enumerateFonts(false);
			
			for (var i:int = 0; i < embeddedFonts.length; i ++) 
				if (name == embeddedFonts[i].fontName) return true;
			
			return false;
		}
	}
}