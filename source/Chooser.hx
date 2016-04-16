import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

using flixel.util.FlxSpriteUtil;

class Chooser extends FlxSprite{
	private var choices:Array<FlxText>;
	private var reactions:Array<String>;
	private var currentChoice:Int = 0;
	public function new(x:Int, y:Int) {
		super(x,y);
		
		FlxG.state.add(this);

		makeGraphic(FlxG.width, 180, 0x00000000, true);
		drawRoundRect(0, 0, this.width, this.height, 5, 5, 0xBB0000FF);

		choices = new Array<FlxText>();
		reactions = new Array<String>();
		for (i in 0 ... 3) {
			var choice = new FlxText(x,y+this.height*(i/3),this.width,"choice1");
			choice.setFormat(null,16,0x00000000);
			FlxG.state.add(choice);
			choices.push(choice);
		}

	}
	private function select(flxText:FlxText):Void
	{
		flxText.text = " > "+flxText.text;
		flxText.color = 0xFFFFFFFF;
	}
	private function unselect(flxText:FlxText):Void
	{
		flxText.text = flxText.text.substring(3);
		flxText.color = 0xFF000000;
	}
	public function currentReaction():String
	{
		return reactions[currentChoice];
	}
	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justPressed.W)
		{
			unselect(choices[currentChoice]);
			currentChoice = (choices.length+currentChoice-1)%choices.length;
			select(choices[currentChoice]);
		}
		if(FlxG.keys.justPressed.S)
		{
			unselect(choices[currentChoice]);
			currentChoice = (currentChoice+1)%choices.length;
			select(choices[currentChoice]);
		}
		super.update(elapsed);	
	}
	public function updateChoices(s0:Dynamic,s1:Dynamic,s2:Dynamic)
	{
		choices[0].text = s0.text;
		choices[1].text = s1.text;
		choices[2].text = s2.text;
		reactions[0] = s0.reaction;
		reactions[1] = s1.reaction;
		reactions[2] = s2.reaction;

		select(choices[currentChoice]);
	}
}