# Compuco Platform Reliability & Delivery Accelerator

A focused proof-of-concept for standardising infrastructure, delivery, observability, and operational practices across managed Drupal/CiviCRM-style workloads.

> This repository is an independently created reference architecture based only on publicly available information about Compuco's technology stack and hiring requirements. It does **not** claim knowledge of Compuco's private infrastructure.

## Why this exists

Compuco's public DevOps requirements suggest a platform that spans AWS, Terraform, Ansible, Docker, NGINX/PHP, CI/CD, observability, networking, security, and production incident response.

The goal of this project is to demonstrate how those capabilities can be turned into a repeatable platform model that reduces environment drift, improves deployment safety, shortens incident response time, and gives clearer cost ownership.

## Outcomes this accelerator targets

- Reusable Terraform modules instead of per-client infrastructure snowflakes
- Standardised Ansible roles for host configuration and hardening
- Repeatable CI/CD validation and deployment workflows
- Baseline observability and alerting across application and infrastructure layers
- Documented incident response and postmortem practices
- Better cost visibility per workload/environment
- A practical path to evaluate Docker Swarm, ECS, and Kubernetes without forcing a migration

## Repository structure

```text
.
├── ansible/
│   ├── playbook.yml
│   └── roles/web/tasks/main.yml
├── docker/
│   ├── Dockerfile
│   └── nginx.conf
├── docs/
│   ├── architecture.md
│   ├── cost-optimisation.md
│   ├── incident-runbook.md
│   └── platform-scorecard.md
├── observability/
│   ├── prometheus.yml
│   └── alerts.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/network/main.tf
└── .github/workflows/platform-ci.yml
```

## Reference architecture

```text
Internet
  |
Cloudflare / CDN / WAF
  |
AWS Load Balancer
  |
Containerised PHP/Drupal workload
  |
Managed database

Shared platform services:
- Terraform for infrastructure provisioning
- Ansible for host/service configuration
- GitHub Actions or Jenkins for delivery
- Prometheus/Grafana/Loki or equivalent for telemetry
- Centralised runbooks and postmortems
- Cost allocation tags and environment-level reporting
```

## Suggested engagement model

### Week 1 - Discover
Map one representative workload: infrastructure, networking, deployment flow, monitoring, backups, incident history, and cost profile.

### Week 2 - Standardise
Identify duplicated patterns and convert the highest-value ones into reusable Terraform modules, Ansible roles, and CI templates.

### Week 3 - Implement
Apply one real improvement to a representative workload, such as deployment validation, monitoring, reusable infrastructure, or rollback automation.

### Week 4 - Hand over
Deliver documented standards, runbooks, cost recommendations, and a 90-day roadmap.

## Success metrics

- Deployment lead time
- Manual deployment steps
- Failed deployment rate
- Mean time to recovery
- Percentage of infrastructure covered by reusable modules
- Number of configuration drifts between environments
- Cost per environment/workload
- Time required to provision a new environment

## Design principles

1. Standardise first, migrate second.
2. Prefer reusable patterns over one-off automation.
3. Every production change should be observable and reversible.
4. Security checks should run before deployment, not after incidents.
5. Documentation is part of the platform, not an afterthought.
6. Platform choices should be justified by measurable operational outcomes.

## Author

Rahul H Bhatia

Cloud / DevOps / SRE / Platform Engineering
