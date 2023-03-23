function updateOrder(orderid) {
    console.log(orderid);
    var expid=String('#expecteddate'+orderid);
    var statusid=String('#status'+orderid);
    console.log($(expid).val());
    console.log($(statusid).val());
    $.ajax({
        url: './../UpdateOrderServlet',
        data: {
            orderid : orderid,
            expecteddate : $(expid).val(),
            status : $(statusid).val()
        },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            console.log("Update : "+data);
            if(data==='done'){
                makeDisable(orderid);
            }else if(data==='undone'){
                alert("value not updated !!! please refresh the page and try again");
            }
        }
    });
}
function makeDisable(orderid){
    console.log(orderid);
    var expid=String('#expecteddate'+orderid);
    var statusid=String('#status'+orderid);
//    console.log($(expid).disabled);
    console.log($(statusid).prop('disabled',false));
    if(document.querySelector(expid).disabled===true){
     $(expid).prop('disabled',false);
     $(statusid).prop('disabled',false);
    }else{
     $(expid).prop('disabled',true);
     $(statusid).prop('disabled',true);
    }
}
