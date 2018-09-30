// $(function () {
//     $.CateNav('#postsMarkdown', '#postsCatalog');//第一个参数为存放文章内容的box,第二个参数为存放生成目录的box
// })

$(function () {
    var $article = $('.posts-show-container .markdown');
    var $header = $article.find('h1, h2, h3,h4,h5') || [];
    if (!$article || $header.length == 0){
        return;
    }
    // 目录生成
    articleIndex();
    function articleIndex() {
        if ($header.length == 0) {
            return;
        }
        var _html = '<div class="nav-header"><span class="title">目录</span></div><div class="body"><div class="nav-body"><div id="postsActiveMenu" class="highlight-title" style="top:0;height:27px;display:block"></div><ul id="articleIndex" class="articleIndex"></ul></div></div>';
        $('#postsCatalog').append(_html);

        var _tagLevel = 1;                  // 最初的level
        var _$wrap = $('#articleIndex');    // 最初的wrap
        $header.each(function (index) {
            if ($(this).text().trim() === '') {     // 空的title
                return;
            }
            $(this).attr('id', 'articleHeader' + index);      // 加id
            var _tl = parseInt($(this)[0].tagName.slice(1));  // 当前的tagLevel
            var _$li = null;
            if (index === 0) { //第一个
                _$li = $('<li class="active"><a href="#articleHeader' + index + '">' + $(this).text() + '</a></li>');
                _$wrap.append(_$li);
            } else if (_tl === _tagLevel) {  // 与上一个相同
                _$li = $('<li><a href="#articleHeader' + index + '">' + $(this).text() + '</a></li>');
                _$wrap.append(_$li);
            } else if (_tl > _tagLevel) {  // 当前的大于上次的
                _$li = $('<ul><li><a href="#articleHeader' + index + '">' + $(this).text() + '</a></li></ul>');
                _$wrap.append(_$li);
                _$wrap = _$li;
            } else if (_tl < _tagLevel) {    // 当前的小于上次的
                _$li = $('<li><a href="#articleHeader' + index + '">' + $(this).text() + '</a></li>');
                if (_tl === 1) {
                    $('#articleIndex').append(_$li);
                    _$wrap = $('#articleIndex');
                } else {
                    _$wrap.parent('ul').append(_$li);
                    _$wrap = _$wrap.parent('ul');
                }
            }
            _tagLevel = _tl;
        });
    }
    // 目录生成 end

    //动态设置side的位置
    setSidePosition();
    $(window).scroll(function () {
        if (!$('#postsSide').length){
            return;
        }
        setSidePosition()
    })
    function setSidePosition(){
        if (!$article.length > 0) {
            return;
        }
      
        var sideOffsetTop = $('#postsSide').offset().top - $(document).scrollTop();
        var $side = $('.side-box-wrap');
        if (sideOffsetTop <= 0) {
            $side.css({
                position: 'fixed',
                top: 0
            })
        } else {
            $side.css({
                position: 'static'
            })
        }
    }
    //动态设置side的位置end

    //右侧导航链接高亮
    $(window).scroll(function () {
        var $menu = $("#articleIndex");
        var top = $(window).scrollTop();
        var currentId = ""; //滚动条现在所在位置的item id
        $header.each(function () {
            var m = $(this);
            //注意：m.offset().top代表每一个item到文档顶部的距离
            if (top > m.offset().top - 5) {
                currentId = "#" + m.attr("id");
                var currentLi = $menu.find("li.active");
                var currentLinkId = currentLi.find('a').attr("href");
                if (currentId && currentLinkId && currentLinkId != currentId) {
                    currentLi.removeClass("active");
                    var $needActiveLi = $menu.find('[href="' + currentId + '"]').parent('li');
                    var titleOffsetTop = $needActiveLi.offset().top - $('#articleIndex').offset().top
                    $('#postsActiveMenu').css({
                        top: titleOffsetTop
                    })
                    $needActiveLi.addClass("active");
                }
            } else {
                return false;
            }
        });

      
        var $footer = $('#footer');
        var footerHeight = $footer.height();
        var footerOffsetTop = $footer.offset().top;
        var windowHeight = window.innerHeight
        
        var $postsCatalog = $('#postsCatalog');
        // console.log('top + windowHeight:', top + windowHeight)
        // console.log('footerOffsetTop + footerHeight:', footerOffsetTop + footerHeight)
        if ((top + windowHeight) >= (footerOffsetTop)){
            $postsCatalog.css({
                height:'calc(100vh - 152px - 15px)'
            })
        }else {
            $postsCatalog.css({
                height: '100vh'
            })
        }
    });

    //右侧导航链接高亮end

    // 点击右侧菜单
    $('#postsCatalog a').click(function (e) {
        e.preventDefault();
        $('#postsCatalog').find("li.active").removeClass('active');
        $(this).parent('li').addClass('active');
        var currObj = $($(this).attr('href')) || 0;
        var offsetTop = currObj.offset().top;
        $('html,body').animate({
            scrollTop: offsetTop
        }, 500, 'swing');
    });
    // 点击右侧菜单end

    // 设置左侧工具栏的位置
    (function setPostsToolBarPosition() {
        var windowWidth = window.innerWidth;
        var mainWidth = $('#postsMainWrap').outerWidth();
        var left = (windowWidth - mainWidth) / 2 - 15 - 24;
        var $toolbar = $('#postsToolBar');
        $toolbar.css({
            left: left
        })
    })()

    //设置左侧工具栏鼠标悬停效果
    $('#postsToolBar .item').hover(function () {
        $(this).addClass('active');
    }, function () {
        $(this).removeClass('active');
    });

});
