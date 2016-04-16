import flixel.FlxSprite;
import flixel.FlxG;

class Data {
	public static function level1() {
		return {"choices":[{text:"The president just announced state of emergency across country due to recent demonstrations.",reaction:"0"},
				{text:"Please take care of those savage protesters .. this law is only to protect us.",reaction:"-5"},
				{text:"Our Dictator just announced some new rules .. like his cops are not powerful enough already ",reaction:"+5"},
				{text:"If you have nothing to lose .. then you have nothing to hide.",reaction:"+2"}]};
	}
}