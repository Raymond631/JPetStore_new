$(function () {
    $('#keyword').on('keyup', function () {
        var keyword = $(this).val();
        if (keyword !== null && keyword !== '') {
            $.ajax({
                type: 'GET',
                url: '../Pet/searchTips?keyword=' + keyword,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.isEmptyObject()) {
                        console.log("kong")
                        $(".result-list").empty();
                    } else {
                        console.log("bu_kong")
                        $(".result-list").empty();
                        // let length = data.length > 10 ? 10 : data.length;
                        // let productListHtml = '';
                        // for (var i = 0; i < length; i++) {
                        //     productListHtml += '<li class=\"productAutoItem\">';
                        //     productListHtml += data[i].category;
                        //     productListHtml += ": ";
                        //     productListHtml += data[i].name;
                        //     productListHtml += '</li>';
                        // }
                        // $('#productAutoList').html(productListHtml);
                        // $('#productAutoComplete').show();
                    }
                },
                error: function (error) {
                    console.log("error" + error)
                }
            })
        } else {
            //do nothing?
        }
    })
});