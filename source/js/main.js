jQuery(function($) {

    'use strict';

    var _Blog = window._Blog || {};

    _Blog.prettify = function() {
        $('pre').addClass('prettyprint linenums').attr('style', 'overflow:auto;');
        window.prettyPrint && prettyPrint();
    };

    _Blog.changeTitle = function() {
        var currentTitle = document.title;
        window.onblur = function() {
            document.title = 'I miss you!（＞﹏＜）';
        }
        window.onfocus = function() {
            document.title = currentTitle;
        }
    };

    _Blog.reward = function() {
        $(".reward .btn_a").fancybox({
            maxWidth: 600,
            maxHeight: 345,
            fitToView: false,
            autoSize: false,
            closeClick: false,
            openEffect: 'none',
            closeEffect: 'none',
            helpers: {
                title: {
                    type: 'inside'
                },
                overlay: {
                    locked: false
                }
            }
        });
    }

    _Blog.rewardTrack = function() {
        $("[data-track]").on("click", function() {
            var label = $(this).data("track");
            window._hmt && window._hmt.push(['_trackEvent', label, 'click']);
        });
    }


    $(document).ready(function() {
        _Blog.prettify();
        _Blog.changeTitle();
        _Blog.reward();
        _Blog.rewardTrack();
    });
});
