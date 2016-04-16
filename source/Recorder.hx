import flixel.FlxSprite;
import flixel.FlxG;

class Recorder extends FlxSprite{
	public function new(x:Int, y:Int) {
		super(x,y);
		loadGraphic("assets/images/recorder.png",true,45,120);
		animation.add("recorder",[0,1,2],5,true);
		animation.play("recorder");
		scale.set(2,2);
		updateHitbox();

	}
}