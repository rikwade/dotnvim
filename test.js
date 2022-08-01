var countDownDate = new Date("Aug 01, 2022 5:30:00").getTime();
var x = setInterval(function() {
    var now = new Date().getTime();
    var distance = countDownDate - now;
    //var days = '0' + Math.floor(distance / (1000 * 60 * 60 * 24)).slice(-1);
    var hours = ('0' + Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).slice(-2);
    var minutes = ('0' + Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))).slice(-2);
    var seconds = ('0' + Math.floor((distance % (1000 * 60)) / 1000)).slice(-2);


}, 1000);
