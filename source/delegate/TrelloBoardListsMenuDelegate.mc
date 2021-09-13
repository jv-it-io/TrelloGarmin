using Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;


class TrelloBoarListsdMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {    
    	//get list details + below code in the delegate  
    	var listService = new TrelloListService(new TrelloListServiceDelegate());
    	listService.getListDetailsById(item.getId());
    }


 	function onBack() {
 		//Back to List       	
    	var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());
		boardService.getBoards();  
    }


}