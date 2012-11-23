/*
	AirLogger V1.0.1
	@author: Sidney de Koninig, 2008

	Make sure you have the correct File.path.
	You can change this bwelow if you like, depending on your project needs
	var appDir:File 		= File.applicationDirectory;
	var appStoreDir:File 	= File.applicationStorageDirectory;
	var desktopDir:File 	= File.desktopDirectory;
	var docDir:File 		= File.documentsDirectory;
	var userDir:File 		= File.userDirectory;
	var rootDirArr:Array 	= File.getRootDirectories();
	
	TODO: Confine to application sandbox, now i have r/w access to everything. 
	(Even to directories that i have no right to)
	
	Altered by Neil Brown / Ian Watson 10.12.09
*/

package com.gb.logging
{
	
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.filesystem.File;
	
	/**
	 * AIR Logger.
	 */
	public class AIRLogger {	
		
		private static const LOG:String = "Log: ";
		private static const DEBUG:String = "Debug: ";
		private static const WARN:String = "Warn: ";
		private static const ERROR:String = "Error: ";
		
		private static var _file		:File;
		private static var _fileStream 	:FileStream;
		private static var _fileName	:String;
		private static var _version		:String = "1.0.0";
		
		/**
		 * Class initialisation method. 
		 * 
		 * @param	fileName	the file name to write to
		 * @param 	filePath	the file path to write to
		 * @param 	emptyLog	<code>true</code> if the log file should be cleared first
		 * 
		 */		
		public static function init(fileName:String = "log.txt", filePath:File = null, emptyLog:Boolean = true):void
		{
			filePath = filePath || File.desktopDirectory;

			AIRLogger._fileName		=	fileName;
			AIRLogger._file			= 	filePath.resolvePath( AIRLogger._fileName );
			AIRLogger._fileStream	= 	new FileStream();
			
			if(emptyLog && AIRLogger._file.exists)
			{
				AIRLogger.clearLog();
			} 
			AIRLogger._fileStream.open( AIRLogger._file, FileMode.APPEND );
			AIRLogger.log("AIRLogger, version " + AIRLogger.getVersion());
		}
		
		/**
		 * Closes the <code>FileStream</code> to the log file.
		 */
		public static function close():void
		{
			AIRLogger._fileStream.close();
		}
		
		/**
		 * Writes to the log.
		 * 
		 * @param 	s 	the <code>String</code> to write to the log.
		 */
		public static function log (s:String ):void
		{
			if (s == null){
				s = "";
			}

			AIRLogger._fileStream.writeUTFBytes(AIRLogger.LOG + s.toString() + File.lineEnding);
		}
		
		/**
		 * Writes debug statement to the log.
		 * 
		 * @param 	s 	the <code>String</code> to write to the log.
		 */
		public static function debug (s:String ):void
		{
			if (s == null){
				s = "";
			}
			
			AIRLogger._fileStream.writeUTFBytes(DEBUG + s.toString() + File.lineEnding);
		}
		
		/**
		 * Writes warn statement to the log.
		 * 
		 * @param 	s 	the <code>String</code> to write to the log.
		 */
		public static function warn (s:String ):void
		{
			if (s == null){
				s = "";
			}
			
			AIRLogger._fileStream.writeUTFBytes(WARN + s.toString() + File.lineEnding);
		}
		
		/**
		 * Writes error statement to the log.
		 * 
		 * @param 	s 	the <code>String</code> to write to the log.
		 */
		public static function error (s:String ):void
		{
			if (s == null){
				s = "";
			}
			
			AIRLogger._fileStream.writeUTFBytes(ERROR + s.toString() + File.lineEnding);
		}
		
		/**
		 * Clears the log.
		 */
		public static function clearLog():void
		{
			AIRLogger._fileStream.open( AIRLogger._file, FileMode.WRITE );
			AIRLogger._fileStream.writeUTFBytes("");
			AIRLogger._fileStream.close();
		}
		
		/**
		 * Inserts new line in log.
		 */
		public static function newLine():void
		{
			AIRLogger.log(File.lineEnding);
		} 
		
		/**
		 * Returns the version number of this class.
		 * 
		 * @return	the version number of this class
		 */
		public static function getVersion():String
		{
			return _version;
		}		
	}
}