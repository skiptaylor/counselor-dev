(function() {
  $(window).load(function() {
    var displayErrors, summarize, validateEmail;
    Stripe.setPublishableKey('pk_09rfEloWlDjIMVTav6KJJ0ijH3b57');
    $.ajaxSetup({
      async: false
    });
    $('form#payment-form').change(function() {
      return summarize();
    });
    summarize = function() {
      var ga, hardcopy_total, nce_hardcopy_total, package_total, total, zip;
      $('#program-package-confirmation').html($("input[name='package']:checked").val());
      $('#hardcopy-enhancements-confirmation').html($("input[name='hard_copy']:checked").val() || "");
      $('#nce-hardcopy-enhancements-confirmation').html($("input[name='nce_hard_copy']:checked").val() || "");
      $('#name-confirmation').html(($('input#first_name').val()) + " " + ($('input#last_name').val()));
      $('#email-confirmation').html($('input#email').val());
      $('#password-confirmation').html($('input#password').val());
      $('#card-number-confirmation').html($('input.card-number').val());
      $('#cvc-confirmation').html($('input.card-cvc').val());
      $('#expiration-confirmation').html(($('.card-expiry-month').val()) + " / " + ($('.card-expiry-year').val()));
      $('#address-confirmation').html($('input#address1').val());
      if ($('input#address2').val() !== '') {
        $('#address-confirmation').append(", " + ($('input#address2').val()));
      }
      $('#city-confirmation').html($('input#city').val());
      $('#state-confirmation').html($('select#state').val());
      $('#zip-confirmation').html($('input#zip').val());
      total = 0;
      package_total = parseFloat($("input[name='package']:checked").attr('data-price')) || 0;
      hardcopy_total = parseFloat($("input[name='hard_copy']:checked").attr('data-price')) || 0;
      nce_hardcopy_total = parseFloat($("input[name='nce_hard_copy']:checked").attr('data-price')) || 0;
      total = total + package_total + hardcopy_total + nce_hardcopy_total;
      $('#package-amount').html(package_total.toFixed(2));
      $('#hard_copy-amount').html(hardcopy_total.toFixed(2));
      $('#nce_hard_copy-amount').html(nce_hardcopy_total.toFixed(2));
      if ($('input#zip').val()) {
        zip = $('input#zip').val();
      } else {
        zip = 0;
      }
      $.get('/tax/' + zip, function(data) {
        var tax;
        tax = total * data;
        return total = (total + tax).toFixed(2);
      });
      $('input#amount').val(total);
      $('#total-display').html(total);
      ga = total - (package_total + hardcopy_total + nce_hardcopy_total);
      $('#ga-tax').html(ga.toFixed(2));
      return $('.submit-button').removeAttr('disabled').removeClass('disabled');
    };
    summarize();
    validateEmail = function(emailAddress) {
      var pattern;
      pattern = new RegExp(/@/);
      return pattern.test(emailAddress);
    };
    $('.submit-button').click(function(event) {
      $('.submit-button').attr('disabled', 'disabled').removeClass('disabled').addClass('disabled');
      window.errors = [];
      if (!$("input[name='package']:checked").val()) {
        errors.push('You must choose a package.');
      }
      if (($('input#first_name').val() === '') || ($('input#last_name').val() === '')) {
        errors.push('You must enter a first and last name.');
      }
      if (!validateEmail($('input#email').val())) {
        errors.push('You must enter a valid email address.');
      }
      if ($('input#password').val() === '') {
        errors.push('You must enter a password.');
      }
      if ($('input.card-number').val() === '') {
        errors.push('You must enter a credit card number.');
      }
      if ($('input.card-cvc').val() === '') {
        errors.push('You must enter a credit card validation code (CVC).');
      }
      if (($('input#address1').val() === '') || ($('input#city').val() === '') || ($('select#state').val() === '') || ($('input#zip').val() === '')) {
        errors.push('You must enter an address, city, state, and zip.');
      }
      if (!(($('input#email').is(':disabled')) || ($('input#email').val() === '') || ($('input#password').val() === ''))) {
        $.post('/user/account-ever-existed', {
          email: $('input#email').val(),
          password: $('input#password').val()
        }, function(data) {
          if ((data === 'account exists') || (data === 'email exists')) {
            return errors.push('That email address is already in use. Maybe you need to <a href="/sign-in">sign in</a> first?');
          }
        });
      }
      if (errors[0]) {
        displayErrors(errors);
      }
      if (!errors[0]) {
        Stripe.createToken({
          number: $('.card-number').val(),
          cvc: $('.card-cvc').val(),
          exp_month: $('.card-expiry-month').val(),
          exp_year: $('.card-expiry-year').val()
        }, function(status, response) {
          var form$, token;
          if (response.error) {
            errors.push(response.error.message);
            return displayErrors(errors);
          } else {
            form$ = $("#payment-form");
            token = response['id'];
            form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
            return form$.get(0).submit();
          }
        });
      }
      return false;
    });
    displayErrors = function(errors) {
      var error, i, len, results;
      $('div#errors').html('<ul></ul>');
      results = [];
      for (i = 0, len = errors.length; i < len; i++) {
        error = errors[i];
        results.push($('div#errors ul').append("<li>" + error + "</li>"));
      }
      return results;
    };
    return false;
  });

}).call(this);