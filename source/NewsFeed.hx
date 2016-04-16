import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.addons.plugin.FlxScrollingText;
import flash.geom.Rectangle;

import flixel.addons.text.FlxTypeText;

class NewsFeed extends FlxSprite{
	public var newsTextField:FlxTypeText;
	
	public var scrollingText:FlxSprite;


	public function new(x:Int, y:Int) {
		super(x,y);
		makeGraphic(140,240,0xCC0000FF);
		FlxG.state.add(this);

		newsTextField = new FlxTypeText(x,y+40,Math.floor(this.width),"news",12);
		newsTextField.delay = 0.1;
		newsTextField.eraseDelay = 0.2;
		newsTextField.setTypingVariation(0.75, true);
		newsTextField.skipKeys = ["SPACE"];
		FlxG.state.add(newsTextField);
		/*newsTextField.sounds = [ FlxG.sound.load(FlxAssets.getSound("assets/type01")),
		                     FlxG.sound.load(FlxAssets.getSound("assets/type02")) ];*/
		
		
		FlxG.state.add(new FlxSprite(x,y).makeGraphic(Math.floor(this.width),40,0xFFFF0000));
		
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
		
	}
}