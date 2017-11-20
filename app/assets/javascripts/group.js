$(function() {
  $('#search').on('keyup', function() {
    var pattern = $(this).val();
    $('.searchable-container .row .items').hide();
    $('.searchable-container .row .items').filter(function() {
      return $(this).find('.course-tag').text().match(new RegExp(pattern, 'i'));
    }).show();
  });
});
