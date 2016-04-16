import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxSound;

class Sound{
	private static var cheer:FlxSound;
	private static var select:FlxSound;

	public static function init() {
		cheer = FlxG.sound.load("assets/sounds/cheering3.ogg");
		select = FlxG.sound.load("assets/sounds/select.wav");
	}
	public static function play(sound:String) {
		switch (sound) 
		{
			case "cheer":
				cheer.play();
			case "select":
				select.play();
				
		}
		
	}
}