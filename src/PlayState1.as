package 
{
   import org.flixel.FlxState;
   import org.flixel.*;
   import org.flixel.plugin.photonstorm.*;
   import org.flixel.plugin.photonstorm.FX.BlurFX;
   import org.flixel.FlxDialog;
        public class PlayState1 extends FlxState
   {
     
     
      public var counter:Number = 0;
      public var status:FlxText = null;
      public var block:FlxTileblock;
      public var floor:FlxTileblock;
      public var level:Level1;
      public var player:Player;
      public var timer:Number = 0;
      public var something:FlxText = null;
	  public var ssss:FlxSprite;
	  
	
	  [Embed(source = "DST-DownBeat.mp3")]public static const muzak:Class;
	  
	  
	  
      public function PlayState1()
      {
         
      }
      
      override public function create():void
      {
		  
		  
		  
		  
		  ssss = new FlxSprite;
		  
		  
		  
		  ssss.makeGraphic(320, 240, 0xff000000);
		  
		  
		  ssss.alpha = 1;
		
		 FlxG.playMusic(muzak, 1);
		 
		 FlxG.score = 0;
         block = new FlxTileblock(-1, 0, 1, 400);
         block.makeGraphic(1, 400, 0xff000000);
         level = new Level1;
         player = new Player(10, 50);
         player.reset(10, 50);
         status = new FlxText(150,50, 100);
         status.alignment = "center";
         status.size = 10;
         status.text = "  ";
         
         floor = new FlxTileblock(0,239, 320,1);
         floor.makeGraphic(320, 1, 0xff000000);
         floor.immovable = true;
         status.visible = true;
         
         
         add(level);
         add(player);
         add(block);
         add(status);
         
        
         add(floor);
		
		 add(ssss);
		 
         FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
      }
      
      
      override public function update():void {
         
         super.update();
         
         FlxG.collide(player, level);
         FlxG.collide(player, floor);
         FlxG.collide(player, block);
         
         
         level.level1bd.velocity.x = 1000 * FlxG.elapsed;
         counter += FlxG.elapsed;
		 
		 
		 
		 ssss.alpha -= 0.01;
         
         if (counter > 1 && counter < 3)
         {       
            status.x = 150;
            status.y = 100;
            status.color = 0xff000000;
            status.alignment = "center";
            status.text = " ..Welcome...";
            status.scrollFactor.x = 2;
         }
         
         
         if (counter > 4 && counter < 7)
         {
            status.x = player.x;
            status.y = player.y - 50;
            status.color = 0xffffffff;
            status.alignment = "left";
            status.text = " ...what!?     where am I..who are you!?";
            status.scrollFactor.x = 2;
         }
         
         if (counter > 7 && counter < 10)
         {
            status.x = 150;
            status.y = 100;
            status.color = 0xff000000;
            status.alignment = "center";
            status.text = " ...I have summoned you here as my little play thing..";
            status.scrollFactor.x = 2;
         }
         
         
         if (counter > 10 && counter < 14)
         {
            status.x = player.x;
            status.y = player.y - 40;
            status.color = 0xffffffff;
            status.alignment = "left";
            status.text = " what!?? no!!...why!? aaa!!";
            status.scrollFactor.x = 2;
         }
         
         
         if (counter > 12 && counter < 15)
         {
            status.x = 150;
            status.y = 100;
            status.color = 0xff000000;
            status.alignment = "center";
            status.text = " Enjoy your stay...";
            status.scrollFactor.x = 2;
         }
         
		 if (counter > 15) {
			 FlxG.music.stop();
			 FlxG.music.kill();
			 this.kill();
			 FlxG.switchState(new PlayStateTrue);
			 
		 }
		 
         
      }
	  
      
      
      
   }
}
