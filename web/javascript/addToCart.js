function addToCart(userid,productid,productquantity){
    $.ajax({
       url : './../AddToCartServlet',
       data : {
           userid : parseInt(userid),
           productid : parseInt(productid),
           productquantity : parseInt(productquantity)
           },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()==='done'){
                swal("Product Added :)", "Proceed to checkout", "success");
            }else{
                swal("Product Not Added !!!", "Try again!!!", "error");
            }
        }
    });
}

