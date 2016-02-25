{% if theme.duoshuo and theme.duoshuo.shortname and (!is_home()) %}

  {% if theme.duoshuo.js_src %}
    {% set ds_src = theme.duoshuo.js_src %}
  {% else %}
    {% set ds_src = '//static.duoshuo.com/embed.js' %}
  {% endif %}

  <script type="text/javascript">
    var duoshuoQuery = {short_name:"{{ theme.duoshuo.shortname }}"};
    (function() {
      var ds = document.createElement('script');
      ds.type = 'text/javascript';ds.async = true;
      ds.id = 'duoshuo-script';
      ds.src = '{{ ds_src }}';
      ds.charset = 'UTF-8';
      (document.getElementsByTagName('head')[0]
      || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
  </script>

{% endif %}
