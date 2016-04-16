package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		add(new FlxSprite(0,0,"assets/images/set.png"));
		new NewsFeed(250,20);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
