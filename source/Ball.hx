package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.math.FlxRandom;

class Ball extends FlxSprite
{
	public function new(X:Float, Y:Float)
	{
		super(X, Y);
		this.loadGraphic("assets/images/ball.png", false, 40, 40);
		this.velocity.x = FlxG.random.float(-200, 200, [-100, 100]);
		this.velocity.y = FlxG.random.float(-100, -200);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
