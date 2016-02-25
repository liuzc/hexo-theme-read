<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="icon-next-heart fa fa-heart"></i> 
  </span>
  <span class="author" itemprop="copyrightHolder"><a href="{{ site.root }}/#about">{{ config.title }}</a></span> 
  <span>{{ theme.subtitle }} | </span>  
  {% if theme.beian %}<a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">{{ theme.beian }} </a> | {% endif %}
  <span>Powered by <a href="http://hexo.io">Hexo</a></span>
</div>


 <div class="union">
  <a href="https://www.upyun.com/?ref=liuzhichao.com" target="_blank"><img class="skip_lazyload skip" src="/images/assets/upyun_logo_90x45.png" alt="UPYUN"></a>
</div>

{% block footer %}{% endblock %}
