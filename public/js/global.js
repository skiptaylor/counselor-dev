(function() {
  $(window).load(function() {
    $('a.btn-danger').click(function() {
      if (!confirm('This cannot be undone! Continue?')) {
        return false;
      }
    });
    $('a[rel="popover"]').hover(function() {
      return $(this).popover('toggle');
    });
    $('div.link').click(function() {
      if ($(this).attr('target') === '_blank') {
        return window.open($(this).attr('data-url'));
      } else {
        return window.location = $(this).attr('data-url');
      }
    });
    return $('a#reset-password').click(function() {
      return $('a#reset-password').attr('href', "/reset-password/" + ($('input#email').val()));
    });
  });

}).call(this);


