import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class NewsFeed extends FlxSprite{
	private var newsTextField:FlxText;
	private var desiredText:String;
	private var textTimer:FlxTimer;	
	private var timerSpeed:Float = .1;
	private var brakingNewsTextField:FlxText;

	public function new(x:Int, y:Int) {
		super(x,y);
		makeGraphic(70,120,0xFF0000FF);
		FlxG.state.add(this);

		newsTextField = new FlxText(x,y+20,this.width,"news",4);
		FlxG.state.add(newsTextField);
		
		FlxG.state.add(new FlxSprite(x,y).makeGraphic(Math.floor(this.width),20,0xFFFF0000));
		
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