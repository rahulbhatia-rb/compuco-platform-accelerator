# Cost Optimisation Framework

## Objective

Reduce infrastructure cost without trading away reliability or making the platform harder to operate.

## Baseline first

For each representative environment capture:

- Monthly compute spend
- Database spend
- Load balancer and network spend
- Storage and backup spend
- Observability/logging spend
- Data transfer
- Idle/non-production resource cost
- Cost per customer or workload where allocation is possible

## Review areas

### Compute
- Right-size sustained workloads from measured CPU/memory utilisation
- Identify idle development and test resources
- Evaluate Savings Plans only after establishing stable baseline demand
- Prefer autoscaling based on useful service signals where workloads are variable

### Database
- Validate instance sizing and storage growth
- Review backup retention against actual recovery requirements
- Check read replicas and HA topology against business needs
- Test restoration and capture recovery time rather than assuming backups are sufficient

### Networking
- Inspect NAT/data-transfer paths
- Avoid unnecessary cross-AZ or public data flows
- Review CDN/cache hit rates for static content
- Attribute shared network cost where practical

### Observability
- Define log retention by environment and data value
- Reduce high-volume low-value logs before ingestion
- Track cardinality and duplicate telemetry
- Keep incident-useful data long enough for investigation without retaining everything indefinitely

## Required tags

At minimum:

```text
Environment
Service
Client-or-Product
Owner
CostCenter
ManagedBy
```

## Output

Each recommendation should record:

| Field | Example |
|---|---|
| Current monthly cost | £X |
| Proposed monthly cost | £Y |
| Expected saving | £X-Y |
| Reliability impact | None / positive / risk |
| Engineering effort | S / M / L |
| Confidence | Low / medium / high |

The goal is a prioritised backlog based on savings, engineering effort, and operational risk—not a blanket mandate to use the cheapest service.
