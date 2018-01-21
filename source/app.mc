using Toybox.Application as App;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Communications;

class iotButtonApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    
    }

    function onStop(state) {
    }

    function getInitialView() {
	     var url = App.Properties.getValue("iotUrl");
        return [  new buttonView(), new  buttonInputDelegate(url)  ];
       
    }

	function onSettingsChanged() {
        WatchUi.requestUpdate();
    }
}
