import flixel.FlxSprite;
import flixel.FlxG;

class Support extends FlxSprite{
	public function new(x:Int, y:Int) {
		super(x,y);
		loadGraphic("assets/images/support.png",true,92,92);
		FlxG.state.add(this);
	}
}