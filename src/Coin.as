package  
{
	import org.flixel.FlxSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Dan
	 */
	public class Coin extends FlxSprite 
	{
		[Embed(source = "coin1.png")]public static const Coins:Class;
		
		
		
		
		public function Coin(X:Number, Y:Number) 
		{
			super(X, Y);
		
			
			
			super.velocity.y = randomRange(200, 200);
			super.velocity.x = randomRange(80, -80);
			loadGraphic(Coins, false, false, 20, 20);
		    addAnimation("rot", [1, 2, 3, 4, 5, 6, 7, 8, 9], 20, true);
			super.angle = randomRange(120, 40);
			play("rot");
			
		}
		
		
		
		
		public override function update():void {
			
			super.update();
			angularVelocity = 200;
			
			
		
	
			}
		
		
		
		public function randomRange(max:Number, min:Number = 0):Number
					{
										return Math.random() * (max - min) + min;
						}
		
		
		
		
		
	}

}