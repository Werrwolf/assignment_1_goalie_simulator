package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxG;

class Player extends FlxSprite
{
	public var playerScore:Int = 0;
	public var speed:Float = 200;
	//Update function is called every frame:
	override public function update(elapsed:Float):Void
	{
		movement();
		super.update(elapsed);
	}

	function movement():Void
	{
		//Declaring variables
		var left:Bool= false;
		var right:Bool = false;
		//When key is pressed:
		left = FlxG.keys.anyPressed([LEFT]);
		right = FlxG.keys.anyPressed([RIGHT]);
		//Canceling out opposite directions
		if (left && right)
			left = right = false;	
	}
	public function scores(player:Player):Void
	{
		playerScore += 1;
	
	}
}
