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
	public var prezAngryBar:FlxBar;
	public var rebelAngryBar:FlxBar;

	public var prezAngerLvl:Float = 50;
	public var rebelAngerLvl:Float = 50;
	public var popularity:Float = 1000;

	public var tv:TV;
	public var recorder:Recorder;
	public var chooser:Chooser;


	public var currentEvent:Int=0;

	private var random:FlxRandom;

	private var tide:Float = 1;
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

		var frame = new FlxSprite(460,65,"assets/images/frame.png");
		frame.scale.set(.8,.8);
		add(frame);

		newsFeed = new NewsFeed(480,40);
		newsFeed.changeText("hello my name is ali .. and welcome to my new game");

		tv = new TV(90,160);
		//add(tv);

		//add(new Recorder(256,190));

		//add top panel
		add(new FlxSprite(0,0).makeGraphic(FlxG.width,70,0xFFCCCCCC));
		
		var rebel:FlxSprite = new FlxSprite(20,10,"assets/images/rebel.png");
		rebel.scale.set(.8,.8);
		add(rebel);

		var prez:FlxSprite = new FlxSprite(580	,10,"assets/images/mobarak.png");
		add(prez);

		//struggle and engry bars
		statusBar = new FlxBar(70,30,FlxBarFillDirection.RIGHT_TO_LEFT,500,20,this,"popularity",0,1000);
		statusBar.createFilledBar(0xFFFF0000,0xFF00FF00,true,0xFF000000);
		add(statusBar);

		rebelAngryBar = new FlxBar(10,60,FlxBarFillDirection.LEFT_TO_RIGHT,50,8,this,"prezAngerLvl",0,100);
		rebelAngryBar.createFilledBar(0xFFFF0000,0xFF00FF00,true,0xFF000000);
		add(rebelAngryBar);

		prezAngryBar = new FlxBar(570,60,FlxBarFillDirection.LEFT_TO_RIGHT,50,8,this,"rebelAngerLvl",0,100);
		prezAngryBar.createFilledBar(0xFFFF0000,0xFF00FF00,true,0xFF000000);
		add(prezAngryBar);

		add(new FlxText(0,0,FlxG.width,"Revelution Bar").setFormat(null,16,0xFFFF0000,"center"));


		FlxG.watch.addMouse();

		chooser = new Chooser(0,300);

		post(0);
		
	}
	public function post(event:Int):Void
	{
		currentEvent = event;
		chooser.canSelect = false;
		var data = Data.events[event].choices;
		var shuffledIndices = random.shuffleArray([1,2,3],6);

		//reset choices
		chooser.resetAllText();
		//hacky way of doing it
		newsFeed.newsTextField.resetText(data[0].text);
		newsFeed.newsTextField.start(0.02, true, false, null,
		chooser.updateChoices.bind(data[shuffledIndices[0]],data[shuffledIndices[1]],data[shuffledIndices[2]]));


		//chooser.updateChoices(data[shuffledIndices[0]],data[shuffledIndices[1]],data[shuffledIndices[2]]);

	}
	public function react(amount:Int):Void
	{
		popularity += amount*10;
		popularity = Math.min(1000,popularity);
		tide += amount/5; 
		tide = Math.max(.1,tide);
		prezAngerLvl -= amount;
		rebelAngerLvl += amount;
	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justPressed.ENTER && chooser.canSelect)
		{
			var amount:Int = Std.parseInt(chooser.currentReaction());
			react(amount);
			var randomEvent = random.int(0,Data.events.length-1,[currentEvent]);
			post(randomEvent);
			FlxG.camera.shake(.01,Math.abs(amount)/20);
			

			if(amount>0)
			{
				Sound.play("cheer");
				add(new FloatingText(chooser.x,chooser.y,chooser.currentReaction(),0xFF00FF00));
			}	
			else
			{
				Sound.play("anger");
				add(new FloatingText(chooser.x,chooser.y,chooser.currentReaction(),0xFFFF0000));
			}
		}
		super.update(elapsed);
		
		popularity -= (tide/25);
		if(popularity<0)
			FlxG.switchState(new MenuState());
		//trace(popularity,tide);
	}
}
