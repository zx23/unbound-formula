{%- from "unbound/map.jinja" import unbound with context %}

anti_ad:
  file.managed:
    - name: {{ unbound.config_dir }}/ad_servers
    - source: http://pgl.yoyo.org/adservers/serverlist.php?hostformat=unbound&showintro=0&mimetype=plaintext
    - skip_verify: true
    - user: root
    - group: {{ unbound.wheel_group }}
    - mode: '0644'
