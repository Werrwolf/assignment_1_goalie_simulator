package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.text.FlxText;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	var player:Player;
	var background:FlxSprite;
	var ball:FlxSprite;
	var goalHitbox:FlxSprite;
	var score:Float;
	var lives:Int;
	var scoreText:FlxText;
	var livesText:FlxText;
	var windowHeight= FlxG.stage.stageHeight;
	var windowWidth= FlxG.stage.stageWidth;
	var x_coord:Float;

	override public function create():Void
	{
		super.create();

		//set background
		background = new FlxSprite();
		background.loadGraphic("assets/images/background.png", false, 720, 600);
		background.x = ((windowWidth) / 2 - (background.width/2));
		background.y = ((windowHeight / 2) - 355);
		add(background);

		//Create Player
		player = new Player();
		player.loadGraphic("assets/images/goalie_resized.png", true, 181, 220);
		player.x = ((windowWidth / 2 ) - (player.width/2));
		player.y = (windowHeight /2) - 120;
		add(player);

		//Create ball
		ball = new Ball(FlxG.random.int(20, 620), 460);
		add(ball);

		score = 0;
		lives = 3;
		scoreText= new FlxText(50, 5, 200,"Score: " + score, 24);
		add(scoreText);

		livesText = new FlxText(windowWidth -200, 5, 200, "Lives: "+ lives,24);
		add(livesText);

		// Create goal hitbox
		//goalHitbox = new FlxSprite();
		//FlxSpriteUtil.drawRect(FlxSprite, 15, 15, 200, 100, 0xFFFFFF );
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		var windowHeight = windowHeight;
		var windowWidth = windowWidth;
		// Move goalie
		player.velocity.x = 0;
		player.velocity.y = 0;

		if (FlxG.keys.pressed.LEFT) 
		{
			player.x -=10;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			player.x += 10;
		}
		if (player.x <0)
		{
			player.x = 1;
		}
		if (player.x > windowWidth - player.width)
		{
			player.x = (windowWidth - player.width)-1;
		}

		//ball caught
		if (FlxG.overlap(ball, player))
		{
			remove(scoreText);
			score +=1 ;
			scoreText= new FlxText(50, 5, 200,"Score: " + score, 24);
			add(scoreText);
			ball.destroy();
			ball = new Ball(FlxG.random.int(20, 620), 460);
			add(ball);
		}

		// ball not caught
		if (ball.y < 150 || ball.x + ball.width > windowWidth || ball.x < 0)
		{
			remove(livesText);
			lives --;
			livesText = new FlxText(windowWidth -200, 5, 200, "Lives: "+ lives,24);
			add(livesText);
			ball.destroy();
			ball = new Ball(FlxG.random.int(20, 620), 460);
			add(ball);
		}

		// no lifes left
		if (lives == 0)
		{
			FlxG.switchState(new EndState());
		}
	}

	override public function destroy() 
	{
	super.destroy();	
	}
}
