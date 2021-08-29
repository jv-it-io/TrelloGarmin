import Toybox.Graphics;
import Toybox.WatchUi;

using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class TrelloBoardView extends WatchUi.View {

     hidden var _memberName;
     hidden var  _menu;
     
	
	 function initialize() {
        View.initialize();   
        _memberName = Application.getApp().getProperty("member_fullname");
        _menu = new WatchUi.Menu2({:title=>_memberName});
        
       
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.BoardLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
	    addItemToMenu();
	    
	    var delegate = new TrelloBoardMenuDelegate(); // a WatchUi.Menu2InputDelegate

//	    // Push the Menu2 View set up in the initializer
        WatchUi.pushView(_menu, delegate, WatchUi.SLIDE_IMMEDIATE);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(){}
    
     function addItemToMenu(){
     	
     	var _boards = [];
    	
    	if(_boards != null && _boards.size() > 0){
	    	for(var i=0;i<_boards.size();i++){
	    		var item = _boards[i];  	
	    		_menu.addItem(
	            new WatchUi.MenuItem(
	
	                // Set the 'Label' parameter
//	               item.getBoardName(),
	
	                // Set the `subLabel` parameter
	                "",
	
	                // Set the `identifier` parameter
	                item.getId(),
	                // Set the options, in this case `null`
	                {}
	              )
	        	 );
    		   }	
			}
    	else{
    		System.println("No boards loaded");
    	}
    	
    }

}