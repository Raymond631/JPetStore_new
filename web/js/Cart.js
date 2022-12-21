$(document).ready(function ()
{
    $('#updateCart').on('submit', function ()
    {
        var details = $('#updateCart').serialize();
        $.post('../Cart/updateCart', details, function (data)
        {
            $('#updateCart').html(data);
        });
    });
});