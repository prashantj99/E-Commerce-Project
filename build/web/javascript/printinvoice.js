function printInvoice(orderid) {
    $.ajax({
        url: './invoice.jsp',
        data: {
            orderid: orderid
        },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
             openWindow(data);
        }
    });
}
function openWindow(data) {
  var win = window.open("about:blank", "", "width=800,height=600");
  setTimeout(function() {
    win.document.write(data);
//    win.document.close();
  }, 1000);
}
function printMe(){
    window.print();
    window.document.close();
}