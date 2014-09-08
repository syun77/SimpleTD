package;

import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
import openfl.Assets;

/**
 * メインゲーム
 **/
class PlayState extends FlxState {
    private var _map:FlxTilemap;
    private var _enemy:Enemy;

    /**
     * 生成
     **/
    override public function create():Void {
        super.create();

        var csvMap = Assets.getText("assets/data/map.csv");
        _map = new FlxTilemap().loadMap(csvMap, Reg.tileImage);
        this.add(_map);

        _enemy = new Enemy(16, 16);
        this.add(_enemy);
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

        if(FlxG.keys.justPressed.ESCAPE) {
            throw "Terminate.";
        }
    }
}