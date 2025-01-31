(function() {
  $(window).load(function() {
    $('a#save-scenario-btn').click(function() {
      $('#edit-scenario-form').submit();
      return false;
    });
    $('a#save-new-question-btn').click(function() {
      $('#new-question-form').submit();
      return false;
    });
    $('a.save-question-btn').click(function() {
      $("#edit-question-" + ($(this).attr('id')) + "-form").submit();
      return false;
    });
    $('a.new-answer-btn').click(function() {
      $("#new-answer-" + ($(this).attr('id')) + "-form").submit();
      return false;
    });
    return $('a.save-answer-btn').click(function() {
      $("#edit-answer-" + ($(this).attr('id')) + "-form").submit();
      return false;
    });
  });

}).call(this);