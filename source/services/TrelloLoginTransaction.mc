using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloLoginTransaction {

	hidden var _complete;
		hidden var _delegate;
	

	function initialize(delegate){
		_delegate = delegate;
		_complete = false;
		//Run request to get an access token to trello 
		Sys.println("Login Transaction");
		Comm.registerForOAuthMessages(method(:accessCodeResult));
	}
	
	 // Handle converting the authorization code to the access token
    // @param value Content of JSON response
    function accessCodeResult(value) {
    	var token = value.data["value"];
        if( token != null) {
            _complete = true;
            // TODO Extract the access code from the JSON response
			//            getAccessToken(value.data["value"]);
 			
        }
        else {
            Sys.println("Error in accessCodeResult");        
            _delegate.handleError(value.responseCode);
        }
    }
	
	 function requestAccessToken(){
	 	Sys.println("request access token");
	 	  Comm.makeOAuthRequest(
	            // URL for the authorization URL
	    "https://trello.com/1/authorize",
	            
	            // POST parameters
	            {
	                "expiration"=>"1day",
	                "name"=>"TrelloGarminApp",
	                "scope"=>"read",
	                "response_type"=>"token",
	                "key"=>$.ClientId //"b6e80727b9377c7eeb8e347d19670a1c"
	            },
	            // Redirect URL
	            $.RedirectUri,
	            // Response type
	            Comm.OAUTH_RESULT_TYPE_URL,
	            // Value to look for
	            {"code"=>"value"}
	            );
	 }
	 
	 function getBoards(){
	 	Comm.makeWebRequest(
            // URL
               "https://api.trello.com/1/members/me/boards",
             {
				
                "client_id"=>$.ClientId,
                "response_type"=>"code",
                "scope"=>"public",
                "redirect_uri"=>$.RedirectUri,
                "key"=>$.ClientId,
				"token"=>$.token_trello
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
        if( data != null) {
        	Sys.println("board data = " + data);
        	
//            _delegate.handleResponse(data, _memberName);
        } else {
            Sys.println("Error in handleAccessResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
        }
    }
}