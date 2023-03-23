function getNxt(orderid,productid){
    $.ajax({
        url: './fetchreviewproduct.jsp',
        data: {
            productid: productid,
            orderid: orderid
        },
        success: function (data, textStatus, jqXHR) {
//            if (data === 'done') {
                console.log(data);
                $('#productbox').html(data);
//            }
        }
    });
}