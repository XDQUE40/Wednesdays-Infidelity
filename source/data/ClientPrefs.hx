package data;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxSave;
import input.Controls;
import input.PlayerSettings;
import states.menus.TitleState;

class ClientPrefs
{
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var shake:Bool = true;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Time Left';
	public static var scoreZoom:Bool = true;
	public static var noReset:Bool = false;
	public static var healthBarAlpha:Float = 1;
	public static var controllerMode:Bool = true;
	public static var hitsoundVolume:Float = 0;
	public static var pauseMusic:String = 'Tea Time';
	public static var botPlay:Bool = false;
	public static var comboOffset:Array<Int> = [0, 0, 0, 0];
	public static var ratingOffset:Int = 0;
	public static var sickWindow:Int = 45;
	public static var goodWindow:Int = 90;
	public static var badWindow:Int = 135;
	public static var safeFrames:Float = 10;
	public static var shaders:Bool = true;
	public static var intensiveShaders:Bool = false;
	public static var doNotShowWarnings:Bool = false;
	public static var hudStyle:String = "Box Funkin";
	public static var nubMode:Bool = false;

	// Every key has two binds, add your key bind down here and then add your control on options/ControlsSubState.hx and Controls.hx
	public static var keyBinds:Map<String, Array<FlxKey>> = [
		// Key Bind, Name for ControlsSubState
		'note_left' => [A, LEFT],
		'note_down' => [S, DOWN],
		'note_up' => [W, UP],
		'note_right' => [D, RIGHT],
		'dodge' => [SPACE, NONE],
		'ui_left' => [A, LEFT],
		'ui_down' => [S, DOWN],
		'ui_up' => [W, UP],
		'ui_right' => [D, RIGHT],
		'accept' => [SPACE, ENTER],
		'back' => [BACKSPACE, ESCAPE],
		'pause' => [ENTER, ESCAPE],
		'reset' => [R, NONE],
		'volume_mute' => [ZERO, NONE],
		'volume_up' => [NUMPADPLUS, PLUS],
		'volume_down' => [NUMPADMINUS, MINUS],
		'debug_1' => [SEVEN, NONE],
		'debug_2' => [EIGHT, NONE],
		'fullscreen' => [F11, NONE]
	];
	public static var defaultKeys:Map<String, Array<FlxKey>> = null;

	public static function loadDefaultKeys()
	{
		defaultKeys = keyBinds.copy();
		// trace(defaultKeys);
	}

