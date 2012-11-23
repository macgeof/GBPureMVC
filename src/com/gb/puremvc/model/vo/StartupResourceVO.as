package com.gb.puremvc.model.vo
{
	import com.gb.model.vo.AbstractVO;
	
	public class StartupResourceVO extends AbstractVO
	{
		public var src:String;
		public var props:Object;
		
		public function StartupResourceVO(src:String = null, props:Object = null)
		{
			super();
			
			this.src = src;
			this.props = props
		}
		
		override public function toString():String
		{
			return super.toString() +
				" src: " + this.src + 
				" props: " + this.props;
		}
	}
}