$(document).ready(function() {
    var max_fields      = 6; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
   
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div id="dev_details_group" style="margin-top: 10px;"> <span><input type="text" class="form-control" name="description" placeholder="Please enter description on task"/></span> <span><input type="text" class="form-control" name="hours" placeholder="Please enter how many hours"/></span>    <a class="remove_field" style="cursor:pointer;">Remove</a></div>'); //add input box
        }
    });
   
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div#dev_details_group').remove(); x--;
    })
});