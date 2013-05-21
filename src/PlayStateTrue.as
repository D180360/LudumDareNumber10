package  
{
	import org.flixel.FlxState;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import mochi.as3.*;
	import flash.display.MovieClip;
	import flash.ui.*;
	import flash.events.*;
	/**
	 * ...
	 * @author ...
	 */
	public class PlayStateTrue extends FlxState 
	{
		[Embed(source="top_left_aligned_cursor.png")]public static const pointer1PNG:Class;
		[Embed(source = "Cursor_Hand.png")]public static const pointerPNG:Class;
		[Embed(source = "powerup.png")]public static const PowerUpPNG:Class;
		[Embed(source = "newrun.mp3")]public static const newRunMP3:Class;
		[Embed(source = "jump.mp3")]public static const newJumpMP3:Class;
		[Embed(source = "enable.mp3")]public static const newEnableMP3:Class;
		[Embed(source = "death.mp3")]public static const newDeathMP3:Class;
		[Embed(source = "nopowerup.mp3")]public static const newNoPowMP3:Class;
		[Embed(source = "DST-HardOck.mp3")]public static const HardOckMP3:Class;
		public var hscounter:Number = 0;
		public var switcher:Boolean = true;
		public var coinswap:Boolean = false;
		public var jumpbool:Boolean = false;
		public var HighScoreDisplay:FlxButton;
		public var coincounter:Number = 0;
		public var ccounter:Number = 0;
		public var coinswap2:Boolean;
		public var hit:Boolean;
		public var powerup:FlxSprite;
		public var playerpos:PlayState1;
		private var _coinTimer:Number = 1;
		private var _spawnTimer: Number = 2;
		private var _spawnInterval: Number = 2.5;
		public var meteors:FlxGroup;
		public var coinss:FlxGroup;
		public var InstructTimer:Number = 0;
		private var _scoreText:FlxText = null;
		public var counter:Number = 0;
		public var status:FlxText = null;
		public var block:FlxTileblock;
		public var block2:FlxTileblock;
		public var floor:FlxTileblock;
		public var level:Level1;
		public var player:Player;
		public var timer:Number = 0;
		public var timer2:Number = 0;
		public var something:FlxText = null;
		public var good:FlxText;
		public var good2:FlxText;
		private var whitePixel:FlxParticle;
		public var em:FlxEmitter;
		public var deathcount:Number = 0;
		public var text:FlxText;
		public var blur:FlxSpecialFX;
		public var running:FlxSound;
		public var jump:FlxSound;
		[Embed(source = "asdf.png")]public static const exPNG:Class;
		[Embed(source = "Blue.png")]public static const BluePix:Class;
		[Embed(source = "Instructions.png")]public static const InstructionsPNG:Class;
		[Embed(source = "powerup.mp3")]public var PowerUpMP3:Class;
		[Embed(source = "minus.mp3")]public var MinusMP3:Class;
		[Embed(source = "meteorsfly.mp3")]public var FlyMP3:Class;
		public var Instructions:FlxSprite;
		

		
		
		public function PlayStateTrue() 
		{
			
		
		 running = new FlxSound();
		 
		 running.loadEmbedded(newRunMP3);
		 jump = new FlxSound();
		 
		 jump.loadEmbedded(newJumpMP3);
		 
		 Mouse.hide();
		 
		 
		 HighScoreDisplay = new FlxButton(230, 250, "HIGHSCORES", null);
		 HighScoreDisplay.flicker(0);
		 HighScoreDisplay.onOver = HSDisplay;
		 HighScoreDisplay.onOut = HSDisplayRemove;
		 HighScoreDisplay.alpha = 0.7;
		 HighScoreDisplay.visible = false;
		 good = new FlxText(105, 105, 200, "      GAME OVER");
		 good.size = 11;
		 good.alpha = 0;
		 good.shadow = 0xff000000;
		 
		 good2 = new FlxText(105, 119, 200, "PRESS ANY KEY TO RESTART");
		 good2.size = 7;
		 good2.alpha = 0;
		 good2.shadow = 0xff000000;
		 
		 playerpos = new PlayState1();
		 
		 FlxG.score = 0;
         block = new FlxTileblock(-1, 0, 1, 400);
         block.makeGraphic(1, 400, 0xff000000);
         level = new Level1;
         player = new Player(140, 210);
         player.reset(140, 210);
         status = new FlxText(150,50, 100);
         status.alignment = "center";
         status.size = 10;
         status.text = "  ";
         _scoreText = new FlxText(10, 8, 100, "0");
		 
		 
		 block2 = new FlxTileblock(320, 0, 1, 400);
         block2.makeGraphic(1, 400, 0xff000000);
		 
		 
		 powerup = new FlxSprite(10, 190, PowerUpPNG);
		 
		 FlxG.playMusic(HardOckMP3, 0.8);
		 powerup.blend = "screen";
		 
		 powerup.alpha = 0.35;
		 
		 
		 text = new FlxText(105, 150, 200, "POWER+UP", true);
		 text.size = 8;
		 text.shadow = 0xff000000;
		 text.visible  = false;
		 
		 
		 
		 good2.shadow = 0xff000000;
		 
		 
		 
		 
		 Instructions = new FlxSprite(165, 3, InstructionsPNG);
		 Instructions.alpha = 0;
		 
			
		 
		 
		 
		  
		 
		 FlxG.mouse.hide();
		 
		
		 
		 
		 
         
		 _scoreText.setFormat(null, 18, 0xFFFFFFFF, "left");
         _scoreText.shadow = 0xff000000;
		_scoreText.visible = false;
         floor = new FlxTileblock(0,239, 320,1);
         floor.makeGraphic(320, 1, 0xff000000);
         floor.immovable = true;
         status.visible = true;
         meteors = new FlxGroup();
         coinss = new FlxGroup();
         add(level);
         add(player);
		 add(block2);
         add(block);
         add(status);
         add(coinss);
         add(meteors);
         add(floor);
		 add(_scoreText);
		 add(good);
		 add(good2);
		 add(text);
		 add(Instructions);
		 add(powerup);
		 add(HighScoreDisplay);
         FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
		 
		}
		
		
		
		
		override public function update():void 
		{
			super.update();
			
					   HighScoreDisplay.flicker(0);

		 FlxG.collide(player, level);
         FlxG.collide(player, floor);
         FlxG.collide(player, block);
		 FlxG.collide(player, block2);
         FlxG.overlap(player, meteors, OverlapMetPlayer );
		 FlxG.overlap(player, coinss, OverlapCoin);
         
		 
		 
		 
		 
		 
         level.level1bd.velocity.x = 1000 * FlxG.elapsed;
         counter += FlxG.elapsed;
			
		   
		   if (counter > 0 && counter < 3 )
         {
            status.visible = false;
            FlxG.flash(0xffffffff, 1);
            level.level1bd2.visible = true;
            level.level1bd2 .velocity.x = 1000 * FlxG.elapsed;
            level.level1nb.color = 0x7F7F7F;
            player.color = 0xFF7F7F;
			_scoreText.visible = true;
         }
         
         if (counter > 3 ){
			
            level.em.start(false, 3, .01);
            _spawnTimer -= FlxG.elapsed;
            InstructTimer += FlxG.elapsed;
			
			
			
			if (InstructTimer < 5) {
				
				Instructions.alpha += 0.025;
				
				
			}else if ( InstructTimer >= 8 ) {
				
				Instructions.alpha -= 0.025;
				
			}
			
			
			
			
            if(_spawnTimer < 0)
            {
				if(player.alive){
			   switcher = true;		
               metSpawn();
               resetSpawnTimer();
			   FlxG.score += 1;
	           _scoreText.text = FlxG.score.toString();
			   
            }else if (!player.alive) {
			   metSpawn();
               resetSpawnTimer();
			   switcher = false;
			   FlxG.score += 0;
	           _scoreText.text = FlxG.score.toString();
			}

         }
         }
         if (counter > 9 ) {
         
            _coinTimer -= FlxG.elapsed;   
         
            if (_coinTimer < 0) {
               coinSpawn();
               resetCoinTimer();   
            }
		   
			
			
			
         }
		 
		 
		 
		 
		 
		  
		
		   
		  
		   
		 
		 
		 ccounter -= 0.001;
		 
		 
		 if(FlxG.keys.pressed("X") && ccounter < 0 && coincounter > 0){	
		    
			 coinswap2 = true;
			 ccounter = 1;
			 FlxG.play(newEnableMP3);
		 }
		 
		 
		 
		 if (player.alive && coincounter > 0 && ccounter > 0 && coinswap2 == true) {
		
		   FlxG.flash(0x0F0000FF, 1);
		   FlxControl.clear();
		   FlxControl.create(player, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT,1, true, false);
           FlxControl.player1.setCursorControl(false, false, true, true);
           FlxControl.player1.setSounds(jump, null,running, null);
           FlxControl.player1.setMovementSpeed(400, 0, 400,200, 400, 0);
           FlxControl.player1.setGravity(0, 800);
		   player.color = 0x0066CC;
		   
		   
		   
		   
		   
		   
		   
		 
		   
		   coincounter -= 0.001;
		   
		   if (!player.alive) {
			   FlxControl.clear();
			   player.color = 0xFF7F7F;
			   player.blend = "normal";
			   coincounter = 0;
			   FlxControl.stop();
			   FlxControl.player1.setSounds(null, null, null, null);
			   powerup.alpha = 0.35;
			  
			   
			   
		   }
		   
		   
		   
		   
		   if (coincounter <= 0) {
			   coincounter = 0;
			   powerup.alpha = .35;
			   
		   }
		   
		   
		   
		   }else if (ccounter < 0) {
			   coinswap2 = false;
			   
			   player.color = 0xFF7F7F;
			   
			   jumpbool == false;
			   FlxControl.clear();
		       FlxControl.create(player, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES,1, true, false);
               FlxControl.player1.setCursorControl(false, false, true, true);
			   
               FlxControl.player1.setJumpButton("UP", FlxControlHandler.KEYMODE_PRESSED, 500, FlxObject.FLOOR, 250, 200);
               FlxControl.player1.setMovementSpeed(400, 0, 400,200, 400, 0);
               FlxControl.player1.setGravity(0, 800);
			   
			   
		   
		   
		   
			   
			   if (player.x != 0 && player.y == 0) {
		   FlxControl.player1.setSounds(null, null,running, null);
			   }else {
				   
				   FlxControl.player1.setSounds(jump, null, null, null);
				   
			   }
		   
		   
			   
			   
			   
			   if (!player.alive) {
				   
				   coincounter = 0;
				  FlxControl.stop();
				  powerup.alpha = 0.35;
			   }
			   
			   
		   }      else if (!player.alive ) {
				  coincounter = 0;
				  FlxControl.stop();
				  
			  }
			  
			   
			   
			   
			   
			 
		   
		 
		 
		 
		 
		 if (coinswap) {
			 
			 
			 timer2 += FlxG.elapsed;
			 text.x = player.x - 10;
			 
			 text.visible = true;
			 if (timer2 > 0){
			 text.alpha -= 0.0085;
			 text.y += 0.3;
			 resetSecondTimer();
			 }
		 }
		 
		 
		 
		 
		 if (FlxG.keys.justPressed("X") && coincounter <= 0) {
			 
			 FlxG.play(newNoPowMP3,0.6);
			 
		 }
		 
		 
		 
		 
		 
		 
		 
		 if (!player.alive) {
			 
			 timer += FlxG.elapsed;
			 switcher = false;
			 Instructions.visible = false;
		  if (timer > 1) {
			deathcount += FlxG.elapsed;
			good.alpha += 0.050;
			good2.alpha += 0.005;
		
			player.acceleration.y = 0;
			player.acceleration.x = 0;
			player.allowCollisions = FlxObject.NONE;
			player.immovable = true;
			HighScoreDisplay.visible = true;
			if(HighScoreDisplay.y > 210){
			HighScoreDisplay.y += -1;
			}
			}
		    if (timer > 2) {
			FlxG.mouse.show(pointerPNG, 1, 0, 0);
	        
			
			IfDead();
			
			
		 }
			
		 
		 
			
			
		}
		
	}
	

		
		

		
		
		
		
		private function metSpawn():void {
            
         var x:Number = randomRange(315, 5);
         var y:Number = -40;
         meteors.add(new Meteor(x, y));
		 FlxG.play(FlyMP3);
         meteors.draw();
		 
         
      }
         
      private function coinSpawn():void {
         var x:Number = randomRange(315, 5);
         var y:Number = -20;
              coinss.add(new Coin(x, y));
         coinss.draw();
      }
         
      private function resetSpawnTimer():void
      {
         _spawnTimer = _spawnInterval;
         _spawnInterval *= 0.95;

         if(_spawnInterval < 0.4)
         {
            _spawnInterval = 0.4;
         }
      }
         
         
      
      private function resetCoinTimer():void
      {
         _coinTimer = 10.5
         _coinTimer *= 1;
   
         if(_coinTimer < 0.1)
         {
            _coinTimer = 0.1;
         }   
      }
      
         public function OverlapMetPlayer(pl:Player, me:Meteor):void {
			 
			
			 if (coincounter >= 1) {
				 
				 FlxG.play(MinusMP3);
				 me.kill();
				 pl.reset(player.x, player.y);
				 
				 pl.blend = "screen";
				 
				 powerup.alpha = .5
				  
				  
				 
			 }
			 
			 
		
			
			 
		if(coincounter <= 0){   
		   var emitter:FlxEmitter = createEmitter();
		   emitter.at(me); 
			   
		   
		   
		   FlxControl.clear();
			   player.color = 0xFF7F7F;
			   player.blend = "normal";
			   coincounter = 0;
			   
			   FlxControl.player1.setSounds(null, null, null, null);
		   
		 
		 
            pl.alive = false;
			
			
			MochiScores.submit(FlxG.score,"name");
			
			hscounter += 1;
			
			if (hscounter > 1) {
				me.allowCollisions = FlxObject.NONE;
			}
		   
			
			
			
            FlxControl.stop();
		    pl.velocity.x = 0;
			pl.velocity.y = 0;
			
			 if (!pl.alive && deathcount <= 0) {
			 
		   if(pl.facing == FlxObject.RIGHT){	 
			 
			  player.color = 0xFF7F7F;
			   player.blend = "normal"; 
			   FlxG.music.stop();
			FlxG.play(newDeathMP3);
			player.play("death"); 
			return;
		   }else if (pl.facing == FlxObject.LEFT) {
			   FlxG.music.stop();
			   player.color = 0xFF7F7F;
			   player.blend = "normal";
			   FlxG.play(newDeathMP3);
			   
			   player.play("death2"); 
			return;
			   
			   }
			 }
		 
			
			
		    
			
			
			
			OverlapCoin == false;
		 
	      }else if (coincounter > 0) {
			  
			  coincounter -= 1;
			  return;
			  
			  
		  }
		  
		 }
		 
	
	      
      public function randomRange(max:Number, min:Number = 0):Number
      {
         return Math.random() * (max - min) + min;
      }
	  
	  
	  
	  
	  
	  public function OverlapCoin(pl:Player, coin:Coin):void {
		 if(player.alive){ 
		  coin.kill();
		  FlxG.score += 5;
		  
		  var emitter:FlxEmitter = createEmitter2();
		  
		  FlxG.play(PowerUpMP3);
		  
		  player.color = 0xFF7F7F;
		  player.blend = "normal";
		  
		  
		  emitter.at(coin);
		  
		  
		  CoinPowerUp();
		  
		  
		  coinswap = true;
		  _scoreText.text = FlxG.score.toString();
		 }  else if (!player.alive) {
			   coinswap = false;
			   FlxG.score += 0;
			  _scoreText.text = FlxG.score.toString();
		  }
		  
	  }
	  
	  protected function NeutralScore():void {
		  
		  FlxG.score += 0;
	      _scoreText.text = FlxG.score.toString();
	  }
	  
	  public function Restart():void {
		   FlxG.resetState();
		   
	  }
	  
	  public function IfDead():void {
		  
		  
		  if (!player.alive ) {
				
			  	
				if(FlxG.keys.any()){
				
				FlxG.fade(0xff000000, 1, Restart);
				}
			
			  
	  }
	  
	  
	}

	private function createEmitter():FlxEmitter {
		  
		    em = new FlxEmitter(150, -30, 50);
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
			whitePixel.loadGraphic(exPNG, false, true, 5, 5);
			whitePixel.visible = false;
			em.add(whitePixel);
			}
		 
		
			em.start(true,1)
			add(em);
			return em;
			
		  
	  }
	  
	
	  
	  
	  public function createEmitter2():FlxEmitter {
		  
		  em = new FlxEmitter(150, -30, 30);
			em.setRotation(90, 260);
			em.setXSpeed(-500, 500);
			em.setYSpeed( -300, 200 );
			em.gravity = 0;
			em.bounce = 0.7;
			
			
			
			
			for (var i:int = 0; i < em.maxSize / 2; i++) {
				
			whitePixel = new FlxParticle();
			whitePixel.allowCollisions = FlxObject.NONE;
			whitePixel.loadGraphic(BluePix, false, true, 3, 3);
			whitePixel.visible = false; 
			em.add(whitePixel);
			whitePixel = new FlxParticle();
			whitePixel.allowCollisions = FlxObject.NONE;
			whitePixel.loadGraphic(BluePix, false, true, 3, 3);
			whitePixel.visible = false;
			em.add(whitePixel);
			
			}
		 
		
			em.start(true, 2, 0, 0);
			add(em);
			return em;
			
		  
	  }
	  
	  private function resetSecondTimer():void {
		  
		  if (text.alpha <= 0) {
			
			 coinswap = false;
			 text.visible = false;
			 timer2 = 0;  
			 text.alpha = 1;
			 text.y = 150;
			 
				 }
		  
		  
		  
	  }
	  
	  
	  public function CoinPowerUp():void {
		  
		  powerup.alpha = 1;
		  coincounter += 1;
		  
		 }
	 
		 public function HSDisplay():void {
		   submitScore();
			if (FlxG.keys.any()) {
	 FlxG.fade(0xff000000, 1, Restart);	
				}
			
		
		}
  
		 public function HSDisplayRemove():void {
		    
		 }
		 
		 public function HSDisplayClick():void {
			 
			
		 }
		 
		 private function submitScore():void
    {
        Mouse.show();
        var o:Object = { n: [3, 12, 9, 13, 3, 7, 8, 11, 1, 15, 0, 8, 12, 0, 1, 11], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
	    var boardID:String = o.f(0,"");
        MochiScores.showLeaderboard( { boardID: "3c9d378b1f08c01b"} );
        MochiServices.clip.addEventListener(Event.CLOSE, Mouse.hide); //doesn't work, hence I added Mouse.hide() to  doClose() in MochiServices.as
    }
		 
	
}
}
	

	
	

