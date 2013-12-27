//= require jquery_ujs
//= require plugin/jquery.easing.pack

window['CKEDITOR_BASEPATH']='/ckeditor/';

$('.modal_link').click(function(event){
  event.preventDefault();
  $('#myModal').removeData("modal");
  $('#myModal').modal({'remote':$(this).attr('href')+'?no_layout=true'});
});