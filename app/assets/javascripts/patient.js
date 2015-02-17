$(document).ready( function() {
  console.log("hi")
  function fixSubmit(box){
    console.log($(box).val())
    if ($(box).val() == "") {
      $(".submit_btn").attr("disabled", "disabled")}
    else{
      $(".submit_btn").removeAttr("disabled")
    }
  }

  fixSubmit(".first_name")
  
  $(".notice").fadeOut(4000)

  $(".alert").fadeOut(4000)

  $(".notice").on( function() {
    $(".notice").fadeOut(4000)
  })
    
  $(".first_name").keyup( function() {
    fixSubmit(this);
  })

});

// form is CORRECT
  