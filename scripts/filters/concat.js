'use strict';

var cheerio = require('cheerio');
var siteurl = hexo.config.url;

function concat(source) {
  var $ = cheerio.load(source, {
    decodeEntities: false
  });

  if (hexo.config.concat.css) {
    var elements = [];
    var urls = [];
    $('link', 'head').each(function(i, e) {
      var link = $(e);
      var skip = link.attr("skip");
      if (!skip && (link.attr('rel') == 'stylesheet' || link.attr('type') == 'text/css')) {
        urls.push(link.attr('href') + ",");
        elements.push(link);
      }
    });

    if (elements.length && urls.length && elements.length == urls.length) {
      for (var i = 0; i < elements.length - 1; i++) {
        elements[i].remove();
      };

      var concatUrl = urls.join('');
      var link = elements[elements.length - 1];
      link.attr('href', siteurl + "??" + concatUrl.substring(0, concatUrl.length - 1));
    }
  }

  if (hexo.config.concat.js) {
    var elements = [];
    var urls = [];
    $('script').each(function(index, element) {
      var script = $(element).attr("src");
      var skip = $(element).attr("skip");
      if (script && !skip) {
        urls.push(script + ",");
        elements.push($(element));
      }
    });

    if (elements.length && urls.length && elements.length == urls.length) {
      for (var i = 0; i < elements.length - 1; i++) {
        elements[i].remove();
      };

      var concatUrl = urls.join('');
      var script = elements[elements.length - 1];
      script.attr({
        'async':'',
        'src': siteurl + "??" + concatUrl.substring(0, concatUrl.length - 1)
      });
    }

  }
  return $.html();
}


if (hexo.config.concat &&(hexo.config.concat.js || hexo.config.concat.css)) {
  hexo.extend.filter.register('after_render:html', concat);
}
