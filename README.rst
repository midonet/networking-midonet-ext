======================
networking-midonet-ext
======================

networking-midonet-ext extends the features of the Midonet Neutron plugin.  It
contains features that did not make into the stable branch of
networking-midonet due to late submission.

For the newton release, the following features are included in
networking-midonet-ext:

- qos
- lbaasv2
- fip64


Supported MidoNet versions
--------------------------

The current set of supported versions of MidoNet are:

- v5.4

How to Install
--------------

For productional deployments, we recommend to use a package for your
distribution if available::

    http://builds.midonet.org/

You can install the plugin from the source code by running the following
command::

    $ sudo python setup.py install


The extension package requires python-networking-midonet package.


Core plugin
-----------

ML2 mechanism driver
~~~~~~~~~~~~~~~~~~~~

networking-midonet-ext includes a custom ML2 mechanism driver.
ML2 mechanism driver for the extension can be configured in
`/etc/neutron/neutron.conf` as::

    [ml2]
    mechanism_drivers = midonet_ext


MidoNet monolithic plugin
~~~~~~~~~~~~~~~~~~~~~~~~~

networking-midonet-ext includes a custom MidoNet monolithic plugin.
Monolithic plugin can be configured in `/etc/neutron/neutron.conf` as::

    [DEFAULT]
    core_plugin = midonet_v2_ext


L3 Service plugin
~~~~~~~~~~~~~~~~~

networking-midonet-ext includes a custom L3 service plugin.
L3 service plugin can be configured in `/etc/neutron/neutron.conf` as::


    [DEFAULT]
    service_plugins = midonet_l3_ext


QoS
---

networking-midonet-ext supports Neutron QoS extension.

QoS service plugin
~~~~~~~~~~~~~~~~~~

QoS service plugin can be configured in the Neutron server configuration
file `/etc/neutron/neutron.conf`::

    [DEFAULT]
    service_plugins = qos

    [qos]
    notification_drivers = midonet

QoS core resource extension for ML2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

QoS core resource extension for ML2 plugin can be configured in the
Neutron server configuration file `/etc/neutron/neutron.conf`::

    [ml2]
    extension_drivers = qos

QoS core resource extension for the monolithic plugin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

No configuration is necessary.


LBaaS v2
--------

networking-midonet-ext provides LBaaS v2 service driver.

To configure it, add the following entries in the Neutron configuration
file ``/etc/neutron/neutron.conf`` [1]_::

    [DEFAULT]
    service_plugins = neutron_lbaas.services.loadbalancer.plugin.LoadBalancerPluginv2

    [service_providers]
    service_provider=LOADBALANCERV2:Midonet:midonet_ext.neutron.services.loadbalancer.v2_driver.MidonetLoadBalancerDriver:default


FIP 64
------

networking-midonet-ext provides 'fip64' API extension.
To enable this extension, the path to the extension directory of
networking-midonet-ext must be specified in ``/etc/neutron/neutron.conf``.
For example, if networking-midonet-ext is installed in the directory
``/usr/lib/python2.7/dist-packages/midonet-ext``, add the following::


    [DEFAULT]
    api_extensions_path = /usr/lib/python2.7/dist-packages/midonet-ext/neutron/extensions


MidoNet API Client
------------------

networking-midonet-ext provides a custom MidoNet API client.

To configure it, add teh following entry in the MidoNet plugin configuration
file ``/etc/neutron/plugins/midonet/midonet.ini``::

    [MIDONET]
    client = midonet_ext.neutron.client.api.MidonetApiClient


.. [1] https://bugs.launchpad.net/neutron/+bug/1630693
