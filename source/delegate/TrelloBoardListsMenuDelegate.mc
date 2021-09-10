using Toybox.WatchUi;
using Toybox.WatchUi as Ui;

class TrelloBoarListsdMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
         var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());
        boardService.getCardsFromAListOfABoard(item.getId());
    }



}