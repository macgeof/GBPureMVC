package com.gb.puremvc.controller
{
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	
	public class StartupMonitorConfigureCommand extends MacroCommand
	{
		override protected function initializeMacroCommand():void
		{
			addSubCommand(StartupMonitorRegisterCommand);
			addSubCommand(StartupMonitorAddResourcesCommand);
			addSubCommand(StartupMonitorLoadCommand);
		}
	}
}