using Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;


class TrelloBoardMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        var boardDetailService = new TrelloBoardInformationService(new TrelloBoardServiceDelegate());
        boardDetailService.getBoardDetails(item.getId());
    }



}