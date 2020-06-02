
$(function() {
  $('#while_studying').hide();
  $('#pause').hide();
  $('#finish').hide();
  $('#confirmation').hide();

  $('#startbtn').click(function() {
    $('#while_studying').fadeIn(1500);
    $('#before_start').hide();
    $('#new_history_buttons').css('background-color', 'red');
    $('.stopwatch_container').css('background-color', 'red');
    $('#timerLabel').css('color', 'white');
    $('#timerLabel').css('font-size', '25px');
  });

  $('#resetbtn').click(function() {
    $('#confirmation').fadeIn(1500);
    $('#while_studying').hide();
    $('#pause').hide();
    $('#new_history_buttons').css('background-color', '#222222');
    $('#confirmation_comment').css('color', 'white');
    $('.stopwatch_container').css('background-color', '#222222');
  });

  $('#surebtn').click(function() {
    $('#before_start').fadeIn(1500);
    $('#confirmation').hide();
    $('#new_history_buttons').css('background-color', '#BBBBBB');
    $('.stopwatch_container').css('background-color', '#BBBBBB');
    
  });

  $('#cancelbtn').click(function() {
    $('#pause').fadeIn(1500);
    $('#confirmation').hide();
  });

  $('#pausebtn').click(function() {
    $('#pause').fadeIn(1500);
    $('#while_studying').hide();
    $('#new_history_buttons').css('background-color', '#222222');
    $('.stopwatch_container').css('background-color', '#222222');
    $('.stopwatch_title').css('color', 'white');
  });

  $('#finishbtn1').click(function() {
    $('#finish').fadeIn(1500);
    $('#while_studying').hide();
    $('#pause').hide();
    $('#new_history_buttons').css('background-color', 'midnightblue');
    $('.stopwatch_container').css('background-color', 'midnightblue');
    $('#timerLabel').css('color', 'white');
    $('#timerLabel').css('font-size', '25px');
    $('.stopwatch_title').css('color', 'white');
  });

  $('#finishbtn2').click(function() {
    $('#finish').fadeIn(1500);
    $('#while_studying').hide();
    $('#pause').hide();
    $('#new_history_buttons').css('background-color', 'midnightblue');
    $('.stopwatch_container').css('background-color', 'midnightblue');
    $('#timerLabel').css('color', 'white');
    $('#timerLabel').css('font-size', '25px');
    $('.stopwatch_title').css('color', 'white');
  });

  $('#restartbtn').click(function() {
    $('#while_studying').fadeIn(1500);
    $('#pause').hide();
    $('#new_history_buttons').css('background-color', 'red');
    $('.stopwatch_container').css('background-color', 'red');
    $('#timerLabel').css('color', 'white');
    $('#timerLabel').css('font-size', '25px');
  });

  $('#stillbtn').click(function() {
    $('#pause').fadeIn(1500);
    $('#before_start').hide();
    $('#finish').hide();
    $('#new_history_buttons').css('background-color', '#222222');
    $('.stopwatch_container').css('background-color', '#222222');
    $('.stopwatch_title').css('color', 'white');
  });


});

