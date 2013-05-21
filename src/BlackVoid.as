package  
{
	import org.flixel.*;
	public class BlackVoid extends FlxState
	{
		
		public var counter:Number = 0;
		public var status:FlxText = null;
		
		
		public function BlackVoid() 
		{
			FlxG.playMusic(Assets.song2, 1);
			darkInit();
			textInit();
		}
		
		
		
		private function changeState():void
		{
			this.kill();
			FlxG.switchState(new PlayState1);
		}
		
		private function textInit():void
		{
			status = new FlxText(50,50, 100);
			status.alignment = "left";
			status.size = 10;
			status.text = "...";
			status.velocity.x = 9;
			
			add(status);
		}
		
		private function darkInit():void
		{
			var black:FlxSprite = new FlxSprite();
			black.makeGraphic(320, 240, 0xff000000);
			black.alpha = 1;
			black.visible = true;
			
			add(black);
		}
			
		public override function update():void
		{
			super.update();
		
			if (FlxG.keys.justPressed("SPACE")) 
			{
				
				FlxG.play(Assets.SkipMP3);
				FlxG.flash(0xffffffff, 0.75);
               		        FlxG.fade(0xff000000, 2, changeState);	
				FlxG.music.stop();
				FlxG.music.kill();
			}
			
			
			counter += FlxG.elapsed;
			
			black.alpha -= .01;
			
			
			if (counter > 4 && counter < 8)
			{
				status.x = 60;
			        status.x += 10;
				status.color = 0xFF0000;
				status.alignment = "center";
				status.text = "            ..I have arrived for you....";
				
				black.alpha += .005;
				
			}
			if (counter > 8 && counter < 12)
			{
				black.alpha -= .005;
				status.x = 50;
				status.velocity.x -= 10;
				status.color = 0xffffffff;
				status.alignment = "right";
				status.text = "..What's going on?...";
				
				
			}
			if (counter > 12 && counter < 13)
			{
				black.alpha += .01;
				status.x = 60;
			        status.velocity.x += 10;
				status.color = 0xFF0000;
				status.text = "...Prepare..";
				status.alignment = "left"
				
			}
			if (counter > 13 && counter < 14)
			{
				black.alpha -= 1;
				status.x = 50;
				status.velocity.x = -10;
				status.color = 0xffffffff;
				status.text = "..huh!?..";
				status.alignment = "right"
			}
			if (counter > 14 && counter < 15)
			{
				status.x = 40;
				status.text = "!!!";
				status.alignment = "center"
			}
			if (counter > 15 && counter < 18)
			{   
				FlxG.music.stop();
				FlxG.music.kill();
			    FlxG.play(expo3,0.6);
				FlxG.shake(0.03, 3);
			
			}
			
			if (counter > 18)
			{
				
				FlxG.flash(0xffffffff, 0.75);
               		        FlxG.fade(0xff000000, 2, changeState);
				
			}
		}
		
			
		
		
		
		
	}

}
