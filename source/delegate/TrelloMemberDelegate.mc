using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloMemberDelegate{

    // Constructor
    function initialize() {
    }

    // Handle a error from the server
    function handleError(code) {
    System.println("error code member service : " + code);
        var msg = ""; //WatchUi.loadResource( Rez.Strings.error );
        msg += code;
      	Ui.switchToView(new TrelloLoginErrorView(msg), null, Ui.SLIDE_IMMEDIATE);
    }

    // Handle a successful response from the server
    function handleResponse(data) {
    System.println("handle response for member information");
    System.println(data);

        // Store the access and refresh tokens in properties
        // For app store apps the properties are encrypted using
        // a randomly generated key
//        App.getApp().setProperty("refresh_token", data["refresh_token"]);
//        App.getApp().setProperty("access_token", data["access_token"]);
        // Store away the athlete id
//        App.getApp().setProperty("athlete_id", data["athlete"]["id"]);
        // Switch to the data view
        App.getApp().setProperty("member_fullname", data.get("fullName"));
        App.getApp().setProperty("member_id", data.get("id"));
        
//        var memberService = new TrelloMemberService();
//        memberService.getBoardList($.token_trello);
        //TODO switch to TrelloBoardMenuView instead of TrelloBoardListsView
      var boardService = new TrelloBoardService(new TrelloBoardServiceDelegate());
		boardService.getBoards();
    //  boardService.getBoardDetails($.boardIdMock);
//        Ui.switchToView(new TrelloBoardListsView($.boardIdMock), null, Ui.SLIDE_IMMEDIATE);
    }

}