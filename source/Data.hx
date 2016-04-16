import flixel.FlxSprite;
import flixel.FlxG;

class Data {
	public static var events = [
		{"choices":[{text:"The president just announced state of emergency across country due to recent demonstrations.",reaction:"0"},
		{text:"Please take care of those savage protesters .. this law is only to protect us.",reaction:"-10"},
		{text:"Our Dictator just announced some new rules .. like his cops are not powerful enough already ",reaction:"+5"},
		{text:"If you have nothing to lose .. then you have nothing to hide.",reaction:"-2"}]
		},
		{"choices":[{text:"A huge ship just sank and all passenger froze in the sea without a single rescue boat",reaction:"0"},
		{text:"It’s just an accident. It happens all over the world.",reaction:"-7"},
		{text:"We need to investigate this thoroughly",reaction:"+2"},
		{text:"The transportation minister should be submitted to trials",reaction:"+5"}]
		},
		{"choices":[{text:"Many of our biggest national companies were sold to the private sector . And thousands of employees got laid out.",reaction:"0"},
		{text:"This is all to encourage foreign investment.",reaction:"-5"},
		{text:"We should enforce laws to protect our people.",reaction:"+3"},
		{text:"Only lazy employees were fired. You don’t want to get fired work hard",reaction:"-8"}]
		},
		];
}