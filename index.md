---
---
{% for data in site.data %}
## {{ data[0] }}
{% for element in data[1] %}
### {{ element[0] }}
{% for command in element[1] %}
|---:|:---|
|`{{ command[1].code }}`|**{{ command[0] | replace: "_", " " | upcase }}**|
{% endfor %}
{% endfor %}
{% endfor %}
