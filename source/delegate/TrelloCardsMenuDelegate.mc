using Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.System as Sys;

class TrelloCardsMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {  
    		var cardService = new TrelloCarddService(new TrelloCardServiceDelegate());  	
    		cardService.getCardById(item.getId());	
    }

 function onBack() {
 		//Back to List       	
    	var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());
    	boardService.getBoardListsByBoardId(App.getApp().getProperty("current_board").get("id"));  
    }


}