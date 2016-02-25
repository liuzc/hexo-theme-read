{% if theme.menu %}
<div class="am-navbar am-cf am-navbar-default" id="mobile-nav">
      <ul class="am-navbar-nav am-cf am-avg-sm-4">
        {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName }}">
          <a href="{{ url_for(path) }}" rel="section">
      
              <i class="menu-item-icon fa fa-{{theme.menu_icons[itemName] || 'question-circle'}} fa-fw"></i> <br />
          
            {{ __('menu.' + itemName) }}
          </a>
        </li>
      {% endfor %}
         
      </ul>
  </div>
 {% endif %}