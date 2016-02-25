<!DOCTYPE html>
<html class="{% if theme.use_motion %}  use-motion {% endif %}">

<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ config.language }}">

  {% include '_partials/old-browsers.swig' %} {% include '_partials/about.swig' %}
  <div id="blog">
    <div class="container wrapper {% block page_class %}{% endblock %}">
      <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
          <div class="header-inner">{{ partial('_partials/header.swig') }}</div>
      </header>

      <main id="main" class="main">
        <div class="main-inner">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
      </main>

      <footer id="footer" class="footer">
        <div class="footer-inner">
          {% include '_partials/footer.swig' %}
        </div>
      </footer>
      {% include '_partials/mobile-nav.swig' %}

    </div>
  </div>
  <!-- end blog-->

{# This block is used to set options before any other scripts run #}
{% block script_extra_before %}{% endblock %}



<script src="//cdn.bootcss.com/jquery/1.12.0/jquery.min.js" skip="true"></script>
  
{{ js('vendors/prettify/prettify.js') }}

{% if theme.use_motion %}
{% include '_scripts/motion.swig' %}
{% endif %}

{{ js('js/about.js') }}

{% if config.lazyload %}
{{ js('js/lazyload.js') }}
{% endif %}

{{ js('vendors/fancybox/source/jquery.fancybox.pack.js') }}
{{ js('js/fancy-box.js') }}
{{ js('js/dynamic.to.top.min.js')}}

{{ js('js/main.js') }}

 {% block script_extra %}{% endblock %}

{% include '_scripts/analytics.swig' %}

{% block comment_system %}
  {% include '_scripts/comments/duoshuo.swig' %}
  {% include '_scripts/comments/disqus.swig' %}
{% endblock %}

{% if theme.swiftype_key %}
<script type="text/javascript">
  (function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
    (w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
    e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
  })(window,document,'script','//s.swiftypecdn.com/install/v2/st.js','_st');

  _st('install', '{{ theme.swiftype_key }}','2.0.0');
</script>
{% endif %}
</body>
</html>
