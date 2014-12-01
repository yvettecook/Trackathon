(function() {
  console.log("Yeah! The dashboard has started!");

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

}).call(this);
(function() {
  console.log("Yeah! The dashboard has started!");

  Dashing.on('ready', function() {
    var contentWidth;
    Dashing.widget_margins || (Dashing.widget_margins = [5, 5]);
    Dashing.widget_base_dimensions || (Dashing.widget_base_dimensions = [300, 360]);
    Dashing.numColumns || (Dashing.numColumns = 4);
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

}).call(this);
(function() {
  Dashing.gridsterLayout = function(positions) {
    var index, widget, widgets, _i, _len, _results;
    Dashing.customGridsterLayout = true;
    positions = positions.replace(/^"|"$/g, '');
    positions = $.parseJSON(positions);
    widgets = $("[data-row^=]");
    _results = [];
    for (index = _i = 0, _len = widgets.length; _i < _len; index = ++_i) {
      widget = widgets[index];
      $(widget).attr('data-row', positions[index].row);
      _results.push($(widget).attr('data-col', positions[index].col));
    }
    return _results;
  };

  Dashing.getWidgetPositions = function() {
    return $(".gridster ul:first").gridster().data('gridster').serialize();
  };

  Dashing.showGridsterInstructions = function() {
    var newWidgetPositions;
    newWidgetPositions = Dashing.getWidgetPositions();
    if (JSON.stringify(newWidgetPositions) !== JSON.stringify(Dashing.currentWidgetPositions)) {
      Dashing.currentWidgetPositions = newWidgetPositions;
      $('#save-gridster').slideDown();
      return $('#gridster-code').text("<script type='text/javascript'>\n $(function() {\n \ \ Dashing.gridsterLayout('" + (JSON.stringify(Dashing.currentWidgetPositions)) + "')\n });\n </script>");
    }
  };

  $(function() {
    $('#save-gridster').leanModal();
    return $('#save-gridster').click(function() {
      return $('#save-gridster').slideUp();
    });
  });

}).call(this);
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Clock = (function(_super) {
    __extends(Clock, _super);

    function Clock() {
      this.startTime = __bind(this.startTime, this);
      return Clock.__super__.constructor.apply(this, arguments);
    }

    Clock.prototype.ready = function() {
      return setInterval(this.startTime, 500);
    };

    Clock.prototype.startTime = function() {
      var h, m, s, today;
      today = new Date();
      h = today.getHours();
      m = today.getMinutes();
      s = today.getSeconds();
      m = this.formatTime(m);
      s = this.formatTime(s);
      this.set('time', h + ":" + m + ":" + s);
      return this.set('date', today.toDateString());
    };

    Clock.prototype.formatTime = function(i) {
      if (i < 10) {
        return "0" + i;
      } else {
        return i;
      }
    };

    return Clock;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Comments = (function(_super) {
    __extends(Comments, _super);

    function Comments() {
      this.nextComment = __bind(this.nextComment, this);
      return Comments.__super__.constructor.apply(this, arguments);
    }

    Comments.accessor('quote', function() {
      var _ref;
      return "“" + ((_ref = this.get('current_comment')) != null ? _ref.body : void 0) + "”";
    });

    Comments.prototype.ready = function() {
      this.currentIndex = 0;
      this.commentElem = $(this.node).find('.comment-container');
      this.nextComment();
      return this.startCarousel();
    };

    Comments.prototype.onData = function(data) {
      return this.currentIndex = 0;
    };

    Comments.prototype.startCarousel = function() {
      return setInterval(this.nextComment, 8000);
    };

    Comments.prototype.nextComment = function() {
      var comments;
      comments = this.get('comments');
      if (comments) {
        return this.commentElem.fadeOut((function(_this) {
          return function() {
            _this.currentIndex = (_this.currentIndex + 1) % comments.length;
            _this.set('current_comment', comments[_this.currentIndex]);
            return _this.commentElem.fadeIn();
          };
        })(this));
      }
    };

    return Comments;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Graph = (function(_super) {
    __extends(Graph, _super);

    function Graph() {
      return Graph.__super__.constructor.apply(this, arguments);
    }

    Graph.accessor('current', function() {
      var points;
      if (this.get('displayedValue')) {
        return this.get('displayedValue');
      }
      points = this.get('points');
      if (points) {
        return points[points.length - 1].y;
      }
    });

    Graph.prototype.loadNode = function(_node) {
      var container, height, node, width, x_axis, y_axis;
      node = Graph.__super__.loadNode.call(this, _node);
      container = $(node).parent();
      width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1);
      height = Dashing.widget_base_dimensions[1] * container.data("sizey");
      this.graph = new Rickshaw.Graph({
        element: node,
        width: width,
        height: height,
        renderer: this.get("graphtype"),
        series: [
          {
            color: "#fff",
            data: [
              {
                x: 0,
                y: 0
              }
            ]
          }
        ]
      });
      if (this.get('points')) {
        this.graph.series[0].data = this.get('points');
      }
      x_axis = new Rickshaw.Graph.Axis.Time({
        graph: this.graph
      });
      y_axis = new Rickshaw.Graph.Axis.Y({
        graph: this.graph,
        tickFormat: Rickshaw.Fixtures.Number.formatKMBT
      });
      this.graph.render();
      return node;
    };

    Graph.prototype.onData = function(data) {
      if (this.graph) {
        this.graph.series[0].data = data.points;
        return this.graph.render();
      }
    };

    return Graph;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Iframe = (function(_super) {
    __extends(Iframe, _super);

    function Iframe() {
      return Iframe.__super__.constructor.apply(this, arguments);
    }

    Iframe.prototype.ready = function() {};

    Iframe.prototype.onData = function(data) {};

    return Iframe;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Image = (function(_super) {
    __extends(Image, _super);

    function Image() {
      return Image.__super__.constructor.apply(this, arguments);
    }

    Image.prototype.ready = function() {};

    Image.prototype.onData = function(data) {};

    return Image;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.List = (function(_super) {
    __extends(List, _super);

    function List() {
      return List.__super__.constructor.apply(this, arguments);
    }

    List.prototype.ready = function() {
      if (this.get('unordered')) {
        return $(this.node).find('ol').remove();
      } else {
        return $(this.node).find('ul').remove();
      }
    };

    return List;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Meter = (function(_super) {
    __extends(Meter, _super);

    Meter.accessor('value', Dashing.AnimatedValue);

    function Meter() {
      Meter.__super__.constructor.apply(this, arguments);
      this.observe('value', function(value) {
        return $(this.node).find(".meter").val(value).trigger('change');
      });
    }

    Meter.prototype.ready = function() {
      var meter;
      meter = $(this.node).find(".meter");
      meter.attr("data-bgcolor", meter.css("background-color"));
      meter.attr("data-fgcolor", meter.css("color"));
      return meter.knob();
    };

    return Meter;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Number = (function(_super) {
    __extends(Number, _super);

    function Number() {
      return Number.__super__.constructor.apply(this, arguments);
    }

    Number.accessor('current', Dashing.AnimatedValue);

    Number.accessor('difference', function() {
      var current, diff, last;
      if (this.get('last')) {
        last = parseInt(this.get('last'));
        current = parseInt(this.get('current'));
        if (last !== 0) {
          diff = Math.abs(Math.round((current - last) / last * 100));
          return "" + diff + "%";
        }
      } else {
        return "";
      }
    });

    Number.accessor('arrow', function() {
      if (this.get('last')) {
        if (parseInt(this.get('current')) > parseInt(this.get('last'))) {
          return 'fa fa-arrow-up';
        } else {
          return 'fa fa-arrow-down';
        }
      }
    });

    Number.prototype.onData = function(data) {
      if (data.status) {
        $(this.get('node')).attr('class', function(i, c) {
          return c.replace(/\bstatus-\S+/g, '');
        });
        return $(this.get('node')).addClass("status-" + data.status);
      }
    };

    return Number;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Text = (function(_super) {
    __extends(Text, _super);

    function Text() {
      return Text.__super__.constructor.apply(this, arguments);
    }

    return Text;

  })(Dashing.Widget);

}).call(this);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

;
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Add = (function(_super) {
    __extends(Add, _super);

    function Add() {
      return Add.__super__.constructor.apply(this, arguments);
    }

    Add.prototype.ready = function() {};

    Add.prototype.onData = function(data) {};

    return Add;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Clock = (function(_super) {
    __extends(Clock, _super);

    function Clock() {
      this.startTime = __bind(this.startTime, this);
      return Clock.__super__.constructor.apply(this, arguments);
    }

    Clock.prototype.ready = function() {
      return setInterval(this.startTime, 500);
    };

    Clock.prototype.startTime = function() {
      var h, m, s, today;
      today = new Date();
      h = today.getHours();
      m = today.getMinutes();
      s = today.getSeconds();
      m = this.formatTime(m);
      s = this.formatTime(s);
      this.set('time', h + ":" + m + ":" + s);
      return this.set('date', today.toDateString());
    };

    Clock.prototype.formatTime = function(i) {
      if (i < 10) {
        return "0" + i;
      } else {
        return i;
      }
    };

    Clock.prototype.truth = function() {
      return true;
    };

    return Clock;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Countdown = (function(_super) {
    __extends(Countdown, _super);

    function Countdown() {
      this.startCountdown = __bind(this.startCountdown, this);
      return Countdown.__super__.constructor.apply(this, arguments);
    }

    Countdown.prototype.ready = function() {
      return setInterval(this.startCountdown, 500);
    };

    Countdown.prototype.startCountdown = function() {
      var current_timestamp, d, dayname, end_timestamp, h, i, m, s, seconds_until_end, _i, _results;
      current_timestamp = Math.round(new Date().getTime() / 1000);
      end_timestamp = Math.round(Date.parse($(this.node).find(".more-info").html()) / 1000);
      seconds_until_end = end_timestamp - current_timestamp;
      if (seconds_until_end < 0) {
        this.set('timeleft', "TIME UP!");
        _results = [];
        for (i = _i = 0; _i <= 100; i = _i += 1) {
          _results.push($(this.node).fadeTo('slow', 0.5).fadeTo('slow', 1.0));
        }
        return _results;
      } else {
        d = Math.floor(seconds_until_end / 86400);
        h = Math.floor((seconds_until_end - (d * 86400)) / 3600);
        m = Math.floor((seconds_until_end - (d * 86400) - (h * 3600)) / 60);
        s = seconds_until_end - (d * 86400) - (h * 3600) - (m * 60);
        if (d > 0) {
          dayname = 'day';
          if (d > 1) {
            dayname = 'days';
          }
          return this.set('timeleft', d + " " + dayname + " " + this.formatTime(h) + ":" + this.formatTime(m) + ":" + this.formatTime(s));
        } else {
          return this.set('timeleft', this.formatTime(h) + ":" + this.formatTime(m) + ":" + this.formatTime(s));
        }
      }
    };

    Countdown.prototype.formatTime = function(i) {
      if (i < 10) {
        return "0" + i;
      } else {
        return i;
      }
    };

    return Countdown;

  })(Dashing.Widget);

}).call(this);
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dashing.Project = (function(_super) {
    __extends(Project, _super);

    function Project() {
      return Project.__super__.constructor.apply(this, arguments);
    }

    Project.accessor('value', Dashing.AnimatedValue);

    Project.prototype.ready = function() {
      var meter;
      meter = $(this.node).find(".project");
      meter.attr("data-bgcolor", meter.css("background-color"));
      meter.attr("data-fgcolor", meter.css("color"));
      return meter.knob();
    };

    Project.prototype.onData = function(data) {
      Project.__super__.onData.apply(this, arguments);
      return this.observe('value', function(value) {
        return $(this.node).find(".project").val(value).trigger('change');
      });
    };

    return Project;

  })(Dashing.Widget);

}).call(this);
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

;
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//





;
