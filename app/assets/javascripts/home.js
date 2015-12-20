$(document).on('page:change', function() {
  $(function() {
    setTimeout(function() {
      $('.alert').slideUp(300);
    }, 2500);
  });
});
