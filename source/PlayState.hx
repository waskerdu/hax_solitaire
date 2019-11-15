package;

import flixel.system.scaleModes.RatioScaleMode;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var Cards:Stack;
	var Stacks:Array<Stack>;
	var common:Stack;
	override public function create():Void
	{
		FlxG.plugins.add(new FlxMouseEventManager());
		Stacks = new Array<Stack>();
		common = new Stack(0,0,null,Stacks);
		for (i in 0...4)
		{
			var currentStack = new Stack(100+i*100 , 100, common, Stacks);
			for (f in 0...13)
			{
				currentStack.fabCard(i*13+f);
			}
			add(currentStack);
			Stacks.push(currentStack);
		}
		add(common);
		FlxG.scaleMode = new RatioScaleMode(true);
		//FlxG.scaleMode = new FillScaleMode();
		super.create();
	}

	override public function draw() {
		//Stacks.draw();
		super.draw();
	}

	override public function update(elapsed:Float):Void
	{
		//Stacks.update(elapsed);
		super.update(elapsed);
	}
}