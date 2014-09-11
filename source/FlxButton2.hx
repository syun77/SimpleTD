package ;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;

/**
 * 独自のカスタムボタン
 **/
class FlxButton2 extends FlxButton {

    /**
     * コンストラクタ
     * @param X 座標(X)
     * @param Y 座標(Y)
     * @param Label ラベル名
     * @param OnDown クリック時のコールバック関数
     * @param Width  ボタンの幅
     **/
    public function new(X:Float, Y:Float, Label:String, ?OnDown:Void -> Void, Width = -1) {

        // 初期化
        super(X, Y, Label, OnDown);

        // 幅の指定を反映
        if(Width > 0) {
            width = Width;
        }
        else {
            // ラベル名から幅を決定
            width = Label.length * 12;
        }

        // 高さは20固定
        height = 20;
        label.alpha = 1;
        set_status(status);

        // ボタン画像作成
        makeGraphic(Std.int(width), Std.int(height), FlxColor.BLACK);
    }

    /**
     * ボタン状態の変化
     **/
    override private function set_status(Value:Int):Int {
        if(label != null) {
            if(Value == FlxButton.HIGHLIGHT) {
                // マウスが上に乗っている場合
                //#if mobile
                label.color = FlxColor.WHITE;
                label.borderStyle = FlxText.BORDER_OUTLINE_FAST;
                label.borderColor = FlxColor.BLACK;
                //#end
            }
            else {
                label.color = FlxColor.BLACK;
                label.borderStyle = FlxText.BORDER_OUTLINE_FAST;
                label.borderColor = FlxColor.WHITE;
            }
        }

        return status = Value;
    }
}
