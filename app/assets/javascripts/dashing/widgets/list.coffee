class Dashing.List extends Dashing.Widget
	@accessor 'total', Dashing.AnimatedValue

  ready: ->
    if @get('unordered')
      $(@node).find('ol').remove()
    else
      $(@node).find('ul').remove()

  

