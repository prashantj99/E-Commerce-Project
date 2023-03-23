function addReview(productid, userid) {
    var comment = $('#comment').val();
    console.log(comment);
    var starcount = getStar();
    console.log(starcount);
    $.ajax({
        url: './../AddReviewServlet',
        data: {
            comment: comment,
            starcount: starcount,
            productid: productid,
            userid: userid
        },
        success: function (data, textStatus, jqXHR) {
            if (data === 'done') {
                $('#comment').val("");
                var id;
                for (i = 1; i <= 6; i++) {
                    id = String("#star" + i);
                    if (document.querySelector(id).checked === true) {
                        $(id).prop("checked", false);
                        break;
                    }
                }
            }
        }
    });
}
function getStar() {
    var id;
    for (i = 1; i <= 6; i++) {
        id = String("#star" + i);
        if (document.querySelector(id).checked === true) {
            return $(id).val();
        }
    }
}