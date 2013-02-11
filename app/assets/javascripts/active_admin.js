//= require active_admin/base
//= require ckeditor/init
//= require jquery.ui.datepicker-ru
//= require jquery.synctranslit.min

$(document).ready(function(){
  $('input.datepicker').datepicker('option', 'ru');
  $("#news_title").syncTranslit({destination: "news_slug"});
});
