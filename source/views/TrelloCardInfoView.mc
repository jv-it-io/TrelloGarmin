import Toybox.WatchUi;

using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;


class TrelloCardInfoView extends WatchUi.View {

     hidden var _card;
     hidden var _cardLabel;
     hidden var _arrayColor; 
     
	
	 function initialize(card) {
	 	Sys.println("init Card info View : " + card);
        View.initialize();  
        _card = card; 
        _cardLabel = _card.get("labels");
        _arrayColor = {"red"=> Gfx.COLOR_RED, "purple" => Gfx.COLOR_PURPLE};
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    
        setLayout(Rez.Layouts.CardInfoLayout(dc));
        var titleName = View.findDrawableById("name");
        titleName.setText(_card.get("name"));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    	        
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        Sys.println("Labels : " + _cardLabel[0]);
        dc.setColor(_arrayColor[_cardLabel[0].get("color")],Gfx.COLOR_TRANSPARENT);
		var cx = dc.getWidth() / 2;
		var cy = dc.getHeight() / 2;
		
		//dc.setPenWidth(4);
		
		dc.drawEllipse(cx, cy, cx - 3, cy - 3);
		dc.drawEllipse(cx, cy, cx - 2, cy - 2);
		dc.drawEllipse(cx, cy, cx - 1, cy - 1);
		dc.drawEllipse(cx, cy, cx , cy);
		dc.drawEllipse(cx, cy, cx + 1, cy + 1);
		
		//dc.setPenWidth(1);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(){
    }
    

}