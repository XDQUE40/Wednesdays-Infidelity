package vlc;

import flixel.text.FlxText;
// import flixel.FlxState;
import flixel.FlxG;
// import flixel.FlxSubState;
import flixel.FlxBasic;

import extension.webview.WebView;

using StringTools;

class MP4Handler extends FlxBasic
{
	public static var androidPath:String = 'file:///android_asset/';

	public static var source1:String = 'assets/videos/';

	// public var nextState:FlxState;
	
	public var canSkip:Bool = true;

    public var finishCallback:Void->Void = null;

	public function new(source:String)
	{
		super();

		// text = new FlxText(0, 0, 0, "Video Exited! Tap to Continue", 48);
		// text.screenCenter();
		// text.alpha = 0;
		// add(text);

		// will fix later -Daninnocent

		// nextState = toTrans;

		//FlxG.autoPause = false;

		WebView.onClose=onClose;
		WebView.onURLChanging=onURLChanging;

		WebView.open(androidPath + source1 + source + '.html', false, null, ['http://exitme(.*)']);
	}

	public override function update(dt:Float) {
		for (touch in FlxG.touches.list)
			if (touch.justReleased && canSkip)
				if(finishCallback != null) finishCallback();

                if(FlxG.android.justReleased.BACK)
                {
                   if(finishCallback != null) finishCallback();
                }

		super.update(dt);	
	}

	function onClose(){// not working
	 	trace('video closed lmao');
		if (finishCallback != null)
		{
			finishCallback();
		}
	 }

	function onURLChanging(url:String) {
		if (url == 'http://exitme/') if(finishCallback != null) finishCallback(); // drity hack lol
		trace("WebView is about to open: "+url);
	}
}
