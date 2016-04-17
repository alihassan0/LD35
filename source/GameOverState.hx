package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;

class GameOverState extends FlxState
{
	private var title:FlxText;
	override public function create():Void
	{
		super.create();
		title = new FlxText(0,100,FlxG.width,"Game Over");
		title.setFormat(null,32,0xFFFFFFFF,"center");
		add(title);

		var actualReason:String = "They found you dead in a deserted rood\n"+ 
									"with signs of severe torturing\n"+
									"only three people attended your funeral\n"+
									"Later that day .. a new TV host was hosting your show";

		var reason:FlxText = new FlxText(0,180,FlxG.width,actualReason);
		reason.setFormat(null,16,0xFFFFFFFF,"center");
		add(reason);

		var _emitter:FlxEmitter = new FlxEmitter(FlxG.width / 2 , 0, 200);
		_emitter.launchMode = FlxEmitterMode.CIRCLE;
        _emitter.launchAngle.set(105, 165);
		// All we need to do to start using it is give it some particles. makeParticles() makes this easy!
		
		_emitter.makeParticles(2, 2, 0xFFFFFFFF,2000);
		//_emitter.launchMode = FlxEmitterMode.SQUARE;
		_emitter.lifespan.set(150, 150);
		_emitter.setSize(FlxG.width,100);
		_emitter.speed.set( 150, 200, 150, 200);
		
		//_emitter.velocity.set(-50, -40, 60, 80,-100, -80, 120, 160);
		// Now let's add the emitter to the state.
		_emitter.scale.set(1, 1, 1, 1, 2, 2, 4, 4);
		add(_emitter);
		_emitter.start(false, 0.01);
		/*
		var rainEmitter:FlxEmitter = new FlxEmitter(200,200, 200);
		rainEmitter.launchMode = FlxEmitterMode.SQUARE;
        rainEmitter.launchAngle.set(-45, 45);
        //rainEmitter.setSize(FlxG.width, 0);
        //rainEmitter.speed.set(40,60,80,120);
        //rainEmitter.velocity.set(4,6,8,12);
        //rainEmitter.velocity.set(-50, -40, 60, 80,-100, -80, 120, 160);
        //rainEmitter.setYSpeed(50, 50);
        //rainEmitter.angle.set(0,0,0,0);
        add(rainEmitter);
         
        rainEmitter.makeParticles(2, 6, 0xFFFFFFFF, 200);
         
        rainEmitter.start(false	, 0.01);
		*/
		add(new FlxText(0,400,FlxG.width,"Press space to restart").setFormat(null,24,0xFFCCCCCC,"center"));

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE)
			FlxG.switchState(new PlayState());
	}
}
