package  
{
	import org.flixel.FlxGroup;
	import org.flixel.*;
	
	
	
	public class Level1 extends FlxGroup 
	{
		
		private var whitePixel:FlxParticle;
		public var level1bd:FlxBackdrop;
		public var level1bd2:FlxBackdrop;
		public var level1nb:FlxSprite;
		public var em:FlxEmitter;
		public var width:int;
		public var height:int;
		public var fireani:FlxSprite;
		public function Level1() 
		{
			
			level1bd = new FlxBackdrop(level1backdropPNG, 3, 3, true, true);
			level1nb = new FlxSprite(0, 0, newbackPNG);
			level1bd2 =  new FlxBackdrop(level1backdropPNG2, 3, 3, true, true);
			fireani = new FlxSprite();
			fireani.loadGraphic(FirePNG, true, true, 30, 30, true);
			fireani.addAnimation("activate", [0, 1, 2, 3, 4], 15, true);
			level1bd2.visible = false;
			fireani.x = 84;
			fireani.y = 126;
			fireani.immovable = true;
			fireani.play("activate");
			level1nb.width = width;
			level1nb.height = height;
			fireani.blend = "screen";
			fireani.angle = 9;
			fireani.allowCollisions = FlxObject.NONE;
			em = new FlxEmitter(150, -30, 800);
			em.setRotation(90, 180);
			em.setXSpeed(-200, 200);
			em.setYSpeed( -50 , 50 );
			em.gravity = 200;
			
			for (var i:int = 0; i < em.maxSize/2; i++) {
			whitePixel = new FlxParticle();
			whitePixel.allowCollisions = FlxObject.NONE;
			whitePixel.loadGraphic(exPNG, false, true, 5, 5);
			whitePixel.visible = false; //Make sure the particle doesn't show up at (0, 0)
			em.add(whitePixel);
			whitePixel = new FlxParticle();
			whitePixel.allowCollisions = FlxObject.NONE;
			whitePixel.loadGraphic(exPNG2, false, true, 5, 5);
			whitePixel.visible = false;
			em.add(whitePixel);
			whitePixel = new FlxParticle();
			whitePixel.allowCollisions = FlxObject.NONE;
			whitePixel.loadGraphic(exPNG3, false, true, 5, 5);
			whitePixel.blend = "screen";
			whitePixel.visible = false;
			em.add(whitePixel);
			
		};
			add(level1bd);
			add(level1bd2);
			add(em);
			add(level1nb);
			add(fireani);
			
		}
		
	}

}