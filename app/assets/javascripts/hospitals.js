$(document).ready( function() {
  function fixSubmit(box){
    if ($(box).val() == "") {
      $(".submit_btn").attr("disabled", "disabled")}
    else{
      $(".submit_btn").removeAttr("disabled")
    }
  }
  
  fixSubmit(".name")


  $(".notice").fadeOut(4000)

  $(".alert").fadeOut(4000)

  $(".notice").on( function() {
    $(".notice").fadeOut(4000)
  })

  $('ul.hospital_list > li').hide()
  $('li.section_1').show()
  $('.page_1').click(function(){
    $('ul.hospital_list > li').hide()
    $('li.section_1').show()
  })
  $('.page_2').click(function(){
    $('ul.hospital_list > li').hide()
    $('li.section_2').show()
  })
  $('.page_3').click(function(){
    $('ul.hospital_list > li').hide()
    $('li.section_3').show()
  })
  $('.page_4').click(function(){
    $('ul.hospital_list > li').hide()
    $('li.section_4').show()
  })

  $(".name").keyup( function() {
    fixSubmit(this);
  })
  
  $(document).on("click", ".checkup", function() {
    var hospital_id = $(this).attr("hospital_id");
    var patient_id = $(this).attr("patient_id");
    $.ajax({
      type: 'PATCH',
      url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/checkup',
      dataType: 'script'
      
    })
  })
    $(document).on("click", ".xray", function() {
    var hospital_id = $(this).attr("hospital_id");
    var patient_id = $(this).attr("patient_id");
    $.ajax({
      type: 'PATCH',
      url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/xray',
      dataType: 'script'
      
    })
  })
  $(document).on("click", ".surgery", function() {
    var hospital_id = $(this).attr("hospital_id");
    var patient_id = $(this).attr("patient_id");
    $.ajax({
      type: 'PATCH',
      url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/surgery',
      dataType: 'script'
      
    })
  })
  $(document).on("click", ".leave", function() {
    var hospital_id = $(this).attr("hospital_id");
    var patient_id = $(this).attr("patient_id");
    $.ajax({
      type: 'PATCH',
      url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/leave',
      dataType: 'script'
      
    })
  })
  $(document).on("click", ".wait", function() {
    var hospital_id = $(this).attr("hospital_id");
    var patient_id = $(this).attr("patient_id");
    $.ajax({
      type: 'PATCH',
      url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/wait',
      dataType: 'script'
      
    })
  })

});