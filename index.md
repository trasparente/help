---
---
{% for data in site.data %}
<section class="{{ data[0] | slugify }}">
  <header>
    {{ data[0] }}
  </header>
{% for element in data[1] %}
  <article>
    <header>
      {{ element[0] }}
    </header>
    <dl>
{% for command in element[1] %}
{% if element[1].first == nil %}
      <dt></dt>
      <dd>
        {{ element[1] | newline_to_br }}
      </dd>
{% else %}
{% if command.first == nil %}
      <dt>{% if forloop.index != 1 %}or{% endif %}</dt>
      <dd>{{ command }}</dd>
{% else %}
{% if command[1].first %}
      <dt>
        {{ command[0] | replace: "_", " " | upcase }}
      </dt>
      <dd>
        {{ command[1].code | newline_to_br }}
      </dd>
{% else %}
      <dt>
       {{ command[0] | replace: "_", " " | upcase }}
      </dt>
      <dd>
        {{ command[1] | newline_to_br }}
      </dd>
{% endif %}
{% endif %}
{% endif %}
{% endfor %}
    </dl>
  </article>
{% endfor %}
</section>
{% endfor %}
