// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  var $newSubmissionFormCol = $('.new-submission-form-col');
  
  $('.new-submission-btn').click(function(e) {
    e.preventDefault();
    
    $('.submissions-row').hide();
    $newSubmissionFormCol.show();
    $newSubmissionFormCol.find('textarea').focus();
    $(this).hide();
    $('.show-submissions-btn').show();
  })
  
  $('.show-submissions-btn').click(function() {
    $('.submissions-row').show();
    $newSubmissionFormCol.hide();
    $(this).hide();
    $('.new-submission-btn').show();
  })
  
  $newSubmissionFormCol.on('submit', '#new_submission', function(e) {
    e.preventDefault();
    var path = $(this).attr('action');
    var data = $(this).serialize();
    $.post(path, data)
      .done(function(response) {
        $('.submissions-row').show();
        $newSubmissionFormCol.hide();
        $newSubmissionFormCol.find('.alert').remove();
        $('.show-submissions-btn').hide();
        $('.new-submission-btn').show();
        $('.submissions-tr').last().fadeOut(function() {
          $(this).remove();
          $('.submissions-tbody').prepend(response);
          $('.submissions-tr').first().fadeOut().fadeIn();
        })
      })
      .fail(function(error) {
        $newSubmissionFormCol.empty();
        $newSubmissionFormCol.html(error.responseText);
        $newSubmissionFormCol.find('textarea').focus();
      })
  })
})