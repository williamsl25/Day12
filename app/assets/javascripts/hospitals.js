$(document).ready( function() {

  $(".notice").fadeOut(4000);

  $(".notice").on( function() {
    $(".notice").fadeOut(4000);
  })


  $('ul.hospital_list > li').hide();
  $('li.section_1').show();
  $('.page_1').click(function(){
    $('ul.hospital_list > li').hide();
    $('li.section_1').show();
  })
  $('.page_2').click(function(){
    $('ul.hospital_list > li').hide();
    $('li.section_2').show();
  })
  $('.page_3').click(function(){
    $('ul.hospital_list > li').hide();
    $('li.section_3').show();
  })
  $('.page_4').click(function(){
    $('ul.hospital_list > li').hide();
    $('li.section_4').show();
  })
  
})

