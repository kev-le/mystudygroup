document.addEventListener("turbolinks:load", function() {
  $(function() {
    $('#search').on('keyup', function() {
      var pattern = $(this).val();
      $('.searchable-container form .row .items').hide();
      $('.searchable-container form .row .items').filter(function() {
        return $(this).find('.course-tag').text().match(new RegExp(pattern, 'i'));
      }).show();
    });
  });
})
