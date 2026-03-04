# Output all entities, grouped by device belonging to an integration



In general, this code outputs all entities grouped by devices which are belonging to an integration.

This example outputs all containers and their entities found by official portainer integration of homeassistant grouped by their devices.

*(using official portainer integration)*


Code:

```yaml
type: custom:auto-entities
card:
  type: vertical-stack
card_param: cards
filter:
  template: |
    {% set integration = 'portainer' %}
    {% set ns = namespace(grouped={}) %}
    {% for e in integration_entities(integration) %}
      {% set device = device_attr(e, 'name') %}
      {% if device in ns.grouped %}
        {% set ns.grouped = ns.grouped | combine({ device: ns.grouped[device] + [e] }) %}
      {% else %}
        {% set ns.grouped = ns.grouped | combine({ device: [e] }) %}
      {% endif %}
    {% endfor %}    [
    {% for device, entities in ns.grouped.items() %}
      {
        "type": "custom:mushroom-title-card",
        "title": "{{ device }}"
      }
      {%- for e in entities %}
      ,{
        "type": "entities",
        "entities": ["{{ e }}"]
      }
      {%- endfor %}
      {% if not loop.last %},{% endif %}
    {% endfor %}
    ]
```
