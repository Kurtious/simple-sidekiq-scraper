
var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    // call set_positions function
    set_positions();
    
    $('.sortable').sortable();
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);


function submit(){
    var form = $('#form');
    var valuesToSubmit = form.serialize();
    $.ajax({
        type: "POST",
        url: form.attr('action'),
        data: valuesToSubmit,
        dataType: "JSON" 
    }).success(function(json){
        updateTable(json);
    });
    // reset and dismiss modal
    $(".modal-content").html("");
    $('#modal_edit').modal('hide');
    return false; // prevents normal behaviour
}
  
function updateTable(json){
  console.log(json);
  var id = json.id;
  var rank = json.rank;
  var name = json.name;
  var url = json.url;

  $("div[data-id="+id+"][data-name=name]").text(name);
  $("div[data-id="+id+"][data-name=rank]").text(rank);
  $("div[data-id="+id+"][data-name=url]").text(url);
}
