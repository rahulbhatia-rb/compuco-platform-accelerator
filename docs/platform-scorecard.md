# Platform Maturity Scorecard

Use this scorecard during discovery to avoid prescribing technology before understanding the operational problem.

Score each category from 0 to 3:

- **0** — largely manual / undocumented
- **1** — partially standardised
- **2** — repeatable and documented
- **3** — automated, measured, and continuously improved

| Category | What to assess |
|---|---|
| Infrastructure as code | Coverage, reuse, state management, review process |
| Configuration management | Idempotency, role reuse, drift controls |
| Deployment | Repeatability, approvals, rollback, lead time |
| Security | Secret handling, patching, scanning, least privilege |
| Observability | Metrics, logs, alerts, service-level signals |
| Incident response | Ownership, runbooks, postmortems, action tracking |
| Reliability | Backups, restore tests, redundancy, failure testing |
| Cost management | Allocation, right-sizing, idle resources, trends |
| Documentation | Architecture, service ownership, operational guides |
| Developer experience | Time to provision, deploy, debug, and recover |

## Example output

```text
IaC                 2/3
Configuration       2/3
Deployment          1/3
Security            2/3
Observability       1/3
Incident response   2/3
Reliability         2/3
Cost management     1/3
Documentation       2/3
Developer experience 1/3
```

The lowest score is not automatically the first priority. Rank improvements by business impact, risk reduction, engineering effort, and ability to become a reusable platform capability.
