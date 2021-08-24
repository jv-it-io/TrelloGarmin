using Toybox.Communications as Comm;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class TrelloTransaction {

    hidden var _action;
    hidden var _parameters;
    hidden var _delegate;

     hidden function initialize(delegate) {
    	System.println("Trello transaction init");
        _delegate = delegate;
    }
 
 

}