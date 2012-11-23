package com.gb.puremvc.model 
{	
	import com.gb.puremvc.model.vo.StartupResourceVO;
	
	import flash.text.StyleSheet;
	
	import org.as3commons.logging.LoggerFactory;

	/**
	 * Loads and parses supplied <code>StyleSheet</code> paths.
	 * <p>
	 * Parsed <code>StyleSheets</code> are added by key to 
	 * the <code>ServiceLocator</code></p>.
	 */
	public class StyleSheetProxy extends AbstractLoaderProxy
	{
		public static const NAME:String = "StyleSheetProxy";
			
		/**
		 * Constructor.
		 */
		public function StyleSheetProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			logger = LoggerFactory.getClassLogger(StyleSheetProxy);
		}
		
		override protected function onLoad():void
		{
			super.onLoad();
			
			var resource:StartupResourceVO;
			var items:Array = _loader.items;

			// Populate the ServiceLocator with parsed StyleSheet instances. 
			for (var i:int = 0; i < resources.length; i ++)
			{
				resource = StartupResourceVO(resources[i]);
			
				var styleSheet:StyleSheet = new StyleSheet();
				styleSheet.parseCSS(_loader.get(resource.src).content);
				
				serviceLocator.addStyleSheet(styleSheet, resource.props.id);
			}
		}
	}
}