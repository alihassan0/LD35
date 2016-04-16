import flixel.FlxSprite;
import flixel.FlxG;

class TV extends FlxSprite{
	public function new(x:Int, y:Int) {
		super(x,y);
		loadGraphic("assets/images/tv.png",true,65,50);
		animation.add("noSignal",[0,1,2],30,true);
		animation.play("noSignal");
		scale.set(1.5,1.5);
		updateHitbox();

	}
}