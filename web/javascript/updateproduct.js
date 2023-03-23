function updateProduct(productid) {
    console.log(productid);
    var pid=String('#quantity'+productid);
    console.log($(pid).val());
    $.ajax({
        url: './../UpdateProductServlet',
        data: {
             productid : productid,
             quantity : $(pid).val()
        },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            console.log("Update : "+data);
            if(data==='done'){
                makeDisableProduct(productid);
            }else if(data==='undone'){
                this.alert("value not updated !!! please refresh the page and try again");
            }
        }
    });
}
function makeDisableProduct(productid){
    console.log(productid);
    var pid=String('#quantity'+productid);
    if(document.querySelector(pid).disabled===true){
     $(pid).prop('disabled',false);
     }else{
     $(pid).prop('disabled',true);
     }
}
