/*global $*/
$(document).ready(function(){
  $("#accounts-search #term").on("keyup", function(){
    var jqxhr = $.get(
      $("#accounts-search").attr("action"),
      {term: $("#accounts-search #term").val()},
      function(){
        var result = $("#accounts-result").html();
        if(!result){
          $("#accounts-search #term").popover({
            content: "No result found.",
            placement: "bottom",
            html: true,
            trigger: "focus"
          });
        } else {
          $("#accounts-search #term").popover({
            content: $("#accounts-result"),
            placement: "bottom",
            html: true,
            trigger: "focus"
          });
        }
        $("#accounts-search #term").popover("show");
      }
    )
  })
});
