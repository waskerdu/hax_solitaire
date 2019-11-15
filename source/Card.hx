package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
class Card extends FlxSprite
{
    var cardIndex:Int;
    var xOffset:Int = 0;
    var yOffset:Int = 0;
    public var selected:Bool = false;
    var parent:Stack = null;
    var oldParent:Stack = null;
    var index:Int;
    public function new(x:Float, y:Float, cardIndex:Int, parent:Stack):Void 
    {
        super(x, y);
        this.cardIndex = cardIndex;
        setParent(parent);
        loadGraphic('assets/images/Deck.png',true, 79, 123);
        animation.frameIndex = cardIndex; // 54 is the index of the flipped over subimage
        FlxMouseEventManager.add(this, onDown, onUp, onOver, onOut);
    }

    public function setSelected(selected:Bool) 
    {
        this.selected = selected;
        if(selected)
        {
            xOffset = FlxG.mouse.x - Std.int(x);
            yOffset = FlxG.mouse.y - Std.int(y);
        }
    }

    public function setParent(parent:Stack) 
    {
        if(this.parent == null){this.oldParent=parent;}
        this.oldParent = this.parent;
        this.parent=parent;
        index=parent.Cards.length;
        //this.parent.Cards.push(this);
        this.parent.addCard(this);
    }
    public function resetParent() {
        setParent(oldParent);
        //this.parent.Cards.push(this);
    }

    override public function update(elapsed:Float):Void
    {
        // movement
        if(selected)
        {
            x = FlxG.mouse.x - xOffset;
            y = FlxG.mouse.y - yOffset;
        }
        super.update(elapsed);
    }

    function onDown(object:FlxObject)
    {
        selected = !selected;
        setSelected(selected);
        if(selected)
        {
            trace(cardIndex);
            parent.popCards(index);
        }
        else{parent.pushCards();}
        
    }
    function onUp(object:FlxObject){}
    function onOver(object:FlxObject){}
    function onOut(object:FlxObject){}

    override public function destroy():Void
	{
		FlxMouseEventManager.remove(this);
		super.destroy();
	}
}