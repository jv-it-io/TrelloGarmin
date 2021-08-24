using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloLoginTransaction {

	function initialize(delegate){
		//Run request to get an access token to trello 
		Sys.println("Login Transaction");
		//Comm.registerForOAuthMessages(method(:accessCodeResult));
	}
	
	 function requestAccessToken(){
	 	Sys.println("request access token");
	 }
}