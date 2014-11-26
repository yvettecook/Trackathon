//= require dashing/application
//= require application
describe ('Countdown', function() {

  var clock;

  it("has a test", function() {
    expect(1 + 1).toBe(2);
  });

  it("can generate a new clock", function() {
    clock = new Dashing.Clock;
    expect(clock.truth()).toBe(true);
  })

});
