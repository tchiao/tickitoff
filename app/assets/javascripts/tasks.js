var animatedDelete = function(){
    // get task and list id

    var id = $(this).attr('id')
    var list_id = $(this).data('list-id')

    // form the url for deleting the specific task, plus js request indicator at end
    var url = "/lists/" + list_id + "/tasks/" + id + ".js"

    // send AJAX request with HTTP verb delete
    setTimeout(function(){$.ajax(url, {type: "DELETE"})}, 500)
};


$(document).ready(function(){
  $(".delete-box").click(animatedDelete);  
})

