var mydata;
function fetchReport() {
    var year=$('#year').val();
    var month=$('#month').val();
    $.ajax({
        url: './FetchSalesReport.jsp',
        data: {
            year: year,
            month: month
        },
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            mydata=data;
            $('#salesrecord').html(data);
        }
    });
}
function openWindow() {
    var win = window.open("about:Sales_Report", "", "width=800,height=600");
    if(!mydata){
        win.document.write($('#salesrecord').html());
        return ;
    }
    setTimeout(function () {
        var date=new Date();
        win.document.write('<div class="row" style="justify-content: center; height:40px;">');
        win.document.write('<b>Date : '+date.getDay()+'-'+date.getMonth()+'-'+date.getFullYear()+'</b>');
        win.document.write('</div>');
        win.document.write('<div class="row" style="justify-content: center; height:40px;">');
        win.document.write('<b>Time : '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds()+'</b>');
        win.document.write('</div>');
        win.document.write(mydata);
        win.document.write('<div class="row" style="justify-content: center; height:40px;">');
        win.document.write('<button class="btn btn-warning" onclick="window.print()">Print</button>');
        win.document.write('</div>');
    }, 1000);
}

