import Toybox.Graphics;
import Toybox.WatchUi;

class TrelloLoginView extends WatchUi.View {

	hidden var _transaction;
	hidden var _running;
	
	 function initialize() {
        View.initialize();
       _transaction = new TrelloLoginTransaction(new TrelloLoginTransactionDelegate());
       _running = false;
       
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
     if(_running == false) {
        System.println("running is false");
            _transaction.requestAccessToken();
            _running = true;
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(){}

}