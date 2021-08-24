using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class TrelloLoginDelegate extends Ui.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
        Sys.println("login delegate");
    }

}