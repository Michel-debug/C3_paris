window.onload = function () {
    var dropdownItems = document.querySelectorAll('.dropdown-content a');

    dropdownItems.forEach(function (item) {
        item.addEventListener('click', function (e) {
            e.preventDefault();
            var flagImg = this.querySelector('img').src;
            document.querySelector('.nav-link-language').style.backgroundImage = 'url(' + flagImg + ')';
        });
    });

    // 轮播图
    $(document).ready(function(){
        $('.carousel').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2500,
            dots: false,
            arrows:false
        });
    });

    // 打字机效果
    let i = 0;
    let text = 'E-commerce transfrontalier';
    let speed = 100;

    function writeAuto() {
        if (i < text.length) {
            document.getElementById("demo").innerHTML += text.charAt(i);
            i++;
            setTimeout(writeAuto, speed);  //设置延迟，创建打字效果
        }
    }
    writeAuto();  //调用打字机效果函数

    window.onscroll = function() {myFunction()};
    var navbar = document.getElementsByClassName("navbar")[0];
    var navbarPlaceholder = document.getElementsByClassName("navbar-placeholder")[0];
    function myFunction() {
        if (window.scrollY >= document.documentElement.clientHeight) {
            navbar.classList.add("sticky");
            navbarPlaceholder.style.display = 'block';  /* 显示占位符 */
        } else {
            navbar.classList.remove("sticky");
            navbarPlaceholder.style.display = 'none';  /* 隐藏占位符 */
        }
    }

}
