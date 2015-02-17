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
    
  $(".name").keyup( function() {
      fixSubmit(this);
  })
});