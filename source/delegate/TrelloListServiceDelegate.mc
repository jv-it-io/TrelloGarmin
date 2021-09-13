using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloListServiceDelegate{

    // Constructor
    function initialize() {
    }

    // Handle a error from the server
    function handleError(code) {
    System.println("error code Board Service : " + code);
        var msg = ""; 
        msg += code;
      	Ui.switchToView(new TrelloLoginErrorView(msg), null, Ui.SLIDE_IMMEDIATE);
    }

    // Handle a successful response from the server
    function handleListDetailsResponse(data) {
    	App.getApp().setProperty("current_list",data);
    	System.println("handle response for list information");
    	System.println(data);
    	//To change
	    var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());
        boardService.getCardsFromAListOfABoard(data.get("id"));
    }
    
     function handleCardsFromAListOfABoard(data){
    	App.getApp().setProperty("current_card",data);
    	Ui.switchToView(new TrelloCardsView(data), null, Ui.SLIDE_IMMEDIATE);
    }
    
 
  

}