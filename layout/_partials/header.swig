<div class="site-header" role="banner">
<nav class="top-nav">
   <a id="nav-rss-link" class="nav-icon" href="/atom.xml" title="RSS Feed" target="_blank"></a>
   <a id="nav-search-btn" class="nav-icon st-search-show-outputs" href="#" title="Search"></a>
</nav>
  <hgroup>
    {%if theme.custom_logo_image %}
    <h1 class="site-title">
      <a rel="home" href="/#about">
      <span class="logo-line-before">
        <i></i>
      </span>
        <img class="skip custom_logo" alt="{{ config.title }}" src="{{ theme.custom_logo_image }}">
        <span class="logo-line-after">
          <i></i>
        </span>
      </a>
    </h1>
  {% else %}
    <h1 class="site-title">
      <a href="{{ config.root }}" class="brand" rel="home">
        <span class="logo-line-before">
          <i></i>
        </span>
        <span class="site-title">{{ config.title }}</span>
        <span class="logo-line-after">
          <i></i>
        </span>
      </a>
    </h1>
    {% endif %}
    <h2 class="site-description">{{ config.subtitle  }}</h2>
  </hgroup>

  <nav id="site-navigation" class="main-navigation" role="navigation">
    {% if theme.menu %}
    <ul id="menu" class="menu {{ hasSearch and 'menu-left' }}">
      {% for name, path in theme.menu %}
      {% set itemName = name.toLowerCase() %}
      <li class="menu-item menu-item-{{ itemName }}">
        <a href="{{ url_for(path) }}" rel="section">
          {{ __('menu.' + itemName) }}
        </a>
      </li>
      {% endfor %}
    </ul>
    {% endif %}
  </nav>
</div>
