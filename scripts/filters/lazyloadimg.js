'use strict';

var cheerio = require('cheerio');

var baseUrl = "";
var loading = "/images/loading.gif";
var oldsrc = '';

function stringStartsWith(string, prefix) {
    return string.slice(0, prefix.length) == prefix;
}

function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function lazyloadImg(source) {
    var $ = cheerio.load(source, {
        decodeEntities: false
    });
    $('img').each(function(index, element) {
        oldsrc = $(element).attr('src');
        if (oldsrc && !stringStartsWith(oldsrc, baseUrl) && !$(element).hasClass('hx_lazyimg') && !$(element).hasClass('skip')) {
            $(element).addClass('hx_lazyimg');
            $(element).attr({
                src: loading,
                'data-original': baseUrl + oldsrc 
            });
        }
    });
    return $.html();
}

if (hexo.config.lazyload) {
    hexo.extend.filter.register('after_render:html', lazyloadImg);
}
