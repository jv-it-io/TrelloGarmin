using Toybox.WatchUi;
using Toybox.WatchUi as Ui;

class TrelloCardsMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        System.println(item.getId());
    }



}