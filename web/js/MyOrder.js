$(document).ready(function () {
    getData();
    deleteFunc();
})

var ids = [];

function getData() {
    $.ajax({
        url: "../Order/getOrder",
        type: "get",
        dataType: "json",
        success: function (obj) {
            if (obj.length > 0) {

                let str = '';
                for (var key in obj) {
                    ids.push(obj[key].orderID);
                    str += `<div class="list-body myclear" data-checked = "false" style="padding-left: 20px">
								<div class="col col-name" style="padding-left: 20px;width: 300px">${obj[key].orderTime}</div>
								<div class="col col-price" style="width: 300px;color: "><a href="../Order/showOrderDetails?orderID=${obj[key].orderID}">#${obj[key].orderID}</a></div>
								<div class="col col-price" style="padding-left: 60px">${obj[key].receiver.receiverName}</div>
								<div class="col col-total" style="margin-left: 80px">${obj[key].totalPrice}</div>
								<div class="col col-action" style="margin-left: 120px"><div onclick="deleteFunc(${obj[key].orderID})">x</div></div>
							</div>`;
                }
                document.getElementById('wapper').innerHTML = str;
            }
        }
    })
}

function deleteFunc(orderID) {
    console.log(orderID)
    if (orderID != null && orderID != "") {
        if (confirm('是否删除')) {
            $.ajax({
                url: "../Order/deleteOrder?orderID=" + orderID,
                type: "get",
                success: function () {
                    console.log("deleteOrder")
                }
            });
        }
    }
}