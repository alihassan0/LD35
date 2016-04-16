package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

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
		//Background
		var bg:FlxSprite = new FlxSprite(0,0,"assets/images/set.png");
		bg.scale.set(2,2);
		bg.updateHitbox();
		add(bg);

		//struggle bar
		statusBar = new FlxBar(70,10,FlxBarFillDirection.LEFT_TO_RIGHT,500,20,this,"popularity",0.0,1000.0);
		add(statusBar);


		newsFeed = new NewsFeed(500,40);
		newsFeed.changeText("hello my name is ali .. and welcome to my new game");

		tv = new TV(30,50);
		add(tv);

		add(new Recorder(256,190));
		
		var letters:String = " !\"#$%&'()*+,-./" + "0123456789:;<=>?" + "@ABCDEFGHIJKLMNO" + "PQRSTUVWXYZ[]^_" + "abcdefghijklmno" + "pqrstuvwxyz{|}~\\";
		var fontXNA:FlxBitmapFont = FlxBitmapFont.fromXNA("assets/fonts/fontData10pt.png", letters);
		
		var tf3:FlxBitmapText = new FlxBitmapText(fontXNA);
		tf3.y = 0;
		tf3.textColor = 0xFFFFFFFF;
		tf3.useTextColor = true;
		tf3.alignment = FlxTextAlign.LEFT;
		tf3.lineSpacing = 5;
		tf3.text = "Breaking news....";
		tf3.autoUpperCase = true;
		add(tf3);
		
		FlxG.plugins.add(new FlxScrollingText());
		scrollingText = FlxScrollingText.add(tf3,new Rectangle(0,0,200,200),1,0," Breaking news ***");
		scrollingText.color = 0xFF000000;
		scrollingText.setPosition(505,45);//manually
		add(scrollingText);
		
		FlxG.watch.addMouse();

		chooser = new Chooser(0,300);

		post();
	}
	public function post():Void
	{
		var data = Data.level1().choices;
		newsFeed.changeText(data[0].text);
		data = data.splice(1,data.length);
		var shuffledIndices = new FlxRandom().shuffleArray([0,1,2],6);

		chooser.updateChoices(data[shuffledIndices[0]],data[shuffledIndices[1]],data[shuffledIndices[2]]);

	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justPressed.ENTER)
			trace(chooser.currentReaction());
		super.update(elapsed);
		
		popularity -= .01;
	}
}
