
$(function() {




  $(".cal-stu").click(function(){
    console.log('clickckckc')
    console.log($(".cal-stu"))
    console.log($(this).children('p')[0].textContent)
    let id = $(this).children('p')[0].textContent
    $.ajax({
      url: "/",
      type: "GET",
      contentType: 'application/json',
      dataType: "json",
      success: function() {
        console.log('sucess')
        window.location.href = `/teachers/show_calender/${Number(id) + 1}`;
      },
      error: function() {
        console.log('erroe')
        window.location.href = `/teachers/show_calender/${Number(id) + 1}`;
      }
  });
});




});