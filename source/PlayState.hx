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




class PlayState extends FlxState
{
	public var newsFeed:NewsFeed;
	public var statusBar:FlxBar;
	public var tv:TV;
	public var recorder:Recorder;
	public var chooser:Chooser;

	public var popularity:Float = 1000;

	public var currentEvent:Int=0;

	private var random:FlxRandom;
	override public function create():Void
	{
		super.create();

		random = new FlxRandom();
		Sound.init();

		//Background
		var bg:FlxSprite = new FlxSprite(0,0,"assets/images/set.png");
		bg.scale.set(2,2);
		bg.updateHitbox();
		add(bg);

		var frame = new FlxSprite(80,70,"assets/images/frame.png");
		frame.scale.set(.8,.8);
		add(frame);
		//struggle bar
		statusBar = new FlxBar(70,10,FlxBarFillDirection.LEFT_TO_RIGHT,500,20,this,"popularity",0.0,1000.0);
		add(statusBar);


		newsFeed = new NewsFeed(500,40);
		newsFeed.changeText("hello my name is ali .. and welcome to my new game");

		tv = new TV(90,160);
		add(tv);

		add(new Recorder(256,190));
		
		
		
		FlxG.watch.addMouse();

		chooser = new Chooser(0,300);

		post(0);
		add(new FloatingText(200,200,"+5",0xFF00FF00));
	}
	public function post(event:Int):Void
	{
		currentEvent = event;

		var data = Data.events[event].choices;

		newsFeed.changeText(data[0].text);
		var shuffledIndices = random.shuffleArray([1,2,3],6);
		chooser.updateChoices(data[shuffledIndices[0]],data[shuffledIndices[1]],data[shuffledIndices[2]]);

	}
	public function react(amount:Int):Void
	{
		popularity += amount*10;

	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justPressed.ENTER)
		{
			var amount:Int = Std.parseInt(chooser.currentReaction());
			react(amount);
			var randomEvent = random.int(0,2,[currentEvent]);
			post(randomEvent);
			FlxG.camera.shake(.01,Math.abs(amount)/20);
			Sound.play("cheer");
		}
		super.update(elapsed);
		
		popularity -= .01;
	}
}
