using Toybox.Communications as Comm;
using Toybox.System as Sys;

class TrelloBoardService {


	hidden var _delegate;
 	function initialize(delegate) {
       _delegate = delegate;
    }
    
    
     
     function getBoardListsByBoardId(boardId) {
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
                      "https://api.trello.com/1/boards/" + boardId + "/lists",
          
            // Post parameters
            {
				"key"=>$.ClientId,
				"token"=>$.token_trello
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleBoardListsResponse)
        );
    }
    //TODO change to get list of board
     // Callback to handle receiving the access code
    function handleBoardListsResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("board lists data = " + data);
        if( data != null) {
            _delegate.handleResponse(data);           
        } else {
            Sys.println("Error in handleBoardListsResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
            
        }
    }
    
     function getBoards() {
    
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
                      "api.trello.com/1/members/me/boards",
          
            // Post parameters
            {
				"key"=>$.ClientId,
				"token"=>$.token_trello,
				"fields"=>"name"
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleBoardsResponse)
        );
    }
    
     // Callback to handle get board of the connected member
     //fields : id, name
    function handleBoardsResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("board lists data = " + data);
        if( data != null) {
            _delegate.handleBoardsResponse(data);           
        } else {
            Sys.println("Error in handleBoardListsResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
            
        }
    }
    
    function getCardsFromAListOfABoard(listId){
    	 // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
                      "api.trello.com/1/lists/" + listId + "/cards",
          
            // Post parameters
            {
				"key"=>$.ClientId,
				"token"=>$.token_trello,
				"fields"=>"name"
            },
            // Options to the request
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET
            },
            // Callback to handle response
            method(:handleCardsFromAListOfABoard)
        );
    }
    
      // Callback to handle get card of a list from a board of the connected member
      // fields : 
    function handleCardsFromAListOfABoard(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("board lists data = " + data);
        if( data != null) {
            _delegate.handleCardsFromAListOfABoard(data);           
        } else {
            Sys.println("Error in handleBoardListsCardsResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
            
        }
    }
    
}