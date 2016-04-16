import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class FloatingText extends FlxSprite
{
	var textField:FlxText;
	public function new(x:Float, y:Float,text:String,color:Int) 
	{
		super(x,y);
		makeGraphic(1,1,0x00000000);
		textField = new FlxText(x,y,300,text);
		textField.setFormat(null,32,color,"center",FlxTextBorderStyle.SHADOW,0xFFFFFFFF);
		FlxG.state.add(textField);
		acceleration.y = 1000+Math.random()*300;
		velocity.y = -400-Math.random()*200;
		velocity.x = -100+Math.random()*200;
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