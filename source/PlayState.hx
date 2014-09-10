package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
import openfl.Assets;

/**
 * メインゲーム
 **/
class PlayState extends FlxState {
    private static inline var GRID_SIZE:Int = Reg.GRID_SIZE;
    private static inline var START_X:Int = GRID_SIZE * 2 + 1;
    private static inline var START_Y:Int = GRID_SIZE * 0;
    private static inline var END_X:Int = GRID_SIZE * 17 + 2;
    private static inline var END_Y:Int = GRID_SIZE * 14;

    // ゲームオブジェクト
    private var _map:FlxTilemap;
    private var _enemy:Enemy;

    // テキスト
    private var _txtMoney:FlxText;

    // 変数
    private var _money:Int = 0; // 所持金

    /**
     * 生成
     **/
    override public function create():Void {
        super.create();
        Reg.PS = this;

        // マップ読み込み。0が通過可能
        var csvMap = Assets.getText("assets/data/map.csv");
        _map = new FlxTilemap().loadMap(csvMap, Reg.tileImage);
        this.add(_map);

        _enemy = new Enemy(START_X, START_Y);
        this.add(_enemy);
        _enemyFollowPath();

        // テキスト
        _txtMoney = new FlxText(FlxG.width-128, 8, 128);
        _txtMoney.alignment = "right";
//        _txtMoney.color = FlxColor.WHITE;
        this.add(_txtMoney);

        // 変数初期化
        _money = 0;

        addMoney(0);

        FlxG.debugger.toggleKeys = ["ALT"];
    }

    public function addMoney(v:Int):Void {
        _money += v;
        _txtMoney.text = "MONEY: " + _money;
    }

    /**
     * 破棄
     **/
    override public function destroy():Void {
        super.destroy();
        Reg.PS = null;
    }

    /**
     * 更新
     **/
    override public function update():Void {
        super.update();

        if(_enemy.y >= END_Y-GRID_SIZE) {
            // やり直す
            _enemyFollowPath();
        }

        if(FlxG.keys.justPressed.ESCAPE) {
            throw "Terminate.";
        }
    }

    /**
     * 敵を迷路にそって動かす
     **/
    private function _enemyFollowPath():Void {
        var start = FlxPoint.get(START_X, START_Y);
        var end = FlxPoint.get(END_X, END_Y);
        var pList:Array<FlxPoint> = _map.findPath(start, end);
        _enemy.followPath(pList);
    }
}