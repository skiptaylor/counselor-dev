(function() {
  $(window).load(function() {
    $('a.last').click(function() {
      var card;
      card = $(this).parents('div.current-card');
      card.hide();
      card.prev().show();
      return false;
    });
    $('a.next').click(function() {
      var card;
      card = $(this).parents('div.current-card');
      card.hide();
      card.next().show();
      return false;
    });
    return $('div.flashcard, div.tap').click(function() {
      var card;
      card = $(this).parents('div.current-card');
      card.find('div.flashcard').toggleClass('flipped');
      return false;
    });
  });

}).call(this);