$(document).ready(function(){
  $(".checkup").click();
  $(".checkup").click(function)(){
    console.log("hello");
    $.ajax({
      type: 'PATCH',
      url: /hospitals/:hospital_id/patients/:id/checkup,
      dataType: 'script', 
  })
})


// /hospitals/:hospital_id/patients/:id/checkup