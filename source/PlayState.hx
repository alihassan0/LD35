package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.addons.plugin.FlxScrollingText;
import flash.geom.Rectangle;


class PlayState extends FlxState
{
	public var newsFeed:NewsFeed;
	public var statusBar:FlxBar;
	public var tv:TV;
	public var recorder:Recorder;
	public var chooser:Chooser;

	public var popularity:Float = 100;

	public var scrollingText:FlxSprite;


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
		
		var letters:String = " !\"#$%&'()*+,-./" + "0123456789:;<=>?" + "@ABCDEFGHIJKLMNO" + "PQRSTUVWXYZ[]^_" + "abcdefghijklmno" + "pqrstuvwxyz{|}~\\";
		var fontXNA:FlxBitmapFont = FlxBitmapFont.fromXNA("assets/fonts/fontData10pt.png", letters);
		
		var tf3:FlxBitmapText = new FlxBitmapText(fontXNA);
		tf3.y = 0;
		tf3.textColor = 0xFFFFFFFF;
		tf3.useTextColor = true;
		tf3.text = "Breaking news....";
		tf3.autoUpperCase = true;
		add(tf3);
		
		FlxG.plugins.add(new FlxScrollingText());
		scrollingText = FlxScrollingText.add(tf3,new Rectangle(0,0,200,200),1,0," Breaking news ***");
		scrollingText.scale.set(.5,.5);
		add(scrollingText);
		scrollingText.setPosition(200,-25);//manually
		FlxG.watch.addMouse();
		
		chooser = new Chooser(0,180);

		post();
	}
	public function post():Void
	{
		var data = Data.level1();
		newsFeed.changeText(data[0]);
		chooser.updateChoices(data[1],data[2],data[3]);

	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		popularity -= .01;
	}
}
