using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class TrelloLoginDelegate extends Ui.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
        Sys.println("login delegate");
    }


  // Handle a error from the server
    function handleError(code) {
    System.println("error code : " + code);
        var msg = ""; //WatchUi.loadResource( Rez.Strings.error );
        msg += code;
      //  Ui.switchToView(new ErrorView(msg), null, Ui.SLIDE_IMMEDIATE);
    }

    // Handle a successful response from the server
    function handleResponse(data, memberName) {
    System.println("handle response login transaction");
    System.println(data);

        // Store the access and refresh tokens in properties
        // For app store apps the properties are encrypted using
        // a randomly generated key
//        App.getApp().setProperty("refresh_token", data["refresh_token"]);
//        App.getApp().setProperty("access_token", data["access_token"]);
        // Store away the athlete id
//        App.getApp().setProperty("athlete_id", data["athlete"]["id"]);
        // Switch to the data view
     //   App.getApp().setProperty("member_fullname", memberName);
       // App.getApp().setProperty("board_data", data);
        
    //    Ui.switchToView(new trello_garmin_appView(), null, Ui.SLIDE_IMMEDIATE);
    }
}