// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require redactor-rails
//= require jquery.highlight-4

$(document).ready(function() {
	$('.replay_comments').on('click', function(e) {
		e.preventDefault();
		$(this).next('.replay_form').slideToggle();
	});

  if($('.search-query').val().length > 0) $('.span9').highlight($('.search-query').val());

  $('.preview_post').on('click', function(e) {
    e.preventDefault();
    $('.posts-form').attr('action', $(this).attr('href')).submit();
  });

  $('.show_preview').on('click', function(e) {
  	e.preventDefault();
  	var tags = $('#post_tag_list').val();

  	$('.title_preview').text($('#post_title').val());
  	$('.full_preview').html($('#post_full').redactor('get'));

  	if(tags.length > 0) $('.tags_preview').text('Tags: '+tags);
  });
});
