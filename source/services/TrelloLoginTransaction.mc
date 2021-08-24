using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloLoginTransaction {

	hidden var _complete;

	function initialize(delegate){
		_complete = false;
		//Run request to get an access token to trello 
		Sys.println("Login Transaction");
		Comm.registerForOAuthMessages(method(:accessCodeResult));
	}
	
	 // Handle converting the authorization code to the access token
    // @param value Content of JSON response
    function accessCodeResult(value) {
        if( value.data != null) {
            _complete = true;
            // Extract the access code from the JSON response
			//            getAccessToken(value.data["value"]);
 			Sys.println("data = " + value);
        }
        else {
            Sys.println("Error in accessCodeResult");
            Sys.println("data = " + value.data);
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
	                "key"=>"b6e80727b9377c7eeb8e347d19670a1c"
	            },
	            // Redirect URL
	            $.RedirectUri,
	            // Response type
	            Comm.OAUTH_RESULT_TYPE_URL,
	            // Value to look for
	            {"code"=>"value"}
	            );
	 }
}