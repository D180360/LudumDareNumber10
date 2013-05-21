package org.flixel 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	
	
	public class FlxFadeText extends FlxText
	{
		
		private var dieTimer:Timer;
		
		public function FlxFadeText(x:Number,y:Number,width:uint,text:String) 
		{
			super(x, y, width, text);
			//add text to the current state
			this.scrollFactor.x = 0;
			this.scrollFactor.y = 0;
			FlxG.state.add(this);
		}
		
		
		
		public function fadeAndDie() {
			//fade the text
			dieTimer = new Timer(700, 3);
			dieTimer.addEventListener(TimerEvent.TIMER, fadeText);
			dieTimer.addEventListener(TimerEvent.TIMER_COMPLETE, dieText);
			dieTimer.start();
		}
		
		private function dieText(e:TimerEvent):void 
		{
			dieTimer.removeEventListener(TimerEvent.TIMER, fadeText);
			dieTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, dieText);	
			FlxG.state.defaultGroup.remove(this);
		}
		
		private function fadeText(e:Event):void 
		{
			this.alpha = this.alpha -.3;
		}
		
		
	}

}