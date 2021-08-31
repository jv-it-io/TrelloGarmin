using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloMemberService{

	hidden var _delegate;
 	function initialize(delegate) {
       _delegate = delegate;
    }
    
     function getMemberInformation(accessCode) {
   		Sys.println("Get Member Information : " + accessCode);
    //TODO refactor to get the access token instead get personal info 
    
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
           //	"https://api.trello.com/1/members/me/?key=" + $.ClientId +  "&token=" + $.ClientToken ,
          //  " https://api.trello.com/1/members/me",
                      "https://api.trello.com/1/members/me",
          
            // Post parameters
            {
				"key"=>"b6e80727b9377c7eeb8e347d19670a1c",
				"token"=>accessCode
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleMemberInformationResponse)
        );
    }
    //TODO change to get list of board
     // Callback to handle receiving the access code
    function handleMemberInformationResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("data = " + data);
        if( data != null) {
        	Sys.println("member data name = " + data.get("fullName"));
        	Sys.println("member data id = " + data.get("id"));
            _delegate.handleResponse(data);
        } else {
            Sys.println("Error in handleMemberInformationResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
        }
    }
    
      function getBoardList(accessCode) {
   		Sys.println("Get Member Information : " + accessCode);
    	//TODO refactor to get the access token instead get personal info 
    
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL TODO get board list
//			   "https://api.trello.com/1/members/505863830eb16eaf23462824/boards/",
   			   "https://api.trello.com/1/boards/60d99adadb92f7352654fd0e/lists",
			   
            // Post parameters
            {
				"key"=>"b6e80727b9377c7eeb8e347d19670a1c",
				"token"=>accessCode
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleBoardResponse)
        );
    }
    
      // Callback to handle receiving the access code
    function handleBoardResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("board data = " + data);
        if( data != null) {
//            _delegate.handleResponse(data);
			Ui.switchToView(new TrelloBoardView(data), null, Ui.SLIDE_IMMEDIATE);
        } else {
            Sys.println("Error in handleBoardInformationResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
//            _delegate.handleError(responseCode);
        }
    }
		
}