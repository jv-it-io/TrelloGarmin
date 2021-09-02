import Toybox.Graphics;
import Toybox.WatchUi;

using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class TrelloBoardListsView extends WatchUi.View {

     hidden var _boardService;
     hidden var  _menuBoardItem;
     hidden var _memberName;
     hidden var _boardList;
     hidden var data;
     
	
	 function initialize(data) {
	 Sys.println("init");
        View.initialize();   
        _memberName = Application.getApp().getProperty("member_fullname");
        _menuBoardItem = new WatchUi.Menu2({:title=>_memberName}); 
        _boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());   
        _boardList = data;    
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
    	Sys.println("onShow");
    	
    	Sys.println("Data from board service ? " + _boardList);
	    addItemToMenu();
	    
	    var delegate = new TrelloBoarListsdMenuDelegate(); // a WatchUi.Menu2InputDelegate

//	    // Push the Menu2 View set up in the initializer
        WatchUi.pushView(_menuBoardItem, delegate, WatchUi.SLIDE_IMMEDIATE);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
    Sys.println("onUpdate");
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(){}
    
     function addItemToMenu(){
     	
     	
    	
    	if(_boardList != null && _boardList.size() > 0){
	    	for(var i=0;i<_boardList.size();i++){
	    		var item = _boardList[i];  	
	    		_menuBoardItem.addItem(
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
    		System.println("No board lists loaded");
    	}
    	
    }

}