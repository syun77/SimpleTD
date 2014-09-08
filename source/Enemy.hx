package ;

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
}
