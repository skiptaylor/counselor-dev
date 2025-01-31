(function() {
  $(window).load(function() {
    return $('input[type=radio]').click(function() {
      var question;
      question = $("div#question-" + ($(this).attr('name')));
      question.find('input').attr("disabled", "disabled");
      question.find('blockquote.notes').show();
      return question.find('i.icon-ok').show();
    });
  });

}).call(this);