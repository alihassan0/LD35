package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var title:FlxText;
	override public function create():Void
	{
		super.create();
		title = new FlxText(0,200,FlxG.width,"Game Over");
		title.setFormat(null,64,0xFFFFFFFF,"center");
		add(title);
		
		add(new FlxText(0,400,FlxG.width,"Press space to restart").setFormat(null,24,0xFFCCCCCC,"center"));

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE)
			FlxG.switchState(new PlayState());
	}
}
