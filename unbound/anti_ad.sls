{%- from "unbound/map.jinja" import unbound with context %}

anti_ad:
  file.managed:
    - name: {{ unbound.config_dir }}/ad_servers
    - source: http://pgl.yoyo.org/adservers/serverlist.php?hostformat=unbound&showintro=0&mimetype=plaintext&showintro=0
    - skip_verify: true
    - user: root
    - group: {{ unbound.wheel_group }}
    - mode: '0644'

prepend_ad_server:
  file.prepend:
    - name: {{ unbound.config_dir }}/ad_servers
    - text: 'server:'
    - require:
      - file: anti_ad
