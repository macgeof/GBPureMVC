package com.gb.puremvc.model.vo
{
	import com.gb.model.vo.AbstractVO;
	
	import org.puremvc.as3.multicore.utilities.loadup.interfaces.ILoadupProxy;
	
	
	public class StartupMonitorVO extends AbstractVO
	{
		public var proxies:Vector.<ILoadupProxy>;
		public var listOpen:Boolean;
		public var expectedResources:int;
		
		public function StartupMonitorVO(
			proxies:Vector.<ILoadupProxy> = null, 
			listOpen:Boolean = false,
			expectedResources:int = 10)
		{
			super();
			
			this.proxies = proxies;
			this.listOpen = listOpen;
			this.expectedResources = expectedResources;
		}
		
		override public function toString():String
		{
			return super.toString()
				+ " proxies: " + proxies
				+ " listOpen: " + listOpen
				+ " expectedResources " + expectedResources;	
		}
	}
}