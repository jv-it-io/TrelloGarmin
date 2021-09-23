import Toybox.Graphics;
import Toybox.WatchUi;

using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Application as App;

class TrelloCardsView extends WatchUi.View {

     hidden var  _menuCardItem;
     hidden var _cardList;
     hidden var _currentListName;
     
	
	 function initialize(data) {
	 Sys.println("init Cards View");
        View.initialize();   
        _currentListName = App.getApp().getProperty("current_list").get("name");
        _menuCardItem = new WatchUi.Menu2({:title=>_currentListName}); 
        _cardList = data;  
        
        
        //data = _boardService.getBoardListsByBoardId(_boardId);
       
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    Sys.println("onLayout");
        setLayout(Rez.Layouts.BoardLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    	if(_cardList.size() > 0){
    		 addItemToMenu();
	    
	    	var delegate = new TrelloCardsMenuDelegate(); // 

		    // Push the Menu2 View set up in the initializer
	        WatchUi.pushView(_menuCardItem, delegate, WatchUi.SLIDE_IMMEDIATE);
    	}else{
    		System.println("No card lists loaded");
        	//Swith to no element view
        	Ui.switchToView(new TrelloNoElementView("No Cards in " + _currentListName), null, Ui.SLIDE_IMMEDIATE);
    	}
        
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
     	
     	
    	
    	if(_cardList != null && _cardList.size() > 0){
	    	for(var i=0;i<_cardList.size();i++){
	    		var item = _cardList[i];  	
	    		_menuCardItem.addItem(
	            new WatchUi.MenuItem(
	
	                // Set the 'Label' parameter
//	               item.getBoardName(),
	               item.get("name"),

	
	                // Set the `subLabel` parameter
	                "",
	
	                // Set the `identifier` parameter
//	                item.getId(),
	                item.get("id"),

	                // Set the options, in this case `null`
	                {}
	              )
	        	 );
    		   }	
			}
    	else{
    		
    	}
    	
    }

}