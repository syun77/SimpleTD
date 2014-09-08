package;

import flash.geom.Matrix;
import flixel.util.FlxColor;
import flash.display.BitmapData;
class Reg {

    public static var tileImage(get, null):BitmapData;
    public static function get_tileImage():BitmapData {
        var tile:BitmapData = new BitmapData(8 * 3, 8, false, FlxColor.BLACK);
        tile.draw(new BitmapData(8, 8, false, FlxColor.GRAY), new Matrix(1, 0, 0, 1, 8, 0));
        return tile;
    }
}