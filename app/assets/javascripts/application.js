// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery_ujs

//= require popper
//= require bootstrap

//= require chartkick
//= require Chart.bundle
//= require jquery
//= require moment
//= require fullcalendar
//= require_tree .





$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
  // $(document).on('ready', function () {
      // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
      if ($('#calendar').length) {
          function eventCalendar() {
              return $('#calendar').fullCalendar({
                height: '1000px'
              });
          };
          function clearCalendar() {
              $('#calendar').html('');
              gon.clear
          };

          $(document).on('turbolinks:load', function () {
              eventCalendar();
              gon.clear
          });
          $(document).on('turbolinks:before-cache', clearCalendar);
          console.log(gon.user_id)
         
          $('#calendar').fullCalendar({
              events: `/each_events/${gon.user_id}`,
              height: 600
          });
          window.gon={};
          window.gon // => {}
      }
  });
  // Likeボタンクリック
$('.good_buttons').on('click', function() {
  let $btn = $(this);
  if($btn.hasClass('iam_student')){
    return false
  }
  // Likeボタンがonクラス持っていたら
  if ($btn.hasClass('on')) {
    $btn.removeClass('on');
    // 白抜きアイコンに戻す
    $btn.children("i").attr('class', 'far fa-thumbs-up LikesIcon-fa-heart');
    $btn.children('.good_font').hide();
    let data = { 
      learning_history_id: $(this).attr('learning-history-id'), 
      teacher_id: $(this).attr('teacher-id'), 
    }
    $.ajax({
      url: `likes/${data.learning_history_id}`,
      type: 'DELETE',
      data: data,
      dataType: 'json'
    })
  } else {
    $btn.addClass('on');
    $btn.children('.good_font').fadeIn(800);
    $btn.children("i").attr('class', 'fas fa-thumbs-up LikesIcon-fa-heart heart');
    let data = { 
      learning_history_id: $(this).attr('learning-history-id'), 
      teacher_id: $(this).attr('teacher-id'), 
    }
    $.ajax({
      url: 'likes',
      type: 'POST',
      data: data,
      dataType: 'json'
    })
      .done(function(response) {
        $btn.children('.good_font.text').text(`${response.teacher_name}先生がいいねしました`)
      })
  }
});
// const url = '/api/v1/s/space_calendars/publish_url'
// const data = { 
//   space_id: $(this).attr('space-id'), 
//   space_organization_id: $(this).attr('space-organization-id'), 
// }
// $.ajax({
//   url: url,
//   type: 'POST',
//   data: data,
//   dataType: 'json'
// })

// protect_from_forgery except: [:publish_url]

// .done(function(calendar) {
//   // Show here on async. When the page is reloaded it is drawn by haml
//   const destroyLink = addLink(calendar)
//   $('#google-calendar-destroy').html(destroyLink)
//   $('#google-calendar-tag').html(
//     '<div class="tag is-primary">連携中</div>'
//   )
// })
// .fail(function(calendar) {})
      
  

// $('#while_studying').hide();
// $('#pause').hide();
// $('#finish').hide();
// $('#confirmation').hide();

// var sec = 0;
// var min = 0;
// var timer = 0;

// $('#startbtn').click(function() {
//   console.log('start');
//   timer = setInterval(function(){
//     sec++;
//     $("#min").html(min);
//     $("#sec").html(sec);
//     if(sec == 60){
//      sec = 0;
//      min++;
//     };
//    },1000);
//   $('#while_studying').fadeIn(1500);
//   $('#before_start').hide();
//   $('#new_history_buttons').css('background-color', 'midnightblue');
//   $('.stopwatch_container').css('background-color', 'midnightblue');
//   $('#timerLabel').css('color', 'white');
//   $('#timerLabel').css('font-size', '25px');
// });

// $('#resetbtn').click(function() {

//   $('#confirmation').fadeIn(1500);
//   $('#while_studying').hide();
//   $('#pause').hide();
//   $('#new_history_buttons').css('background-color', '#778899');
//   $('#confirmation_comment').css('color', 'white');
//   $('.stopwatch_container').css('background-color', '#778899');
// });

