{%- from "unbound/map.jinja" import unbound with context %}

include:
  - .anti_ad.sls

unbound:
  pkg.installed:
    - name: {{ unbound.package }}
  service.running:
    - name: {{ unbound.service }}
    - enable: True
    - require:
      - pkg: unbound
      - file: unbound
  file.managed:
    - name: {{ unbound.config }}
    - source: salt://unbound/files/unbound.conf.jinja
    - context:
        settings: {{ unbound }}
    - template: jinja
    - user: root
    - group: {{ unbound.wheel_group }}
    - mode: '0644'
    - require:
      - pkg: unbound
  cmd.wait:
    - name: 'service unbound reload'
    - user: root
    - watch:
      - pkg: unbound
      - file: unbound
