package data;

class CppAPI
{
	#if cpp
	public static function obtainRAM():Int
	{
		return WindowsData.obtainRAM();
	}

	public static function darkMode()
	{
	    #if desktop 
		WindowsData.setWindowColorMode(DARK);
		#end
	}

	public static function lightMode()
	{
	    #if desktop 
		WindowsData.setWindowColorMode(LIGHT);
		#end 
	}

	public static function setWindowOppacity(a:Float)
	{
	    #if desktop 
		WindowsData.setWindowAlpha(a);
		#end 
	}

	public static function _setWindowLayered()
	{
	    #if desktop 
		WindowsData._setWindowLayered();
		#end
	}
	#end
}
