using Toybox.Communications as Comm;
using Toybox.System as Sys;

class TrelloBoardInformationService {


	hidden var _delegate;
 	function initialize(delegate) {
       _delegate = delegate;
    }
    
    
       function getBoardDetails(boardId) {
    
        // Make HTTPS GET request to request the access token
        Comm.makeWebRequest(
            // URL
                      "https://api.trello.com/1/boards/" + $.boardIdMock + "",
          
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
            method(:handleBoardDetailsResponse)
        );
    }
    //TODO change to get list of board
     // Callback to handle receiving the access code
    function handleBoardDetailsResponse(responseCode, data) {
        // If we got data back then we were successful. Otherwise
        // pass the error onto the delegate
        Sys.println("board details data = " + data);
        if( data != null) {
            _delegate.handleResponseBoardDetails(data);           
        } else {
            Sys.println("Error in handleBoardDetailsResponse");
            Sys.println("data = " + data);
            Sys.println("error code = " + responseCode);
            _delegate.handleError(responseCode);
            
        }
    }
    
}