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

import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.addons.effects.chainable.FlxShakeEffect;

class PlayState extends FlxState
{
	public var newsFeed:NewsFeed;

	public var statusBar:FlxBar;
	public var prezAngryBar:FlxBar;
	public var rebelAngryBar:FlxBar;
	
	public var prezImage:FlxSprite;
	public var rebelImage:FlxSprite;
	public var prezEffectImage:FlxEffectSprite;
	public var rebelEffectImage:FlxEffectSprite;

	public var prezAngerLvl:Float = 50;
	public var rebelAngerLvl:Float = 50;
	public var popularity:Float = 1000;

	public var recorder:Recorder;
	public var chooser:Chooser;
	public var support:Support;

	public var currentEvent:Int=0;

	private var random:FlxRandom;

	public var noise:FlxSprite;


	private var tide:Float = 1;
	private var tideTxt:FlxText;
	override public function create():Void
	{
		super.create();

		random = new FlxRandom();
		Sound.init();

		new Noise(178,60);
		new Noise(278,60);
		new Noise(178,160);
		new Noise(300,200);
		//Background
		var bg:FlxSprite = new FlxSprite(0,0,"assets/images/set.png");
		bg.scale.set(2,2);
		bg.updateHitbox();
		bg.replaceColor(0xFFac5100,0xFF46c92c);
		add(bg);

		var frame = new FlxSprite(450,65,"assets/images/frame.png");
		frame.scale.set(.8,.8);
		add(frame);

		support = new Support(100,80);


		newsFeed = new NewsFeed(178,70);
		newsFeed.changeText("");

		//add(new Recorder(256,190));

		var yOffset:Int = 8;

		//add top panel
		add(new FlxSprite(0,0-yOffset).makeGraphic(FlxG.width,70,0xFF888888));
		rebelImage = new FlxSprite(20,10-yOffset,"assets/images/rebel.png");
		rebelEffectImage = new FlxEffectSprite(rebelImage);

		rebelEffectImage.effects = [new FlxShakeEffect(3, 2, function(){cast(prezEffectImage.effects[1],FlxGlitchEffect).active = false;}), new FlxGlitchEffect(2, 2, 0.1)];
		cast(rebelEffectImage.effects[1],FlxGlitchEffect).active = false;
		rebelImage.scale.set(.8,.8);
		rebelEffectImage.setPosition(20,10-yOffset);
		add(rebelEffectImage);

		prezImage = new FlxSprite(580,10-yOffset,"assets/images/mobarak.png");
		prezEffectImage = new FlxEffectSprite(prezImage);
		prezEffectImage.effects = [new FlxShakeEffect(3, 2, function(){cast(rebelEffectImage.effects[1],FlxGlitchEffect).active = false;}), new FlxGlitchEffect(2, 2, 0.1)];
		cast(prezEffectImage.effects[1],FlxGlitchEffect).active = false;
		prezEffectImage.setPosition(580,10-yOffset);
		add(prezEffectImage);

		//struggle and engry bars
		statusBar = new FlxBar(70 ,30-yOffset,FlxBarFillDirection.RIGHT_TO_LEFT,500,20,this,"popularity",0,1000);
		statusBar.maxPercent = 10000;
		statusBar.createFilledBar(0xFFFF0000,0xFF00FF00,true,0xFF000000);
		add(statusBar);

		rebelAngryBar = new FlxBar(10 ,60-yOffset,FlxBarFillDirection.LEFT_TO_RIGHT,50,8,this,"prezAngerLvl",0,100);
		rebelAngryBar.createFilledBar(0x88FF0000,0xFFFF0000,true,0xFF000000);
		add(rebelAngryBar);

		prezAngryBar = new FlxBar(570 ,60-yOffset,FlxBarFillDirection.LEFT_TO_RIGHT,50,8,this,"rebelAngerLvl",0,100,true);
		prezAngryBar.createFilledBar(0xff005100, 0xff00F400, true, 0xFF000000);
		add(prezAngryBar);

		add(new FlxText(0,0,FlxG.width,"Revolution Bar").setFormat(null,16,0xFFFF0000,"center"));
		add(tideTxt = new FlxText(rebelImage.x+40,rebelImage.y,100,"X"+tide).setFormat(null,8,0xFFFF0000));

		FlxG.watch.addMouse();
		FlxG.watch.add(this,"popularity");
		FlxG.watch.add(this,"tide");
		FlxG.watch.add(this,"prezAngerLvl");
		FlxG.watch.add(this,"rebelAngerLvl");

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
	public function react(sAmount:String):Void
	{
		var amount:Int = Std.parseInt(sAmount)*10 -7 + Math.floor(Math.random()*14);
		popularity += amount*3;
		popularity = Math.min(1000,popularity);
		tide += amount/50; 
		tide = Math.max(.1,tide);
		if(prezAngerLvl < 100)
			prezAngerLvl -= amount*.4;
		if(rebelAngerLvl < 100)
			rebelAngerLvl += amount*.4;
		var redComponent = Math.max(0,prezAngerLvl-50)/50;
		var greenComponent = Math.max(0,50-prezAngerLvl)/50;

		prezImage.color = 0xFFFFFFFF - Math.floor(redComponent*0x0000FFFF);
		trace(prezAngerLvl,redComponent,greenComponent);
		if(amount > 0)
		{
			
			cast(prezEffectImage.effects[0],FlxShakeEffect).start();
			cast(rebelEffectImage.effects[1],FlxGlitchEffect).active = true;
			Sound.play("cheer");
			
			if(rebelAngerLvl > 90)
			{
				cast(rebelEffectImage.effects[0],FlxShakeEffect).reset(3,0);

			}
			add(new FloatingText(chooser.x,chooser.y,sAmount.charAt(0)+Math.abs(amount),0xFF00FF00));
		}
		else
		{
			Sound.play("anger");

			cast(rebelEffectImage.effects[0],FlxShakeEffect).start();
			cast(prezEffectImage.effects[1],FlxGlitchEffect).active = true;
			add(new FloatingText(chooser.x,chooser.y,sAmount.charAt(0)+Math.abs(amount),0xFFFF0000));
		}

		FlxG.camera.shake(.01,Math.abs(amount)/400);
	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justPressed.ENTER && chooser.canSelect)
		{
			react(chooser.currentReaction());
			var randomEvent = random.int(0,Data.events.length-1,[currentEvent]);
			post(randomEvent);
		}
		super.update(elapsed);
		if(FlxG.keys.pressed.G)
			prezAngerLvl++;		
		if(FlxG.keys.pressed.H)
			prezAngerLvl--;		
		if(chooser.canSelect)
		{
			popularity -= (tide/20);
			tideTxt.text = "X "+tide;
			statusBar.alpha = 1;
		}
		else
		{
			statusBar.alpha = .8;
		}
		if(popularity<0)
		{
			Reg.reason = "revolution";
			FlxG.switchState(new GameOverState());
		}
		//trace(popularity,tide);
	}
}
