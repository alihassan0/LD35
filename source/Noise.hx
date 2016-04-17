import flixel.FlxSprite;
import flixel.FlxG;

class Noise extends FlxSprite{
	public function new(x:Int, y:Int) {
		super(x,y);
		loadGraphic("assets/images/noise.png",true,176,140);
		animation.add("noise",[0,1,2,3],12);
		animation.play("noise");
		FlxG.state.add(this);
	}
}