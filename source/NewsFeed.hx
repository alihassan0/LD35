import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.addons.plugin.FlxScrollingText;
import flash.geom.Rectangle;
import flixel.system.FlxAssets;


import flixel.addons.text.FlxTypeText;

using flixel.util.FlxSpriteUtil;

class NewsFeed extends FlxSprite{
	public var newsTextField:FlxTypeText;
	
	public var scrollingText:FlxSprite;

	public function new(x:Int, y:Int) {
		super(x,y);

		makeGraphic(270,190,0x00000000);
		var lineStyle = { color: 0xFF000000, thickness: 3.0 };
		drawRoundRect(0, 0, this.width, this.height, 15, 15, 0xFF333333,lineStyle);
		
		//FlxG.state.add(this);

		newsTextField = new FlxTypeText(x+10,y+30,Math.floor(this.width)-20,"news",12);
		newsTextField.delay = 0.1;
		newsTextField.eraseDelay = 0.2;
		newsTextField.setTypingVariation(0.5, true);
		newsTextField.skipKeys = ["SPACE"];
		FlxG.state.add(newsTextField);
		newsTextField.sounds = [ FlxG.sound.load("assets/sounds/type01.ogg",.2),
		                     FlxG.sound.load("assets/sounds/type02.ogg",.2)];
		
		
		FlxG.state.add(new FlxSprite(x,y).makeGraphic(Math.floor(this.width),20,0xFFFF0000));
		
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
		scrollingText = FlxScrollingText.add(tf3,new Rectangle(0,0,this.width,200),1,0," Breaking news *** Breaking news ***");
		scrollingText.setPosition(x+5,y+5);
		FlxG.state.add(scrollingText);
	}
	public function changeText(newText:String)
	{
		
	}
	override public function destroy():Void
	{
		//	Important! Clear out the plugin otherwise it'll crash when changing state
		FlxScrollingText.clear();
		
		super.destroy();
	}
}