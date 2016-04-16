package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	public var newsFeed:NewsFeed;
	public var statusBar:FlxBar;
	public var tv:TV;
	public var recorder:Recorder;

	public var popularity:Float = 100;

	override public function create():Void
	{
		super.create();
		add(new FlxSprite(0,0,"assets/images/set.png"));
		
		statusBar = new FlxBar(10,10,FlxBarFillDirection.LEFT_TO_RIGHT,300,20,this,"popularity",0.0,100.0);
		add(statusBar);

		newsFeed = new NewsFeed(250,20);
		newsFeed.changeText("hello my name is ali .. and welcome to my new game");

		tv = new TV(30,50);
		add(tv);

		add(new Recorder(128,95));
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		popularity -= .01;
	}
}
