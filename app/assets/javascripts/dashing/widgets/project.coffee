class Dashing.Project extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue

  ready: ->
    meter = $(@node).find(".project")
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()

  onData: (data) ->
    super
    @observe 'value', (value) ->
      $(@node).find(".project").val(value).trigger('change')


  # constructor: ->
  #   super
  #   @observe 'value', (value) ->
  #     console.log(value)
  #     $(@node).find(".project").val(value).trigger('change') # value --> completion