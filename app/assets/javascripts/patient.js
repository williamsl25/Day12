$(document).ready( function() {
  $(".notice").fadeOut(4000);

  $(".notice").on( function() {
    $(".notice").fadeOut(4000);
    
  $(".validate-first-name").blur( function() {
      if ($(".validate-first-name").val() == "") {
        $(".submit_btn").attr("disabled", "disabled")}
      else{
        $(".submit_btn").removeAttr("disabled")
      }
  })
  $(".validate-last-name").blur( function() {
      if ($(".validate-last-name").val() == "") {
        $(".submit_btn").attr("disabled", "disabled")}
      else{
        $(".submit_btn").removeAttr("disabled")
      }
  })
})