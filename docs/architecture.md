# Architecture Assessment

## Purpose

This is a reference architecture for a managed PHP/Drupal/CiviCRM-style workload. It is intentionally conservative: standardise operating practices before proposing a major platform migration.

## Current-state hypothesis

Based on the public role description, likely concerns worth validating include:

- Multiple client or product environments with overlapping infrastructure patterns
- AWS resources provisioned through Terraform
- Host/service configuration managed with Ansible
- Containerised production workloads using Docker and/or Docker Swarm
- NGINX/PHP application delivery
- Multiple observability tools and production incident responsibilities
- CI/CD implemented across Jenkins and/or GitHub Actions

These are hypotheses only and should be confirmed during discovery.

## Proposed platform layers

### Edge
- Cloudflare/CDN/WAF
- TLS termination and certificate lifecycle
- Rate limiting and basic DDoS controls

### Network
- Per-environment VPC boundaries where appropriate
- Public subnets only for ingress components
- Application/data workloads kept private
- Explicit security-group relationships rather than broad CIDR access

### Application
- Immutable container image
- Health/readiness endpoints
- Externalised secrets and configuration
- Versioned deployment artefacts
- Rollback to a previously verified image

### Data
- Managed relational database where possible
- Automated backups
- Restore testing, not only backup creation
- Encryption at rest and controlled administrative access

### Delivery

```text
Pull request
  -> lint / validate
  -> IaC security scan
  -> build image
  -> automated test
  -> plan
  -> approval policy
  -> deploy
  -> health validation
  -> rollback on failure
```

### Observability

Use four common signals across workloads:

1. Availability
2. Error rate
3. Latency
4. Resource saturation

Logs, metrics, and deployment events should share environment/service identifiers so an incident can be correlated quickly.

## Orchestrator decision

A Docker Swarm-to-Kubernetes migration should not be assumed to be valuable. Evaluate at least:

| Dimension | Swarm | ECS | Kubernetes/EKS |
|---|---|---|---|
| Operational overhead | Low | Low-medium | High |
| AWS integration | Medium | High | High |
| Portability | Medium | Medium | High |
| Ecosystem/extensibility | Low-medium | Medium | Very high |
| Skills requirement | Lower | Medium | Higher |

The preferred option should follow workload complexity, team skills, availability goals, deployment requirements, and total operating cost.

## First production candidate

Select one representative but non-critical workload and establish baseline metrics before making changes. Implement one improvement end-to-end, measure the result, and then decide whether the pattern should become a platform standard.
