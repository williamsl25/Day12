$(document).ready( function() {
  $(".notice").fadeOut(4000);

  $(".notice").on( function() {
    $(".notice").fadeOut(4000);
    
  $(".validate-name").blur( function() {
      if ($(".validate-name").val() == "") {
        $(".submit_btn").attr("disabled", "disabled")}
      else{
        $(".submit_btn").removeAttr("disabled")
      }
  })
})