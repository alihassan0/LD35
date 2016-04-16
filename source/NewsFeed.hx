import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class NewsFeed extends FlxSprite{
	public function new(x:Int, y:Int) {
		super(x,y);
		makeGraphic(40,40,0xFF0000FF);
		FlxG.state.add(this);
		FlxG.state.add(new FlxText(x,y,this.width,"news",8));
	}
}