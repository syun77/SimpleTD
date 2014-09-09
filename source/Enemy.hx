package ;

import flixel.util.FlxPath;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
/**
 * 敵
 **/
class Enemy extends FlxSprite {

    /**
     * コンストラクタ
     **/
    public function new(X:Float, Y:Float) {
        super(X, Y, Reg.enemyImage);
    }

    /**
     * 移動パスの作成
     **/
    public function followPath(path:Array<FlxPoint>):Void {

        if(path == null) {
            throw("No valid path was passed to the enemy! Does the tilemap provide a valid path from start to finish?");
        }

        // 初期位置を設定
        x = path[0].x;
        y = path[0].y;

        // パスの生成
        var spd = 50; // 移動速度
        var mode = FlxPath.FORWARD; // 動作モード (前に進む)
        var bAutoRotate = true;
        new FlxPath(this, path, spd, mode, bAutoRotate);
    }
}
