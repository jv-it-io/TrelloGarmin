using Toybox.WatchUi;
using Toybox.WatchUi as Ui;

class TrelloBoarListsdMenuDelegate extends WatchUi.Menu2InputDelegate{
	function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        System.println(item.getId());
    }



}