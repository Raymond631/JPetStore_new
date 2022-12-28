window.addEventListener('load', function () {
    var preview_img = document.querySelector('.preview_img');
    var mask = document.querySelector('.mask');
    var big = document.querySelector('.big');
    preview_img.addEventListener('mouseover', function () {
        mask.style.display = 'block';
        big.style.display = 'block';
    })
    preview_img.addEventListener('mouseout', function () {
        mask.style.display = 'none';
        big.style.display = 'none';
    })
    preview_img.addEventListener('mousemove', function (e) {
        var x = e.pageX - this.offsetLeft;
        var y = e.pageY - this.offsetTop;
        var maskX = x - mask.offsetWidth / 2;
        var maskY = y - mask.offsetHeight / 2;
        var maskMAX = preview_img.offsetWidth - mask.offsetWidth;
        if (maskX <= 0) {
            maskX = 0;
        } else if (maskX >= maskMAX) {
            maskX = maskMAX;
        }
        if (maskY <= 0) {
            maskY = 0;
        } else if (maskY >= maskMAX) {
            maskY = maskMAX;
        }
        mask.style.left = maskX + 'px';
        mask.style.top = maskY + 'px';
        var bigIMG = document.querySelector('.bigImg');
        var bigMAX = bigIMG.offsetWidth - big.offsetWidth;
        var bigX = maskX * bigMAX / maskMAX;
        var bigY = maskY * bigMAX / maskMAX;
        bigIMG.style.left = -bigX + 'px';
        bigIMG.style.top = -bigY + 'px';
    })
})