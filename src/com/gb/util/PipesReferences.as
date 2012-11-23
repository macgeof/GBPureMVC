package com.gb.util
{
	import com.gb.puremvc.pipes.PipeAwareCoreConstants;
	
	import org.puremvc.as3.multicore.utilities.pipes.interfaces.*;
	import org.puremvc.as3.multicore.utilities.pipes.messages.*;
	import org.puremvc.as3.multicore.utilities.pipes.plumbing.*;

	public class PipesReferences
	{
		public function PipesReferences()
		{
			//interfaces
			IPipeAware;
			IPipeFitting;
			IPipeMessage;
			//messages
			FilterControlMessage;
			Message;
			QueueControlMessage;
			//plumbing
			PipeAwareCoreConstants;
			Filter;
			Junction;
			JunctionMediator;
			Pipe;
			PipeListener;
			Queue;
			TeeMerge;
			TeeSplit;
		}
	}
}