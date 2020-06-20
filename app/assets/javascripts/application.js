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
//= require popper
//= require bootstrap
//= require turbolinks
//= require_tree .
//= require chartkick
//= require Chart.bundle
//= require jquery
//= require moment
//= require fullcalendar


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
          // window.gon={};
          window.gon // => {}
      }
      
  });
});
