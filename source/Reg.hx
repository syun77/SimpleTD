package;

import flash.geom.Matrix;
import flixel.util.FlxColor;
import flash.display.BitmapData;
class Reg {

    public static var PS:PlayState = null;

    // グリッドのサイズ
    public static inline var GRID_SIZE:Int = 8;

    /**
     * タイル画像
     **/
    public static var tileImage(get, null):BitmapData;
    private static function get_tileImage():BitmapData {
        // 24x8のタイル画像を作成
        var tile:BitmapData = new BitmapData(GRID_SIZE * 3, GRID_SIZE, false, FlxColor.BLACK);
        tile.draw(new BitmapData(GRID_SIZE, GRID_SIZE, false, FlxColor.GRAY), new Matrix(1, 0, 0, 1, GRID_SIZE * 1, 0));
        return tile;
    }

    /**
     * 敵画像
     **/
    public static var enemyImage(get, null):BitmapData;
    private static function get_enemyImage():BitmapData {
        var enemy:BitmapData = new BitmapData(6, 6, false, FlxColor.GREEN);
        var eye:BitmapData = new BitmapData(1, 2, false, FlxColor.WHITE);
        enemy.draw(eye, new Matrix(1, 0, 0, 1, 1, 1));
        enemy.draw(eye, new Matrix(1, 0, 0, 1, 4, 1));

        return enemy;
    }
}