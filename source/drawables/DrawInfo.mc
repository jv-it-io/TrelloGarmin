using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;

class CardInfo extends Ui.Drawable {

hidden var x, y, radius, color;


	function initialize(params){
		Drawable.initialize(params);
		x = params[:x];
		y = params[:y];
		radius = params[:radius];
		color = params[:color];
	}
	
	function draw(dc) {
//		dc.setColor(color, Gfx.COLOR_PINK);
//		dc.fillCircle(x, y, radius);
	}
}