// $('#surebtn').click(function() {
//   clearInterval(timer);
//   sec = 0;
//   min = 0;
//   $("#min").html(min);
//   $("#sec").html(sec);

//   $('#before_start').fadeIn(1500);
//   $('#confirmation').hide();
//   $('#new_history_buttons').css('background-color', '#BBBBBB');
//   $('.stopwatch_container').css('background-color', '#BBBBBB');
  
// });

// $('#cancelbtn').click(function() {
//   $('#pause').fadeIn(1500);
//   $('#confirmation').hide();
// });

// // 一時停止
// $('#pausebtn').click(function() {
//   console.log('pause')
//   clearInterval(timer);
//   $('#pause').fadeIn(1500);
//   $('#while_studying').hide();
//   $('#new_history_buttons').css('background-color', '#778899');
//   $('.stopwatch_container').css('background-color', '#778899');
//   $('.stopwatch_title').css('color', 'white');
// });

// $('#finishbtn1').click(function() {
//   clearInterval(timer);
//   $('#finish').fadeIn(1500);
//   $('#while_studying').hide();
//   $('#pause').hide();
//   $('#new_history_buttons').css('background-color', 'midnightblue');
//   $('.stopwatch_container').css('background-color', 'midnightblue');
//   $('#timerLabel').css('color', 'white');
//   $('#timerLabel').css('font-size', '25px');
//   $('.stopwatch_title').css('color', 'white');
// });

// $('#finishbtn2').click(function() {
//   $('#finish').fadeIn(1500);
//   $('#while_studying').hide();
//   $('#pause').hide();
//   $('#new_history_buttons').css('background-color', 'midnightblue');
//   $('.stopwatch_container').css('background-color', 'midnightblue');
//   $('#timerLabel').css('color', 'white');
//   $('#timerLabel').css('font-size', '25px');
//   $('.stopwatch_title').css('color', 'white');
// });

// // 再開
// $('#restartbtn').click(function() {
//   timer = setInterval(function(){
//     sec++;
//     $("#min").html(min);
//     $("#sec").html(sec);
//     if(sec == 60){
//      sec = 0;
//      min++;
//     };
//    },1000);
//   $('#while_studying').fadeIn(1500);
//   $('#pause').hide();
//   $('#new_history_buttons').css('background-color', 'midnightblue');
//   $('.stopwatch_container').css('background-color', 'midnightblue');
//   $('#timerLabel').css('color', 'white');
//   $('#timerLabel').css('font-size', '25px');
// });

// $('#stillbtn').click(function() {
//   $('#pause').fadeIn(1500);
//   $('#before_start').hide();
//   $('#finish').hide();
//   $('#new_history_buttons').css('background-color', '#778899');
//   $('.stopwatch_container').css('background-color', '#778899');
//   $('.stopwatch_title').css('color', 'white');
// });

// $("#sharebtn").click(function(){
//   var fin_hour = $('#hour')[0].innerText
//   var fin_min = $('#min')[0].innerText
//   var fin_sec = $('#sec')[0].innerText
//   var sum_time = `${fin_hour}:${fin_min}:${fin_sec}`
//   $.ajax({
//       url: "ajax_create_lh",
//       type: "POST",
//       data: JSON.stringify({
//         learning_time: sum_time,
//         learning_text: $('#exampleFormControlTextarea1')[0].value,
//         comment: $('#exampleFormControlTextarea2')[0].value,
//         subject: '英語',
//         student_id: 1
//       }),
//       contentType: 'application/json',
//       dataType: "json",
//       success: function(data) {
//         window.location.href = '/news_field';
//       },
//       error: function(data) {
//          window.location.href = '/test';
//       }
//   });
// });
// });
});






document.addEventListener("turbolinks:load", function() {
$(function () {
  searchWord = function(){
    var searchText = $(this).val(), 
        targetText;

    $('.target-area li').each(function() {
      targetText = $(this).text();

      if (targetText.indexOf(searchText) != -1) {
        $(this).parent().removeClass('hidden');
      } else {
        $(this).parent().addClass('hidden');
      }
    });
  };

  $('#search-text').on('input', searchWord);
});
});
