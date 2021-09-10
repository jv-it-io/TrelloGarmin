using Toybox.WatchUi;
using Toybox.WatchUi as Ui;

class TrelloBoardMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var boardDetailService = new TrelloBoardInformationService(new TrelloBoardServiceDelegate());
        boardDetailService.getBoardDetails(item.getId());
    }



}