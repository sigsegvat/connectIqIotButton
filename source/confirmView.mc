using Toybox.WatchUi as Ui;

class confirmView extends Ui.View {

	var _message;

    function initialize(message) {
        View.initialize();
        _message = message;
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.ConfirmLayout(dc));
        var view = View.findDrawableById("message");
		view.setText(_message);
    }

    function onShow() {
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

}


