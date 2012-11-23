package com.gb.puremvc.model 
{	
	import com.gb.puremvc.model.vo.StartupResourceVO;
	import com.lassie.lib.IMediaLibrary;
	
	import org.as3commons.logging.LoggerFactory;

	/**
	 * Loads supplied library paths and adds them by key to the <code>ServiceLocator</code>. 
	 * <p>
	 * Use of this <code>Proxy</code> requires that source SWFs are compiled against the 
	 * <code>IMediaLibrary</code> interface.</p> 
	 */
	public class LibraryProxy extends AbstractLoaderProxy
	{
		public static const NAME:String = "LibraryProxy";
		
		/**
		 * Constructor.
		 */
		public function LibraryProxy(proxyName:String = null, data:Object = null) 
		{
			super(proxyName, data);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			logger = LoggerFactory.getClassLogger(LibraryProxy);
		}

		override protected function onLoad():void
		{
			super.onLoad();
			
			var resource:StartupResourceVO;
			var items:Array = _loader.items;
			
			// Populate the ServiceLocator with parsed IMediaLibrary instances. 
			for (var i:int = 0; i < resources.length; i ++)
			{
				resource = StartupResourceVO(resources[i]);
				serviceLocator.addLibrary(IMediaLibrary(
					_loader.get(resource.src).content), resource.props.id);
			}
		}
	}
}