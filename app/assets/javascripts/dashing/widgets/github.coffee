class Dashing.Github extends Dashing.Widget

  ready: ->

  onData: (data) ->
    $(@node).fadeOut().fadeIn()