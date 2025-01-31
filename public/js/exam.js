(function() {
  $(window).load(function() {
    $('input[type=radio]').click(function() {
      var id, self;
      self = $(this);
      id = self.attr('value');
      return $.post('/add-score', {
        answer: id
      }, function(data) {
        return self.parent('label').parent('div').parent('div').parent('form').prev('p').removeClass('unread');
      });
    });
    $('a.restart').click(function() {
      if (!confirm('This will reset your score! Continue?')) {
        return false;
      }
    });
    $('a#score-link').click(function() {
      if ($(this).parent('li').hasClass('disabled')) {
        return false;
      }
    });
    return $('a.set-link').click(function() {
      var set;
      set = $(this).html();
      $('.pagination ul li').removeClass('active');
      $(this).parent('li').addClass('active');
      $('.set').hide();
      $("#set-" + set).show();
      $('#set-label').html(set);
      $('html, body').scrollTop(0);
      return false;
    });
  });

}).call(this);