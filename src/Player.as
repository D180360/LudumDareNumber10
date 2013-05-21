package
{
   
   import org.flixel.*;
   import org.flixel.plugin.photonstorm.*;
   
   /**
   * ...
   * @author Dan
   */
   public class Player extends FlxSprite
   {
      [Embed(source="Player.png")]public static const PlayerIdle:Class;
	  [Embed(source = "jump.mp3")]public static const newJumpMP32:Class;
	  
	  
	  
	  
	  public var jump:FlxSound;
    
      public function Player(X:Number, Y:Number)
      {
         super(x, y);
         loadGraphic(PlayerIdle, true, true, 32, 40);
         addAnimation("idle", [0, 1, 2, 3], 4, true);
         addAnimation("run", [5, 6, 7, 8], 20, true);
         addAnimation("upjump", [5], 1, false);
         addAnimation("death", [9, 10, 11, 12, 13, 14, 15], 18, false);
		 addAnimation("death2", [16, 17, 18, 19, 20, 21, 22, 23], 18, false);
		 
		 
		 
		 
		 jump = new FlxSound();
		 
		 jump.loadEmbedded(newJumpMP32);
		 
		 
		 
		 
		 
		 
		 
         width = 29;
         height = 39;
         FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES,1, true, false);
         FlxControl.player1.setCursorControl(false, false, true, true);
         FlxControl.player1.setJumpButton("UP", FlxControlHandler.KEYMODE_PRESSED, 500, FlxObject.FLOOR, 250, 200);
         FlxControl.player1.setMovementSpeed(400, 0, 400, 200, 400, 0);
		 FlxControl.player1.setSounds(jump, null, null, null);
         FlxControl.player1.setGravity(0, 800);
		 FlxControl.player1.enabled = true;
         facing = FlxObject.RIGHT;
         var deathAnimationPlayed:Boolean = false;
      }
     
     
     
      override public function update():void {
         
           super.update();
         
         
           if (FlxG.getPlugin(FlxControl) == null)
           {
              FlxG.addPlugin(new FlxControl);
           }
         

          if (alive) {            
              if (velocity.y != 0) {
                 play("upjump");
              } else
              if (velocity.x != 0) {
                 play("run");
              } else {
                 play("idle");
              }     
           }   
         else if (!PlayerIdle.deathAnimationPlayed && !alive) {
			
			if (facing == FlxObject.RIGHT) {
				FlxControl.player1.setGravity(0, 0);
			allowCollisions = FlxObject.NONE;
			immovable = true;
            play("death");
            PlayerIdle.deathAnimationPlayed = true;
			}else if (facing == FlxObject.LEFT) {
			FlxControl.player1.setGravity(0, 0);
			allowCollisions = FlxObject.NONE;
			immovable = true;
			play("death2");
            PlayerIdle.deathAnimationPlayed = true;
				}
			
			
			}
         
      this.y = Math.min(this.y, FlxG.height - this.height);
      this.x = Math.min(this.x, FlxG.width - this.width);
   }
   }
}