	public static function saveSettings()
	{
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.shake = shake;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.framerate = framerate;
		// FlxG.save.data.cursing = cursing;
		// FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.scoreZoom = scoreZoom;
		FlxG.save.data.noReset = noReset;
		FlxG.save.data.healthBarAlpha = healthBarAlpha;
		FlxG.save.data.comboOffset = comboOffset;

		FlxG.save.data.ratingOffset = ratingOffset;
		FlxG.save.data.sickWindow = sickWindow;
		FlxG.save.data.goodWindow = goodWindow;
		FlxG.save.data.badWindow = badWindow;
		FlxG.save.data.safeFrames = safeFrames;
		FlxG.save.data.controllerMode = controllerMode;
		FlxG.save.data.hitsoundVolume = hitsoundVolume;
		FlxG.save.data.pauseMusic = pauseMusic;
		FlxG.save.data.botPlay = botPlay;
		FlxG.save.data.shaders = shaders;
		FlxG.save.data.intensiveShaders = intensiveShaders;
		FlxG.save.data.doNotShowWarnings = doNotShowWarnings;
		FlxG.save.data.hudStyle = hudStyle;
		FlxG.save.data.nubMode = nubMode;

		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); // Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs()
	{
		if (FlxG.save.data.downScroll != null)
		{
			downScroll = FlxG.save.data.downScroll;
		}
		if (FlxG.save.data.middleScroll != null)
		{
			middleScroll = FlxG.save.data.middleScroll;
		}
		if (FlxG.save.data.showFPS != null)
		{
			showFPS = FlxG.save.data.showFPS;
			if (Main.fpsVar != null)
			{
				Main.fpsVar.visible = showFPS;
			}
		}
		if (FlxG.save.data.flashing != null)
		{
			flashing = FlxG.save.data.flashing;
		}

		if (FlxG.save.data.shake != null)
		{
			shake = FlxG.save.data.shake;
		}

		if (FlxG.save.data.globalAntialiasing != null)
		{
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if (FlxG.save.data.noteSplashes != null)
		{
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if (FlxG.save.data.framerate != null)
		{
			framerate = FlxG.save.data.framerate;
			if (framerate > FlxG.drawFramerate)
			{
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			}
			else
			{
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
				cursing = FlxG.save.data.cursing;
			}
			if(FlxG.save.data.violence != null) {
				violence = FlxG.save.data.violence;
		}*/
		if (FlxG.save.data.camZooms != null)
		{
			camZooms = FlxG.save.data.camZooms;
		}
		if (FlxG.save.data.hideHud != null)
		{
			hideHud = FlxG.save.data.hideHud;
		}
		if (FlxG.save.data.noteOffset != null)
		{
			noteOffset = FlxG.save.data.noteOffset;
		}
		if (FlxG.save.data.arrowHSV != null)
		{
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if (FlxG.save.data.ghostTapping != null)
		{
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if (FlxG.save.data.timeBarType != null)
		{
			timeBarType = FlxG.save.data.timeBarType;
		}
		if (FlxG.save.data.scoreZoom != null)
		{
			scoreZoom = FlxG.save.data.scoreZoom;
		}
		if (FlxG.save.data.noReset != null)
		{
			noReset = FlxG.save.data.noReset;
		}
		if (FlxG.save.data.healthBarAlpha != null)
		{
			healthBarAlpha = FlxG.save.data.healthBarAlpha;
		}
		if (FlxG.save.data.comboOffset != null)
		{
			comboOffset = FlxG.save.data.comboOffset;
		}

		if (FlxG.save.data.ratingOffset != null)
		{
			ratingOffset = FlxG.save.data.ratingOffset;
		}
		if (FlxG.save.data.sickWindow != null)
		{
			sickWindow = FlxG.save.data.sickWindow;
		}
		if (FlxG.save.data.goodWindow != null)
		{
			goodWindow = FlxG.save.data.goodWindow;
		}
		if (FlxG.save.data.badWindow != null)
		{
			badWindow = FlxG.save.data.badWindow;
		}
		if (FlxG.save.data.safeFrames != null)
		{
			safeFrames = FlxG.save.data.safeFrames;
		}
		if (FlxG.save.data.controllerMode != null)
		{
			controllerMode = FlxG.save.data.controllerMode;
		}
		if (FlxG.save.data.hitsoundVolume != null)
		{
			hitsoundVolume = FlxG.save.data.hitsoundVolume;
		}
		if (FlxG.save.data.pauseMusic != null)
		{
			pauseMusic = FlxG.save.data.pauseMusic;
		}

		// flixel automatically saves your volume!
		if (FlxG.save.data.volume != null)
		{
			FlxG.sound.volume = FlxG.save.data.volume;
		}
		if (FlxG.save.data.mute != null)
		{
			FlxG.sound.muted = FlxG.save.data.mute;
		}

		if (FlxG.save.data.botPlay != null)
		{
			botPlay = FlxG.save.data.botPlay;
		}

		if (FlxG.save.data.shaders != null)
		{
			shaders = FlxG.save.data.shaders;
		}

		if (FlxG.save.data.intensiveShaders != null)
		{
			intensiveShaders = FlxG.save.data.intensiveShaders;
		}

		if (FlxG.save.data.doNotShowWarnings != null)
		{
			doNotShowWarnings = FlxG.save.data.doNotShowWarnings;
		}

		if (FlxG.save.data.nubMode != null)
		{
			nubMode = FlxG.save.data.nubMode;
		}

		if (FlxG.save.data.hudStyle != null)
		{
			hudStyle = FlxG.save.data.hudStyle;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if (save != null && save.data.customControls != null)
		{
			var loadedControls:Map<String, Array<FlxKey>> = save.data.customControls;
			for (control => keys in loadedControls)
			{
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	public static function reloadControls()
	{
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);

		TitleState.muteKeys = copyKey(keyBinds.get('volume_mute'));
		TitleState.volumeDownKeys = copyKey(keyBinds.get('volume_down'));
		TitleState.volumeUpKeys = copyKey(keyBinds.get('volume_up'));
		Main.fullscreenKeys = copyKey(keyBinds.get('fullscreen'));
		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
	}

	public static function copyKey(arrayToCopy:Array<FlxKey>):Array<FlxKey>
	{
		var copiedArray:Array<FlxKey> = arrayToCopy.copy();
		var i:Int = 0;
		var len:Int = copiedArray.length;

		while (i < len)
		{
			if (copiedArray[i] == NONE)
			{
				copiedArray.remove(NONE);
				--i;
			}
			i++;
			len = copiedArray.length;
		}
		return copiedArray;
	}
}
