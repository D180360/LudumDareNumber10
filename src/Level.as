package  
{
	import org.flixel.FlxTilemap;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	import org.flixel.plugin.photonstorm.FlxScrollingText;
	import org.flixel.FlxText;
	import org.flixel.*;
	
	
	
	
	
	/**
	 * ...
	 * @author Dan
	 */
	public class Level extends FlxGroup {
		
		public var ground:FlxTilemap;
		public var backdrop:FlxTilemap;
		public var backdropv2:FlxTilemap;
		public var groundv2:FlxTilemap;
		public var sky:FlxBackdrop;
		public var skyv2:FlxBackdrop;
		public var insanefire:FlxSprite;
		public var scrol:FlxScrollingText;
		public var asdf:FlxTileblock;

		public var black:FlxSprite;
		public var start:FlxText;
		public const accel:int = -1;
		
		public var width:int;
		public var height:int;

		
		
		public var backg:FlxBackdrop;
		
		public function Level() {
			
			super();
		
			ground = new FlxTilemap;
			backdrop = new FlxTilemap;
			backdropv2 = new FlxTilemap;
			groundv2 = new FlxTilemap;
			
			sky = new FlxBackdrop(skyPNG, 1, 1, true, true);
			
			skyv2 = new FlxBackdrop(skyv2PNG, 1, 1, true, true);
			
			
			black = new FlxSprite(0, 0, blackshitPNG);
			
			
			black.alpha = 0.5;
			
			
			black.visible = false;
			
			insanefire = new FlxSprite;
			
			insanefire.loadGraphic(insanefirePNG, true, true, 320, 240);
			
			
			insanefire.addAnimation("enable", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11], 16, true);
			
			
			insanefire.y = 30;
			
			insanefire.play("enable");
			
			
			insanefire.visible = false;
			
		 
			backdrop.loadMap(new backdropCSV, backdropPNG, 64, 64);
			backdrop.setTileProperties(1, FlxObject.NONE);
			
			backdropv2.loadMap(new backdropCSV, backdropv2PNG, 64, 64);
			backdropv2.setTileProperties(1, FlxObject.NONE);
			
			ground.loadMap(new groundCSV, groundPNG, 64, 64)
			ground.setTileProperties(1, FlxObject.NONE);
		
			
			groundv2.loadMap(new groundCSV, groundv2PNG, 64, 64)
			groundv2.setTileProperties(1, FlxObject.NONE);
			
			
			
			ground.y = 50;
			groundv2.y = 50;
			width = backdrop.width;
			height = backdrop.height;
		
			asdf = new FlxTileblock(0, 178, 320, 50);
			
			asdf.makeGraphic(320, 80, 0xff000000);
			
			
			insanefire.alpha = .6;
			
			
			
			
			add(sky);
			add(skyv2);
			add(black);
			add(insanefire);
			add(asdf);
			
			add(backdrop);
			
			add(backdropv2);
			add(ground);
			add(groundv2);
			
			
			
			
			
		}
		
		
		
		
			
			
			
			
		}
		
		
		
		
	
		
		
		
		
		
	}
	