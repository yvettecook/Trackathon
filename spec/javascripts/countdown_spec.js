//= require dashing/application
//= require application
describe ('Countdown', function() {

  var clock;

  beforeEach (function() {
    clock = new Dashing.Countdown;
  });

  it("has a test", function() {
    expect(1 + 1).toBe(2);
  });

  it("can generate a new clock", function() {
    expect(clock.truth()).toBe(true);
  });

  it("has a current time", function() {
    var now = new Date()
    expect(clock.currentTime()).toEqual(now)
  });

  it("has a hardcoded end time", function() {
    clock.endTime()
    expect(clock.endTime()).toEqual('Fri Dec 05 2014 17:00:00 GMT+0000 (GMT)')
  });

});
