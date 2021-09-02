using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloBoardServiceDelegate{

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
    function handleResponse(data) {
    	System.println("handle response for board information");
    	System.println(data);
		Ui.switchToView(new TrelloBoardListsView(data), null, Ui.SLIDE_IMMEDIATE);
    }
    
    function handleResponseBoardDetails(data){
    	var boardService = new TrelloBoardService(self);
    	App.getApp().setProperty("current_board", data);
    	boardService.getBoardListsByBoardId($.boardIdMock); 
    	
    }
  

}