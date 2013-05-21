package  
{
	import flash.external.ExternalInterface;
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Dan
	 */
	public class PlayState extends FlxState 
	{
		public var part:FlxSprite;
		public var level:Level;
		public var start:FlxText;
		public var full:Boolean = false;
		public var sun:FlxSprite;
		public var cloud:FlxSprite;
		public var title:FlxSprite;
		public var car:FlxSprite;
		private var whitePixel:FlxParticle;
		private var counter:Number = 0;
		public var meteorz:FlxSprite;
		public var tempEmitter:FlxEmitter;
		[Embed(source = "Explosion.png")]public static const exPNG:Class;
		[Embed(source = "cloud.png")]public static const cloudPNG:Class;
		[Embed(source = "title1.png")]public static const titlePNG:Class;
		[Embed(source = "sun.png")]public static const sunPNG:Class;
		[Embed(source = "car.png")]public static const carPNG:Class;
		[Embed(source = "Meteors!.png")]public static const MeteorzPNG:Class;
		[Embed(source = "expo.mp3")]public static const ExplosionMP3:Class;
		[Embed(source = "skip.mp3")]public static const SkipMP3:Class;
		[Embed(source = "song1.mp3")]public static const SongIntroMP3:Class;
		public var ssss:FlxSprite;
		
		
		public function PlayState() 
		
	{
		
		
		
		ssss = new FlxSprite;
		  
		  
		  
		  ssss.makeGraphic(320, 240, 0xff000000);
		  
		  
		  ssss.alpha = 1;
		
		
	        
		    
		
		
		
		    meteorz = new FlxSprite;
			
			
			meteorz.loadGraphic(MeteorzPNG, true, true, 320, 240);
			
			meteorz.addAnimation("move", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 24, true);
		
		
		    level = new Level();
			
			start = new FlxText((FlxG.width / 2 - 200), 200, 400);
			start.alignment = "center";
			start.size = 8;
			start.text = "   -PRESS SPACE TO START-";
			start.flicker( -2);
			
			
			FlxG.playMusic(SongIntroMP3, 1);
			
			
			level.backdropv2.visible = true;
			
			level.groundv2.visible = true;
			
			level.skyv2.visible = false;
			
			level.asdf.visible = false;
			
			
			
			start.visible = false;
			
			tempEmitter = new FlxEmitter(150, -5, 800);
			tempEmitter.setRotation(90, 180);
			tempEmitter.setXSpeed(-200, 200);
			tempEmitter.setYSpeed( -50 , 50 );
			tempEmitter.gravity = 200;
			tempEmitter.bounce = 1;
			
			
			
			
			for (var i:int = 0; i < tempEmitter.maxSize/2; i++) {
			whitePixel = new FlxParticle();
			whitePixel.loadGraphic(exPNG, false, true, 2, 2);
			whitePixel.visible = false; //Make sure the particle doesn't show up at (0, 0)
			tempEmitter.add(whitePixel);
			whitePixel = new FlxParticle();
			
			whitePixel.loadGraphic(exPNG, false, true, 2, 2);
			whitePixel.visible = false;
			tempEmitter.add(whitePixel);
			
		}; // the sprite that this emitter emits.
			
			
		
			
			
			
			
			
			
			
			
			
			
			

			start.shadow = 0xff000000;
			
			
			cloud = new FlxSprite(50, 20, cloudPNG);
			
			car = new FlxSprite( -64, 180, carPNG);
			
			car.velocity.x = 300;
			
			meteorz.alpha = 0;
			
			cloud.velocity.x = 3;
			
			sun = new FlxSprite(256, 0, sunPNG);
			
			
			
			sun.loadGraphic(sunPNG, true, true, 64, 64, false);
			
			
			sun.addAnimation("roll", [0, 1, 2, 3, 4], 30, true);
			
			sun.play("roll");
			
			title = new FlxSprite(50, 50, titlePNG);
			
			title.visible = false;
			
			
			add(level);
			add(tempEmitter);
			add(cloud);
			add(sun);
			add(car);
		
			add(title);
			add(start);
		    add(meteorz);
			add(ssss);
		}
		
		
		
		override public function update():void
		{
			super.update();
			
			
			if (FlxG.keys.justPressed("SPACE") ) {
				
			    FlxG.music.stop();
				FlxG.music.kill();
				FlxG.play(SkipMP3);
                FlxG.fade(0xff000000, 2, changeState);
				
				
	}
	
	
	
	
		counter += FlxG.elapsed;
		
		ssss.alpha -= 0.03;
		
		if (counter > 5.1 && counter < 5.15) {
			
			FlxG.play(ExplosionMP3);
		}
		
		if (counter > 5 && counter < 7)
			{
				
				FlxG.flash(0xffaa1111, 2);
				FlxG.shake(0.05, 1);
				level.backdropv2.visible = false;
				level.groundv2.visible = false;
				
				level.black.visible = true;
				
				cloud.visible = false;
				title.visible = true;
				sun.visible = false;
				car.kill();
				level.skyv2.visible = true;
				
				level.skyv2.velocity.x = 500 * FlxG.elapsed;
			
				level.skyv2.y += 20;
				
				start.visible = true;
				level.asdf.visible = true;
				tempEmitter.start(false, 1.1, .005);
				
				
				level.insanefire.visible = true;
				
				
				meteorz.play("move");
				
					
			if (full && meteorz.alpha >= .9) {
				
				meteorz.alpha -= FlxG.elapsed;
				
				
			}
				
				if (!full) {
					
					meteorz.alpha += FlxG.elapsed;
					if (meteorz.alpha > .8) {
						
						full = true;
						
					}
					
				}
					
					
					
					
				
				
				
				
				
			
			
				
				
				
			}
	
		
			
			
			
			
			
				
			
			
			
			
			
			
			
		
		}
		
		
		
		
		
		
			private function changeState():void
		{
			
			this.kill();
			FlxG.switchState(new BlackVoid);
			
		}
		
		
		
		
		
		
	}

}