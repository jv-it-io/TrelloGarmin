import Toybox.Graphics;
import Toybox.WatchUi;

using Toybox.System as Sys;
using Toybox.Application as App;

class TrelloNoElementView extends WatchUi.View {
	
	hidden var _displayedMsg;
	
	 function initialize(message) {
	 Sys.println("init no element view");
	 	_displayedMsg = message;
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
     Sys.println("onLayout no element view");
        setLayout(Rez.Layouts.NoElementLayout(dc));
        var view = View.findDrawableById("message");
        view.setText(_displayedMsg);
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
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(){
    //back previous = list of column
    var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());	
    boardService.getBoardListsByBoardId(App.getApp().getProperty("current_board").get("id"));
    }

}