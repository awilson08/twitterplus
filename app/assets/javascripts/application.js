// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {
  $("#user_login").blur(function() {
    //remove all the class add the messagebox classes and start fading
    $("#msgbox").removeClass().addClass('messagebox').text('Checking...').fadeIn("slow");
    //check the username exists or not from ajax
    $.post("/checkuser",{ user_login:$(this).val() } ,function(data) {
      if(data=='true') { //if username not avaiable
        $("#msgbox").fadeTo(200,0.1,function() { //start fading the messagebox
          //add message and change the class of the box and start fading
          $(this).html('This User name Already exists').addClass('messageboxerror').fadeTo(900,1);
        });
        } else {
          $("#msgbox").fadeTo(200,0.1,function() {  //start fading the messagebox
          //add message and change the class of the box and start fading
          $(this).html('Username available to register').addClass('messageboxok').fadeTo(900,1);
        });
      }
    });
  });
});