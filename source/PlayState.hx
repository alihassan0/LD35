package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	public var newsFeed:NewsFeed;
	override public function create():Void
	{
		super.create();
		add(new FlxSprite(0,0,"assets/images/set.png"));
		newsFeed = new NewsFeed(250,20);
		newsFeed.changeText("hello my name is ali .. and welcome to my new game");

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
