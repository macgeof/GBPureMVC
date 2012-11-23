package com.gb.puremvc.view
{
	import com.gb.model.enum.LoggerTypes;
	import com.gb.puremvc.model.enum.GBNotifications;
	import com.gb.puremvc.patterns.GBFacade;
	import com.gb.puremvc.view.components.ErrorReport;
	
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.*;
	
	import org.as3commons.logging.LoggerFactory;
	import org.puremvc.as3.multicore.interfaces.*;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.utilities.loadup.controller.FailureInfo;
	import org.puremvc.as3.multicore.utilities.loadup.model.LoadupMonitorProxy;
	
	/**
	 * Abstracts startup progress reporting, set up of context menu, and set up of 
	 * framework error reporting shared by <code>GBFlashMediator</code> and 
	 * <code>GBFlexMediator</code>.
	 */
    public class GBMediator extends AbstractMediator
    {	
        /**
         * Constructor. 
         */
        public function GBMediator(mediatorName:String = null, viewComponent:Object = null) 
        {
            // pass the viewComponent to the superclass where 
            // it will be stored in the inherited viewComponent property
            super(mediatorName, viewComponent);
        }

        /**
         * List all notifications this Mediator is interested in.
         * <P>
         * Automatically called by the framework when the mediator
         * is registered with the view.</P>
         * 
         * @return Array the list of Nofitication names
         */
        override public function listNotificationInterests():Array 
        {
			return  [    
						GBNotifications.STARTUP_STARTED,
						GBNotifications.STARTUP_RESOURCE_LOADING,
						GBNotifications.STARTUP_RESOURCE_LOADED,
						GBNotifications.STARTUP_RESOURCE_FAILED,
						GBNotifications.LOGGER_INITIALIZED,
						GBNotifications.ERROR,
						GBNotifications.ERROR_INITIALIZED,
						LoadupMonitorProxy.LOADING_PROGRESS,
						LoadupMonitorProxy.LOAD_RESOURCE_TIMED_OUT,
						LoadupMonitorProxy.LOADING_COMPLETE,
						LoadupMonitorProxy.LOADING_FINISHED_INCOMPLETE,
						LoadupMonitorProxy.CALL_OUT_OF_SYNC_IGNORED
			        ];
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
				case GBNotifications.STARTUP_STARTED:
				{
					logger.info("Startup started");
					break;
				}
                case GBNotifications.STARTUP_RESOURCE_LOADING:
				{
					//logger.info(note.getBody() + " loading");
                    break;
				}
                case GBNotifications.STARTUP_RESOURCE_LOADED: 
				{
					logger.info(note.getBody() + " loaded");
                    break;
				}
                case GBNotifications.STARTUP_RESOURCE_FAILED: 
				{
					var proxyName:String = (note.getBody() as FailureInfo).proxyName;
					showError(proxyName + " load failed");
                    break;
				}
				case GBNotifications.LOGGER_INITIALIZED:
				{	
					logger.info("GBPureMVC v." + GBFacade.GB_FRAMEWORK_VERSION);		
					logger.info(GBFacade(facade).name + " v." + GBFacade(facade).version);
					break;
				}
				case GBNotifications.ERROR:
				{
					var error:Error = Error(note.getBody());
					showError(error.getStackTrace());
				}
                case LoadupMonitorProxy.CALL_OUT_OF_SYNC_IGNORED:
				{
					logger.info(note.getBody() + " abnormal state, abort");
                    break;
				}
                case LoadupMonitorProxy.LOADING_PROGRESS:
				{
					var perc:Number = note.getBody() as Number;
					logger.info(Math.round(perc) + "% loaded");
                    break;
				}
                case LoadupMonitorProxy.LOADING_COMPLETE:
				{
					logger.info("Loading complete");
                    break;
				}
                case LoadupMonitorProxy.LOADING_FINISHED_INCOMPLETE:
				{
                    logger.error("Loading incomplete");
                    break;
				}
			}
        }	
		
		/**
		 * @inheritDoc
		 */
		override public function onRegister():void 
		{
			super.onRegister();

			logger = LoggerFactory.getClassLogger(GBMediator);
			
			try
			{
				var contextMenu:ContextMenu = new ContextMenu();
				contextMenu.hideBuiltInItems();
				contextMenu.customItems = [new ContextMenuItem(GBFacade(facade).name + " v." 
											+ GBFacade(facade).version, false, false)];
				
				InteractiveObject(viewComponent).contextMenu = contextMenu;
			}
			catch (__error:Error)
			{
				logger.error("View component " + viewComponent + " cannot be cast as InteractiveObject so no context menu will be added");
			}
		}
		
		private function showError(message:String):void
		{
			var errorReport:ErrorReport = new ErrorReport();
			errorReport.x = (DisplayObject(viewComponent).stage.stageWidth - errorReport.width) * 0.5;
			errorReport.y = (DisplayObject(viewComponent).stage.stageHeight - errorReport.height) * 0.5;
			errorReport.appendText(message);
			
			sendNotification(GBNotifications.ERROR_INITIALIZED, errorReport);
		}
    }
}