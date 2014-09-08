package;

import flixel.tile.FlxTilemap;
import flixel.FlxState;
import openfl.Assets;

/**
 * メインゲーム
 **/
class PlayState extends FlxState {
    private var _map:FlxTilemap;

    /**
     * 生成
     **/
    override public function create():Void {
        var csvMap = Assets.getText("assets/data/map.csv");
        _map = new FlxTilemap().loadMap(csvMap, Reg.tileImage);
        this.add(_map);
        super.create();
    }

    /**
     * 破棄
     **/
    override public function destroy():Void {
        super.destroy();
    }

    /**
     * 更新
     **/
    override public function update():Void {
        super.update();
    }
}