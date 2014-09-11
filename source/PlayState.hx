package;

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
    private static inline var GRID_SIZE:Int = Reg.GRID_SIZE; // グリッドサイズ
    private static inline var START_X:Int = GRID_SIZE * 2 + 1; // 開始座標(X)
    private static inline var START_Y:Int = GRID_SIZE * 0; // 開始座標(Y)
    private static inline var END_X:Int = GRID_SIZE * 17 + 2; // 終端座標(X)
    private static inline var END_Y:Int = GRID_SIZE * 14; // 終端座標(Y)

    private static inline var MONEY_INITIALIZE:Int = 300; // お金の初期状態

    // ゲームオブジェクト
    private var _map:FlxTilemap;
    private var _enemy:Enemy;

    // ボタン
    private var _btnBuy:FlxButton2; // 購入

    // テキスト
    private var _txtMoney:FlxText;

    // 変数
    private var _money:Int = MONEY_INITIALIZE; // 所持金

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
        _txtMoney = new FlxText(FlxG.width - 128, 8, 128);
        _txtMoney.alignment = "right";
        this.add(_txtMoney);
        addMoney(0);

        // ボタン作成
        _btnBuy = new FlxButton2(FlxG.width-64, FlxG.height-32, "BUY", _cbBuy);
        this.add(_btnBuy);

        // 変数初期化


        FlxG.debugger.toggleKeys = ["ALT"];
    }

    private function _cbBuy():Void {
        trace("buy.");
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

        if(_enemy.y >= END_Y - GRID_SIZE) {
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