$(function () {
    // 回到顶部
    $(document).on('click', '#gotop', function () {
        $('body,html').animate({ 'scrollTop': 0 }, 500)
    })

    $(window).scroll(function () {
        if ($(this).scrollTop() > 500) {
            $('#gotop').fadeIn() // 当页面向下滚动的距离大于500px时，慢慢地显示「回到顶部按钮」
        } else {
            $('#gotop').fadeOut() // 否则慢慢地隐藏「回到顶部按钮」
        }
    });
    // 回到顶部 end
});