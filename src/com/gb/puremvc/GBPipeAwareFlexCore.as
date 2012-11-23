/*
 PureMVC AS3 MultiCore Demo – Flex PipeWorks 
 Copyright (c) 2008 Cliff Hall <cliff.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.gb.puremvc
{
	
	import com.gb.puremvc.interfaces.ICoreFacade;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeAware;
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.IPipeFitting;
	import org.puremvc.as3.multicore.utilities.pipes.plumbing.JunctionMediator;

	public class GBPipeAwareFlexCore extends GBFlexCore implements IPipeAware
	{
		
		/**
		 * Standard output pipe name constant.
		 */
		public static const STDOUT:String 				= 'standardOutput';
		
		/**
		 * Standard input pipe name constant.
		 */
		public static const STDIN:String 				= 'standardInput';
		
		/**
		 * Standard log pipe name constant.
		 */
		public static const STDLOG:String 				= 'standardLog';
		
		/**
		 * Standard shell pipe name constant.
		 */
		public static const STDSHELL:String 			= 'standardShell';

		/**
		 * Constructor.
		 * <P>
		 * In subclass, create appropriate facade and pass 
		 * to super.</P>
		 */
		public function GBPipeAwareFlexCore(key:String = null, data:* = null)
		{
			_key = key;
			_data = data;
		}

		/**
		 * Accept an input pipe.
		 * <P>
		 * Registers an input pipe with this module's Junction.
		 */
		public function acceptInputPipe( name:String, pipe:IPipeFitting ):void
		{
			facade.sendNotification( JunctionMediator.ACCEPT_INPUT_PIPE, pipe, name );							
		}
		
		/**
		 * Accept an output pipe.
		 * <P>
		 * Registers an input pipe with this module's Junction.
		 */
		public function acceptOutputPipe( name:String, pipe:IPipeFitting ):void
		{
			facade.sendNotification( JunctionMediator.ACCEPT_OUTPUT_PIPE, pipe, name );							
		}
	}
}