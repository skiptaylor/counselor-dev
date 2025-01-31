(function() {
  $(window).load(function() {
    return $('a.save').click(function() {
      $('#form-' + $(this).attr('id')).submit();
      return false;
    });
  });

}).call(this);