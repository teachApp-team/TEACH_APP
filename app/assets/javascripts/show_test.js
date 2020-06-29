document.addEventListener("turbolinks:load", function() {

  $(function () {
    $('#new_your_students_test').hide();
      $("#new_test").click(function(){
        $('#new_your_students_test').fadeIn(1500);
        $('#show_your_students_test').hide();
      });

      $("#add_test").click(function(){
        var selected_sutdent = $('#inlineFormCustomSelect1')[0].value
        var test_name = $('#exampleFormControlTextarea1')[0].value
        var score = $('#example-number-input1')[0].value
        var average_score = $('#example-number-input2')[0].value
        var grade = $('#inlineFormCustomSelect2')[0].value
        var date = $('#example-date-input')[0].value
        var teacher_id = $('#current_teacher_id')[0].innerText
        $.ajax({
          url: "/teachers/ajax_create_test",
          type: "POST",
          data: JSON.stringify({
            name: test_name,
            score: score,
            grade: grade,
            date: date,
            student_id: selected_sutdent,
            teacher_id: teacher_id,
            average_score: average_score
          }),
          contentType: 'application/json',
          dataType: "json"
      });
      $('#show_your_students_test').fadeIn(1500);
      $('#new_your_students_test').hide();
    });
  });

})