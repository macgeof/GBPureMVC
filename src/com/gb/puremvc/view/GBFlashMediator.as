package com.gb.puremvc.view
{
	import com.gb.model.enum.LoggerTypes;
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import flash.display.*;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	/**
	 * Base class for root (Application) <code>Mediator</code> in Flash builds. 
	 * <p>
	 * Adds error reporting to the core functionality offered by 
	 * <code>GBMediator</code>.</p>
	 * <p>
	 * Seperate base classes are required because of the difference in the way
	 * Flex handles the addition of children to the <code>Stage</code>.</p> 
	 */
    public class GBFlashMediator extends GBMediator
    {	
        /**
         * Constructor. 
         */
        public function GBFlashMediator(mediatorName:String = null, viewComponent:Object = null) 
        {
            // pass the viewComponent to the superclass where 
            // it will be stored in the inherited viewComponent property
            super(mediatorName, viewComponent);
        }	
		
		/**
		 * Handle all notifications this Mediator is interested in.
		 * <P>
		 * Called by the framework when a notification is sent that
		 * this mediator expressed an interest in when registered
		 * (see <code>listNotificationInterests</code>.</P>
		 * 
		 * @param INotification a notification 
		 */
		override public function handleNotification( note:INotification ):void 
		{
			super.handleNotification(note);
			
			switch ( note.getName() )
			{
				case GBNotifications.LOGGER_INITIALIZED:
				{
					// XRAY needs to be added to the stage to work.
					if (note.getType() == LoggerTypes.XRAY)
						document.addChild(DisplayObject(note.getBody()));						
					
					break;
				}
				case GBNotifications.ERROR_INITIALIZED:
				{
					var errorReport:DisplayObject = DisplayObject(note.getBody());
					document.addChild(errorReport);
					break;	
				}
			}
		}	
		
		/**
		 * Cast the viewComponent to its actual type.
		 * 
		 * <P>
		 * This is a useful idiom for mediators. The
		 * PureMVC Mediator class defines a viewComponent
		 * property of type Object. </P>
		 * 
		 * <P>
		 * Here, we cast the generic viewComponent to 
		 * its actual type in a protected mode. This 
		 * retains encapsulation, while allowing the instance
		 * (and subclassed instance) access to a 
		 * strongly typed reference with a meaningful
		 * name.</P>
		 * 
		 * @return	document	the viewComponent (document class) cast to 
		 * 						<code>Sprite</code>
		 */
		protected function get document():Sprite
		{
			return viewComponent as Sprite;
		}
    }
}