function filterProduct(from,to,cid){
    $.ajax({
       url : './../fetchproduct.jsp',
       data : {from : parseInt(from),to : parseInt(to),categoryid : parseInt(cid)},
        success: function (data, textStatus, jqXHR) {
            $('#fetchproductscetion').html(data);
            
        }
    });     
}
document.querySelector('#callfilter').addEventListener('click',()=>{
    var from=document.querySelector('#from').value;
    var to=document.querySelector('#to').value;
    var cid=document.querySelector('#categoryid').value;
    filterProduct(from,to,cid);
});