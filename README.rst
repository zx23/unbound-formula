=======
unbound
=======

SaltStack formula to install, configure and start `Unbound
<https://www.unbound.net/>`_, a validating, recursive, and caching DNS
resolver.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``unbound``
-----------

Install the unbound package, configure and start the unbound service.

Configuration
=============

See ``unbound/pillar.example`` for a sample configuration.

Notes
=====

* The values for ``local-zone`` directive need to be specified as a list and
  surrounded by single quotes.
* For Debian, the packaged default config includes, "/etc/unbound/unbound.conf.d". It is suggested to set the "unbound:config" pillar. See ``unbound/pillar.example``.
