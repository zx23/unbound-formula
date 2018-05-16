{%- from "unbound/map.jinja" import unbound with context %}

{%- if unbound.anti_ad %}
include:
  - .anti_ad
{%- endif %}

anti_ad:
  file.managed:
    - name: {{ unbound.config_dir }}/ad_servers
    - source: http://pgl.yoyo.org/adservers/serverlist.php?hostformat=unbound&showintro=0&mimetype=plaintext
    - user: root
    - group: {{ unbound.wheel_group }}
    - mode: '0644'
