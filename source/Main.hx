package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		//addChild(new FlxGame(900, 800, PlayState));
		addChild(new FlxGame(900, 600, PlayState, 1, 60, 60, true));
	}
}
