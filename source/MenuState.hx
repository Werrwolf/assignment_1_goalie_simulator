package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class MenuState extends FlxState
{
	var playButton:FlxButton;
	var menuBackground:FlxSprite;
	//var titleText:FlxText;
	override public function create():Void
	{
		super.create();
		var windowWidth = FlxG.stage.stageWidth;
		menuBackground = new FlxSprite();
		menuBackground.loadGraphic("assets/images/menuBackground.png", false, 825, 600);
		add(menuBackground);

		playButton = new FlxButton(0, 0, "Play now", clickPlay);
		playButton.screenCenter();
		add(playButton);

		var titleText = new FlxText(windowWidth/2 - 300, 50, "GOALKEEPING-SIMULATOR", 38);
		add(titleText);
		var titleText_2 = new FlxText(windowWidth/2 - 100, 100,"2000", 45);
		add(titleText_2);
		
	}
	//Play Button is clicked:
	function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}