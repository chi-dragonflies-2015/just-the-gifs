$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
//   var password = document.getElementById("password")
//   , confirm_password = document.getElementById("confirm_password");

// function validatePassword(){
//   if(password.value != confirm_password.value) {
//     confirm_password.setCustomValidity("Passwords Don't Match");
//   } else {
//     confirm_password.setCustomValidity('');
//   }
// }

// password.onchange = validatePassword;
// confirm_password.onkeyup = validatePassword;
  $(".results")
    .mouseenter(".a_result .image-box", function(event) {
      console.log("mouse in!");
      console.log(this);
      console.log("ARGH");
      console.log(event.target);
      console.log("ARGH AGAIN");
      var src = $(this).find("img").attr("src");
      console.log(src);
      var new_src = src.slice(0, -6);
      console.log(new_src);
      $(this).find("img").attr("src", new_src + ".gif");
  })
    .mouseleave(function() {
      $(event.target).find(".a_result .image-box-animated").hide();
      $(event.target).find(".a_result .image-box").show()
    });

  $(".results")


});


