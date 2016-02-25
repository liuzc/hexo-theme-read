{% if page.prev or page.next %}
  <nav class="pagination">
    {{
      paginator({
        prev_text: '<i class="fa fa-chevron-left"></i>',
        next_text: '<i class="fa fa-chevron-right"></i>',
        mid_size: 1
      })
    }}
  </nav>
{% endif %}
