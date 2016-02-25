Array.prototype.S = String.fromCharCode(2);
Array.prototype.in_array = function(e) {
    var r = new RegExp(this.S + e + this.S);
    return (r.test(this.S + this.join(this.S) + this.S));
};

Array.prototype.pull = function(content) {
    for (var i = 0, n = 0; i < this.length; i++) {
        if (this[i] != content) {
            this[n++] = this[i];
        }
    }
    this.length -= 1;
};

jQuery(function($) {
    window._lazyimgs = $("img.hx_lazyimg");
    if (_lazyimgs.length == 0) {
        return;
    }
    var toload_inds = [];
    var loaded_inds = [];
    var failed_inds = [];
    var failed_count = {};
    var lazyload = function() {
        if (loaded_inds.length == _lazyimgs.length) {
            return;
        }
        var threshold = 200;
        var attrName = 'data-original'
        _lazyimgs.each(function(i) {
            _self = $(this);
            if (_self.attr("lazyloadpass") === undefined && _self.attr(attrName) && (!_self.attr("src") || (_self.attr("src") && _self.attr(attrName) != _self.attr("src")))) {
                if ((_self.offset().top) < ($(window).height() + $(document).scrollTop() + threshold) && (_self.offset().left) < ($(window).width() + $(document).scrollLeft() + threshold) && (_self.offset().top) > ($(document).scrollTop() - threshold) && (_self.offset().left) > ($(document).scrollLeft() - threshold)) {
                    if (toload_inds.in_array(i)) {
                        return;
                    }
                    toload_inds.push(i);
                    if (failed_count["count" + i] === undefined) {
                        failed_count["count" + i] = 0;
                    }
                    _self.css("opacity", 1);
                    $("<img ind=\"" + i + "\"/>").bind("load", function() {
                        var ind = $(this).attr("ind");
                        if (loaded_inds.in_array(ind)) {
                            return;
                        }
                        loaded_inds.push(ind);
                        var _img = _lazyimgs.eq(ind);
                        _img.attr("src", _img.attr(attrName)).css("background-image", "none").attr("lazyloadpass", "1");
                    }).bind("error", function() {
                        var ind = $(this).attr("ind");
                        if (!failed_inds.in_array(ind)) {
                            failed_inds.push(ind);
                        }
                        failed_count["count" + ind]++;
                        if (failed_count["count" + ind] < 2) {
                            toload_inds.pull(ind);
                        }
                    }).attr("src", _self.attr(attrName));
                }
            }
        });
    }
    lazyload();
    var ins;
    $(window).scroll(function() {
        clearTimeout(ins);
        ins = setTimeout(lazyload, 100);
    });
    $(window).resize(function() {
        clearTimeout(ins);
        ins = setTimeout(lazyload, 100);
    });
});

jQuery(function($) {
    var calc_image_height = function(_img) {
        var width = _img.attr("width");
        var height = _img.attr("height");
        if (!(width && height && width >= 300)) return;
        var now_width = _img.width();
        var now_height = parseInt(height * (now_width / width));
        _img.css("height", now_height);
    }
    var fix_images_height = function() {
        _lazyimgs.each(function() {
            calc_image_height($(this));
        });
    }
    fix_images_height();
    $(window).resize(fix_images_height);
});
