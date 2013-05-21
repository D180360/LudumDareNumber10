package  
{
	import org.flixel.FlxSprite;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Dan
	 */
	
	 
	 
	public class Meteor extends FlxSprite 
	{
		
		[Embed(source = "meteor1.png")]public static const meteorPNG:Class;
		protected var randposition:Number;
		protected var randangle:Number;
		protected var randvelocity:Number;
	    
		
		
		public function Meteor(X:Number, Y:Number) 
		{
			
			super(X, Y);
			super.velocity.y = randomRange(200, 200);
			super.velocity.x = randomRange(80, -80);	
			super.angle = randomRange(120, 40);
			randvelocity = randomRange(200, 200);
		    randposition = randomRange(315, 1);
			randangle = randomRange(30, -30);
			
			
			loadGraphic(meteorPNG, true, true, 37, 40);
			addAnimation("act", [0, 1, 2, 3], 20, true);
			
			width = 25;
			height = 30;
			
			
		
			
		    
			
		}
		
		
		
		
		
		public override function update():void {
			
			super.update();
			
			visible = true;
			play("act");
			
			
			
			
			
			if(this.y > 259){
			
			
			kill();
			
			
			
			
			}
		
		
	
		}
				public function randomRange(max:Number, min:Number = 0):Number
					{
										return Math.random() * (max - min) + min;
						}
						
			
			
		
		
		
		
	}

}