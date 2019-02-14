---
---
{% assign data_sorted = site.data | sorted %}
{% for data in data_sorted %}
<section class="{{ data[0] | slugify }}">
  <header>
    {{ data[0] }}
  </header>
{% for element in data[1] %}
  <article>
{% if element[1].first == nil %}
{% include level_0.html %}
{% else %}
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
      <span class="command_title">
        {{ command[0] | replace: "_", " " }}
      </span>
{% for subcommand in command[1] %}
      <dt>
        {{ subcommand[0] | replace: "_", " " }}
      </dt>
      <dd>
        {{ subcommand[1] | newline_to_br }}
      </dd>
{% endfor %}
{% else %}
      <dt>
       {{ command[0] | replace: "_", " " }}
      </dt>
      <dd>
        {{ command[1] | newline_to_br }}
      </dd>
{% endif %}
{% endif %}
{% endif %}
{% endfor %}
    </dl>
{% endif %}
  </article>
{% endfor %}
</section>
{% endfor %}
