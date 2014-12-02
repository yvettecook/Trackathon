// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives
//
//= require dashing
//= require jquery
//= require jquery_ujs
//= require projects

console.log("Hells yeah! The dashboard has started!");

Dashing.on('ready', function() {
  var contentWidth;
  Dashing.widget_margins || (Dashing.widget_margins = [5, 5]);
  Dashing.widget_base_dimensions || (Dashing.widget_base_dimensions = [300, 360]);
  Dashing.numColumns || (Dashing.numColumns = 5);
  contentWidth = (Dashing.widget_base_dimensions[0] + Dashing.widget_margins[0] * 2) * Dashing.numColumns;
  return Batman.setImmediate(function() {
    $('.gridster').width(contentWidth);
    return $('.gridster ul:first').gridster({
      widget_margins: Dashing.widget_margins,
      widget_base_dimensions: Dashing.widget_base_dimensions,
      avoid_overlapped_widgets: !Dashing.customGridsterLayout,
      draggable: {
        stop: Dashing.showGridsterInstructions,
        start: function() {
          return Dashing.currentWidgetPositions = Dashing.getWidgetPositions();
        }
      }
    });
  });
});
