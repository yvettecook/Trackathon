//= require dashing/application
//= require application
describe ('Countdown', function() {

  var clock;

  it("has a test", function() {
    expect(1 + 1).toBe(2);
  });

  it("can generate a new clock", function() {
    clock = new Dashing.Countdown;
    expect(clock.truth()).toBe(true);
  });

  it("has a current time", function() {
    clock = new Dashing.Countdown;
    var now = new Date()
    expect(clock.currentTime()).toEqual(now)
  });

  // xit("has an end time", function() {
  //   clock = new Dashing.Countdown;
  //   clock.endTime()
  //   expect(clock.)
  // });

});
