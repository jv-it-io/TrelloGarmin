using Toybox.Communications as Comm;
using Toybox.System as Sys;

class TrelloCarddService {


	hidden var _delegate;
 	function initialize(delegate) {
       _delegate = delegate;
    }
    
    
     
     function getCardById(boardId) {
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
                      "https://api.trello.com/1/cards/" + boardId,
          
            // Post parameters
            {
				"key"=>$.ClientId,
				"token"=>$.token_trello,
				"fields"=>"name,labels,due,closed"
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleCardByIdResponse)
        );
    }
    //TODO change to get list of board
     // Callback to handle receiving the access code
    function handleCardByIdResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("Card data = " + data);
        if( data != null) {
            _delegate.handleResponse(data);           
        } else {
            Sys.println("Error in handleCardByIdResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
            
        }
    }
    
   
    
}