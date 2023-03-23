function currentOrder(){
    $.ajax({
       url : './fetchcurrentprevorder.jsp',
       data : {
           orderstatus : 'not delivered'
       },
        success: function (data, textStatus, jqXHR) {
            $('#orderbox').html(data);
        }
    });    
}
function previousOrder(){
    $.ajax({
       url : './fetchcurrentprevorder.jsp',
       data : {
           orderstatus : 'delivered'
       },
        success: function (data, textStatus, jqXHR) {
            $('#orderbox').html(data);
        }
    });    
}