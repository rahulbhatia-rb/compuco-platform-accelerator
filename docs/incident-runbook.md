# Incident Response Runbook

## Severity guide

- **SEV1**: widespread outage, security event, or critical data risk
- **SEV2**: significant degradation or partial outage affecting users
- **SEV3**: limited impact with workaround available

## First 15 minutes

1. Confirm impact and affected service/environment.
2. Assign an incident lead.
3. Freeze unrelated production changes.
4. Check the most recent deployment/configuration/infrastructure changes.
5. Check availability, error rate, latency, and saturation.
6. Decide whether rollback is safer than continued diagnosis.
7. Record timestamps and actions as they happen.

## Triage order

```text
Edge/CDN/WAF
  -> Load balancer
  -> Network/security groups/DNS/TLS
  -> Container/process health
  -> NGINX/PHP
  -> Database/dependencies
  -> Recent deploy/config changes
```

## Recovery principles

- Restore service before optimising the fix.
- Prefer a known-good rollback when root cause is uncertain and rollback is low risk.
- Validate recovery with user-facing checks, not only process status.
- Continue monitoring after recovery for recurrence.

## Post-incident review

Document:

- Customer/user impact
- Timeline
- Trigger
- Root cause
- Contributing factors
- Why monitoring did or did not detect it
- What restored service
- Preventive actions with owners and due dates

Avoid treating 'human error' as a root cause. Ask what control, test, workflow, or system design allowed the error to become an incident.

## Useful service-level measures

- Mean time to detect
- Mean time to acknowledge
- Mean time to recover
- Deployment failure rate
- Repeat incidents caused by the same underlying issue
