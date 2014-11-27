class Dashing.Countdown extends Dashing.Widget

  ready: ->
    setInterval(@startCountdown, 500)

  startCountdown: =>
    today = new Date()

    h = today.getHours()
    m = today.getMinutes()
    s = today.getSeconds()
    m = @formatTime(m)
    s = @formatTime(s)
    @set('time', h + ":" + m + ":" + s)
    @set('date', today.toDateString())

  currentTime: =>
    now = new Date()

  endTime: =>
    endTime = 'Fri Dec 05 2014 17:00:00 GMT+0000 (GMT)'


  formatTime: (i) ->
    if i < 10 then "0" + i else i

  truth: ->
    true
