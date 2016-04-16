import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

import flixel.addons.text.FlxTypeText;

using flixel.util.FlxSpriteUtil;

class Chooser extends FlxSprite{
	private var choices:Array<FlxTypeText>;
	private var reactions:Array<String>;
	private var currentChoice:Int = 0;
	public var canSelect:Bool = false;
	public function new(x:Int, y:Int) {
		super(x,y);
		
		FlxG.state.add(this);
		var lineStyle = { color: 0xFF000000, thickness: 3.0 };
		makeGraphic(FlxG.width, 160, 0x00000000, true);
		drawRoundRect(20, 0, this.width -40, this.height, 15, 15, 0xEE222222,lineStyle);

		choices = new Array<FlxTypeText>();
		reactions = new Array<String>();
		for (i in 0 ... 3) {
			var choice = new FlxTypeText(x+40,y+5+this.height*(i/3),Math.floor(this.width)-80,"choice1");
			choice.setFormat(null,16,0x00000000);
			choice.delay = 0.1;
			choice.eraseDelay = 0.2;
			choice.prefix = "- ";
			choice.setTypingVariation(0.75, true);
			choice.skipKeys = ["SPACE"];
			FlxG.state.add(choice);
			choices.push(choice);
		}

	}
	private function select(flxText:FlxTypeText):Void
	{
		flxText.color = 0xFFFFFFFF;
	}
	private function unselect(flxText:FlxTypeText):Void
	{
		flxText.color = 0xFF000000;
	}
	public function resetAllText():Void
	{
		choices[0].resetText("");
		choices[1].resetText("");
		choices[2].resetText("");
	}
	public function currentReaction():String
	{
		return reactions[currentChoice];
	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.anyJustPressed(["W","UP"])&& canSelect)
		{
			unselect(choices[currentChoice]);
			currentChoice = (choices.length+currentChoice-1)%choices.length;
			select(choices[currentChoice]);
			Sound.play("select");
		}
		if(FlxG.keys.anyJustPressed(["S","DOWN"])&& canSelect)
		{
			unselect(choices[currentChoice]);
			currentChoice = (currentChoice+1)%choices.length;
			select(choices[currentChoice]);
			Sound.play("select");
		}
		super.update(elapsed);	
	}
	public function updateChoice(i:Int)
	{
		if(i ==  choices.length)
		{
			canSelect = true;
			select(choices[currentChoice]);
			return;
		}
		choices[i].start(0.04, true, false, null,updateChoice.bind(i+1));
	}
	public function updateChoices(s0:Dynamic,s1:Dynamic,s2:Dynamic)
	{

		choices[0].resetText(s0.text);
		choices[1].resetText(s1.text);
		choices[2].resetText(s2.text);
		reactions[0] = s0.reaction;
		reactions[1] = s1.reaction;
		reactions[2] = s2.reaction;
		updateChoice(0);
		
	}
}