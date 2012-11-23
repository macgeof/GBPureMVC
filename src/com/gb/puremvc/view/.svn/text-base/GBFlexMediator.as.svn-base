package com.gb.puremvc.view
{
	import com.gb.model.enum.LoggerTypes;
	import com.gb.puremvc.model.enum.GBNotifications;
	
	import flash.display.DisplayObject;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	
	import spark.components.Application;
	
	/**
	 * Base class for root (Application) <code>Mediator</code> in Flex builds. 
	 * <p>
	 * Adds error reporting to the core functionality offered by 
	 * <code>GBMediator</code>.</p>
	 * <p>
	 * Seperate base classes are required because of the difference in the way
	 * Flex handles the addition of children to the <code>Stage</code>.</p> 
	 */
    public class GBFlexMediator extends GBMediator implements IMediator
    {	
        /**
         * Constructor. 
         */
        public function GBFlexMediator(mediatorName:String = null, viewComponent:Object = null) 
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
					if (note.getName() == LoggerTypes.XRAY)
					{
						var xrayComponent:UIComponent = new UIComponent();
						xrayComponent.addChild(note.getBody() as DisplayObject);
						document.addElement(xrayComponent);
					}
					
                    break;
				}
				case GBNotifications.ERROR_INITIALIZED:
				{
					var errorReport:DisplayObject = DisplayObject(note.getBody());
					
					var errorContainer:UIComponent = new UIComponent();
					errorContainer.addChild(errorReport);
					document.addElement(errorContainer);	
					
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
		 * @return 	document 	the viewComponent (document class) cast to 
		 * 						<code>Application</code>
		 */
		protected function get document():Application
		{
			return viewComponent as Application;
		}
    }
}