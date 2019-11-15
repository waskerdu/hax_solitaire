package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxBasic;
import flixel.math.FlxPoint;

class Stack extends FlxBasic
{
    public var position:FlxPoint;
    var common:Stack;
    public var Cards:Array<Card>;
    var Stacks:Array<Stack>;
    override public function new(x:Float, y:Float, common:Stack, Stacks:Array<Stack>):Void 
    {
        this.position = new FlxPoint(x, y);
        this.common = common;
        Cards = new Array<Card>();
        this.Stacks = Stacks;
        super();
    }
    override public function draw() {
        for(card in Cards){card.draw();}
        super.draw();
    }
    override public function update(elapsed:Float) {
        for(card in Cards){card.update(elapsed);}
        super.update(elapsed);
    }
    public function fabCard(index:Int) 
    {
        var card = new Card(position.x, position.y + this.Cards.length*10, index, this);
        //Cards.push(card);
    }
    public function addCard(card:Card){
        if(common!=null)
        {
            card.x = position.x;
            card.y = position.y + this.Cards.length*10;
            Cards.push(card);
        }
        //card.x = position.x;
        //card.y = position.y + this.Cards.length*10;
       
    }
    public function popCards(index:Int) 
    {
        for (i in index...this.Cards.length)
        {
            var currentCard = Cards.pop();
            currentCard.setParent(this.common);
            currentCard.setSelected(true);
            this.common.Cards.insert(0, currentCard);
        }
    }
    public function pushCards() // common stack only
    {
        //Cards.reverse();
        var currentCard:Card;
        var stackIndex = Math.floor(FlxG.mouse.x / 100)-1;
        for (i in 0...this.Cards.length)
        {
            currentCard = Cards[0];
            Cards.remove(currentCard);
            currentCard.setSelected(false);
            if(stackIndex>-1 && stackIndex<4){currentCard.setParent(Stacks[stackIndex]);}
            else{currentCard.resetParent();}
        }
    }
}