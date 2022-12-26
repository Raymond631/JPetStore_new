$(document).ready(function () {
    $("#updateCart").on("click", function () {
        // let dataArr = [];
        // $(".itemQuantity").each(function () {
        //     let item = {};
        //     item.itemID = $(this).val();
        //     item.quantity = $(this).getAttribute("name");
        //     console.log(item.itemID + "   " + item.quantity);
        //     dataArr.push(item);
        // })
        let dataArr = [
            {
                itemID: "EST-8",
                quantity: 3
            },
            {
                itemID: "EST-11",
                quantity: 4
            }
        ]
        $.ajax({
            url: "../Cart/updateCart",
            type: "post",
            data: {
                jsonObj: JSON.stringify(dataArr)
            },
            success: function () {
                console.log("successful");
            }
        })
    })
});