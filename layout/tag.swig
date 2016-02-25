{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}


{% block title %} {{ __('title.tag') }}: {{ page.tag }} | {{ config.title }} {% endblock %}

{% block content %}

  <div id="posts" class="posts-collapse">
    <div class="collection-title">
      <h2 >
        {{ page.tag }}
        <small>{{  __('title.tag')  }}</small>
      </h2>
    </div>

    {% for post in page.posts %}
      {{ post_template.render(post) }}
    {% endfor %}
  </div>

  {% include '_partials/pagination.swig' %}
{% endblock %}


{% block script_extra_before %}
  {% if theme.use_motion %}
    <script type="text/javascript">
      postMotionOptions = {stagger: 100, drag: true};
    </script>
  {% endif %}
{% endblock %}
