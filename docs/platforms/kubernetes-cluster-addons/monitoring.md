---
hide:
  - footer
---

## Introduction
Monitoring of user-deployed Kubernetes clusters is provided through a [Prometheus](https://prometheus.io/), [Grafana](https://grafana.com/oss/grafana/), [AlertManager](https://prometheus.io/docs/alerting/latest/alertmanager/), [Loki](https://grafana.com/oss/loki/), [Fluent-Operator](https://fluentbit.io/) stack.

This can all be accessed through [Grafana](https://grafana.com/docs/grafana/latest/), which can be found via the "Monitoring" link in the Details page of your Kubernetes Cluster.

![The link to monitoring is in Cluster Details](../../assets/images/accessing_monitoring.png){ loading=lazy }

The set of Monitoring cluster addons can be enabled/disabled on an existing cluster using the green <img loading="lazy" class="off-glb" src="../../assets/images/update-button.svg" style="height:1em; vertical-align:middle;"> `Update` button in details, under the Cluster Addons section.

!!! Info
    Even if the Monitoring cluster addon is disabled, Fluent-Operator will continue collecting logs to our central logging server as per our [security compliance policy](https://stfc.atlassian.net/wiki/spaces/CLOUDKB/pages/673185793/Security+Compliance).

Access to Grafana can be granted through the [Identity Provider](../../identity_provider/identity_provider.md)

### Accessing Dashboards
Grafana dashboards are an easy and accessible way to query and visualize data.

Azimuth provides a number of useful dashboards by default to access your logging, metrics and alerting. These can be found in Grafana under the "Dashboards" sidebar entry. New dashboards can also be created, see the [Grafana Docs](https://grafana.com/docs/grafana/latest/dashboards/).

![An example of a dashboard](../../assets/images/monitoring_dashboard.png){ loading=lazy }

### Accessing Metrics
The easiest way to browse Azimuth metrics is via the Dashboards.

However they can also be accessed under Drilldown → Metrics at a glance, or queried under Explore → Prometheus.

![Exploring metrics](../../assets/images/monitoring_metrics.png){ loading=lazy }

### Accessing Logs
The best place to examine logs is via Explore -> Loki
![Accessing logs via Explore - Loki](../../assets/images/monitoring_logs.png){ loading=lazy }

### Accessing Alerting
AlertManager is managed through Grafana, via the Alerting tab. Alert Rules, Silences, and Notifications can be configured.
Alerts can also be viewed.