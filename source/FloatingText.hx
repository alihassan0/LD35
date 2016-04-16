import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class FloatingText extends FlxSprite
{
	var textField:FlxText;
	public function new(x:Int, y:Int,text:String,color:Int) 
	{
		super(x,y);
		makeGraphic(1,1,0x00000000);
		textField = new FlxText(x,y,100,text);
		textField.setFormat(null,16,color,"center",FlxTextBorderStyle.SHADOW,0xFFFFFFFF);
		FlxG.state.add(textField);
		acceleration.y = 200;
		velocity.y = -100;
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		textField.setPosition(x,y);
		if(y < 0)
		{
			this.kill();
			textField.kill();
		}
	}
}