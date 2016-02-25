<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta http-equiv="Cache-Control" content="no-transform"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta name="renderer" content="webkit">

{% if theme.favicon %}
  <link rel="shortcut icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}" />
{% endif %}

{% if theme.google_site_verification %}
<meta name="google-site-verification" content="{{ theme.google_site_verification }}"/>
{% endif %}
{% if theme.baidu_site_verification %}
<meta name="baidu-site-verification" content="{{ theme.baidu_site_verification }}"/>
{% endif %}

{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}

{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.root + config.feed.path %}
{% endif %}
{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}

{% if theme.gplus %}
<link rel="author" href="{{ theme.gplus }}"/>
<link rel="publisher" href="{{ theme.gplus }}"/>
{% endif %}

{% if not is_post()%}
{% if page.current == '1'%}
<link rel="canonical" href="{{ config.url }}"/>
{% else %}
<link rel="canonical" href="{{config.url}}/page/{{page.current}}"/>
{% endif %}
{% if page.prev %}
<link rel="prev" href="{{config.url}}/page/{{page.prev}}"/>
{%  endif %}
{% if page.next %}
<link rel="next" href="{{config.url}}/page/{{page.next}}"/>
{% endif %}
{% endif %}

<link href="//cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" skip="true">
{{ css('vendors/fancybox/source/jquery.fancybox.css') }}
{{ css('css/main.css') }}

<!--[if lt IE 9]>
     <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
     <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
