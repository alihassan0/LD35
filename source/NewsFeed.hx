import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.addons.plugin.FlxScrollingText;
import flash.geom.Rectangle;

class NewsFeed extends FlxSprite{
	private var newsTextField:FlxText;
	private var desiredText:String;
	private var textTimer:FlxTimer;	
	private var timerSpeed:Float = .1;
	
	public var scrollingText:FlxSprite;


	public function new(x:Int, y:Int) {
		super(x,y);
		makeGraphic(140,240,0xCC0000FF);
		FlxG.state.add(this);

		newsTextField = new FlxText(x,y+40,this.width,"news",12);
		FlxG.state.add(newsTextField);
		
		FlxG.state.add(new FlxSprite(x,y).makeGraphic(Math.floor(this.width),40,0xFFFF0000));
		
		textTimer = new FlxTimer();
		addBreakingNews();
	}
	public function addBreakingNews()
	{
		var letters:String = " !\"#$%&'()*+,-./" + "0123456789:;<=>?" + "@ABCDEFGHIJKLMNO" + "PQRSTUVWXYZ[]^_" + "abcdefghijklmno" + "pqrstuvwxyz{|}~\\";
		var fontXNA:FlxBitmapFont = FlxBitmapFont.fromXNA("assets/fonts/fontData10pt.png", letters);
		
		var tf3:FlxBitmapText = new FlxBitmapText(fontXNA);
		tf3.y = 0;
		tf3.textColor = 0xFFFFFFFF;
		tf3.useTextColor = true;
		tf3.alignment = FlxTextAlign.LEFT;
		tf3.lineSpacing = 5;
		tf3.text = "Breaking news....";
		tf3.autoUpperCase = true;
		FlxG.state.add(tf3);
		
		FlxG.plugins.add(new FlxScrollingText());
		scrollingText = FlxScrollingText.add(tf3,new Rectangle(0,0,200,200),1,0," Breaking news ***");
		scrollingText.setPosition(505,45);//manually
		FlxG.state.add(scrollingText);
	}
	public function changeText(newText:String)
	{
		desiredText = newText;
		newsTextField.text = "";
		textTimer.start(timerSpeed,updateText,1);
	}
	private function updateText(t:FlxTimer)
	{
		if(newsTextField.text.length < desiredText.length)
		{
			newsTextField.text = desiredText.substring(0,newsTextField.text.length+1);
			textTimer.start(timerSpeed,updateText,1);
		}
	}
}