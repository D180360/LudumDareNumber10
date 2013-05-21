package 
{
	import org.flixel.FlxGame;
	import org.flixel.*;
	import mochi.as3.MochiServices;
	import mochi.as3.*;

	import flash.events.Event;
	[SWF(width = "480", height = "360", backgroundColor = "0x000000")]
	[Frame(factoryClass="Preloader")]
	/**
	 * ...
	 * @author Dan
	 */
	dynamic public class Main extends FlxGame
	{
		
		public function Main():void 
		{
		super(320, 240, Intro, 1.5, 60, 60);
		addEventListener(Event.ADDED_TO_STAGE, init);
		
		forceDebugger = true;
		
		}
		
		
		private function init(e:Event):void {
			
			MochiServices.connect( "0e1abab0824173db", this.parent );
            	}

		
		
	}
}
