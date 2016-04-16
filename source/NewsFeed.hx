import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class NewsFeed extends FlxSprite{
	private var newsTextField:FlxText;
	private var desiredText:String;
	private var textTimer:FlxTimer;	
	private var timerSpeed:Float = .1;
	
	public function new(x:Int, y:Int) {
		super(x,y);
		makeGraphic(70,120,0xFF0000FF);
		FlxG.state.add(this);
		newsTextField = new FlxText(x,y,this.width,"news",8);
		FlxG.state.add(newsTextField);
		textTimer = new FlxTimer();
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