using Toybox.Application as App;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Communications;

class confirmInputDelegate extends WatchUi.InputDelegate {
	function onTap(clickEvent) {
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
	}
}

class buttonInputDelegate extends WatchUi.InputDelegate {

	var _url;

	function initialize(url) {
        InputDelegate.initialize();
        _url = url;
    }

	function onReceive(responseCode, data) {
		
	       var message = "request sent";
	       if (responseCode != 200){
	           message = message + "\ncode: "+  responseCode;         
	       }
	       
	       WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		  WatchUi.pushView(new confirmView(message),new confirmInputDelegate(), WatchUi.SLIDE_IMMEDIATE);
	
	   }

    function onTap(clickEvent) {
        var options = {                                            
           :method => Communications.HTTP_REQUEST_METHOD_GET,
           :headers => {                                       
                   "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED
            },
                                                                 
           :responseType =>  Communications.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED
       };
       
       	
        Communications.makeWebRequest(_url, null, options, method(:onReceive));
        
        var progressBar = new WatchUi.ProgressBar(
            "sending...",
            null
        );
        
        WatchUi.pushView(
            progressBar,
            new MyProgressDelegate(),
            WatchUi.SLIDE_DOWN
        );
       
    }

    function onSwipe(swipeEvent) {
    }
}

class MyProgressDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        return true;
    }
}

