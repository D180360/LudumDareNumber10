package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Intro extends FlxState 
	{
	 
	 
	 public var counter:Number = 0;
	 public var Intro1:FlxSprite;
	 public var Intro3:FlxSprite;
		
		public function Intro() 
		{
			Intro1 = new FlxSprite(0, 0, Intro1PNG);

			Intro3 = new FlxSprite(0, 0, Intro3PNG);
			Intro3.alpha = 0;
			
			
			add(Intro1);
			add(Intro3);
		}
		
			public override function update():void {
			
			super.update();
			
			if (FlxG.keys.justPressed("SPACE")) {
				
				FlxG.play(SkipMP3);
				FlxG.fade(0xff000000, 1, change);
			}
			
			counter += FlxG.elapsed;
				
			if (counter > 1 && counter < 5) Intro3.alpha += 0.01;
	   		if (counter > 5) FlxG.fade(0xff000000, 1, change);
		}
		
		private function change():void {
			
			FlxG.switchState(new PlayState);
			
		}
		
		
		
	}

}
