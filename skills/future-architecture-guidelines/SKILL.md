---
name: future-architecture-guidelines
description: Use when applying Architecture Guidelines to software architecture, design review, API design, frontend, asynchronous processing, batch, integration, database, AWS, Terraform, logging, performance testing, documentation, code review, Git branching, and engineering communication decisions.
---

# Future Architecture Guidelines

## Overview

This skill helps Hermes use Future Architect's public **Architecture Guidelines** as a reference when answering architecture, design, implementation-policy, review, infrastructure, data, documentation, and engineering-process questions.

Primary source:

- Public site: https://future-architect.github.io/arch-guidelines/
- GitHub repository: https://github.com/future-architect/arch-guidelines
- License: CC-BY-4.0 — attribute Future Corporation / Future Architect source documents when summarizing or quoting.

Use this skill as a **navigation and application guide**, not as a frozen copy of the source. The source site may change; when correctness matters, consult the current page before answering.

## When to Use

Use this skill when the user asks about:

- Software architecture principles and design trade-offs
- Web frontend, Web API, async processing, batch, or system integration design
- PostgreSQL or DynamoDB data modeling and naming conventions
- AWS account/security/audit/cost design or Terraform conventions
- Logging, observability, performance testing, or operational readiness
- Git branching, code review, CI review automation, and development workflow
- Markdown design documents, technical writing, Slack usage, and architect soft skills
- Applying or adapting Future Architect's public guidelines to a concrete project
- Reviewing an existing design or implementation against architecture/design guidelines

Do **not** use this skill as the only authority when:

- The user has provided project-specific standards that conflict with the public guideline
- Regulatory, security, privacy, or contractual requirements override general guidance
- The answer requires current facts and the source page has not been checked recently
- The user asks for exact source wording; in that case, retrieve and cite the source page directly

## Source and Attribution Rules

- Treat the Future Architect guidelines as external source material.
- Attribute summaries and recommendations to the source when they rely on it.
- Prefer linking to the exact public page used.
- Avoid copying long passages verbatim unless the user explicitly asks and the license/attribution is handled.
- Separate:
  - what the guideline says,
  - how it applies to the user's context,
  - and any additional recommendation from Hermes.

Suggested attribution sentence:

> 参考: Future Architect「アーキテクチャ設計ガイドライン」該当ページ: <URL>

## Recommended Workflow

When using this skill:

1. **Classify the user's question.** Identify whether it is about principles, application architecture, data, infrastructure, operations, documentation, or engineering process.
2. **Select one or more source pages** from the routing table below.
3. **Consult the current source** when the details matter. Prefer the public HTML page for human-readable links, or the GitHub raw Markdown for text extraction.
4. **Extract the relevant guidance.** Do not overgeneralize from unrelated sections.
5. **Apply the guidance to the user's context.** State assumptions and constraints explicitly.
6. **Present trade-offs.** When the guideline implies a choice, explain alternatives, risks, and decision criteria.
7. **Cite the source URL(s).** Include the exact guideline page(s) used.
8. **Avoid treating the guideline as absolute law.** Adapt it to the user's project, organization, scale, and constraints.

## Quick Routing Table

| User question / task | Primary guideline page |
|---|---|
| Architecture mindset, basic principles, design judgment, trade-offs | Architecture Principles: https://future-architect.github.io/arch-guidelines/documents/forPrinciple/principle_guidelines.html |
| Web frontend architecture, SPA/SSR, components, directory structure | Web Frontend: https://future-architect.github.io/arch-guidelines/documents/forWebFrontend/web_frontend_guidelines.html |
| REST/Web API design, resources, versioning, hosting, compatibility | Web API: https://future-architect.github.io/arch-guidelines/documents/forWebAPI/web_api_guidelines.html |
| Async processing, queues, events, retries, resilience, sync vs async | Async: https://future-architect.github.io/arch-guidelines/documents/forAsync/async_guidelines.html |
| Batch design, workflow engines, job dependencies, scheduling | Batch: https://future-architect.github.io/arch-guidelines/documents/forBatch/batch_guidelines.html |
| System integration, file transfer, shared DB, RPC, messaging, OLAP | I/F: https://future-architect.github.io/arch-guidelines/documents/forIF/if_guidelines.html |
| Reports, PDF/Excel/paper reports, printing, report lifecycle | Report: https://future-architect.github.io/arch-guidelines/documents/forReport/report_guidelines.html |
| Email sending, SPF/DKIM/DMARC, reputation, warm-up | Mail: https://future-architect.github.io/arch-guidelines/documents/forMail/mail_guidelines.html |
| Log keys, levels, output items, layout, notification flags | Log: https://future-architect.github.io/arch-guidelines/documents/forLog/log_guidelines.html |
| PostgreSQL table design, normalization, naming, indexes, constraints | PostgreSQL: https://future-architect.github.io/arch-guidelines/documents/forDB/postgresql_guidelines.html |
| DynamoDB modeling, primary keys, indexes, single/multi-table design | DynamoDB: https://future-architect.github.io/arch-guidelines/documents/forDB/dynamodb_guidelines.html |
| Data governance, governance activities, guardrails, data asset health | Data Governance: https://future-architect.github.io/arch-guidelines/documents/forDataGovernance/data_governance_guidelines.html |
| Data management, data mesh, data catalog, roles, workflows | Data Management: https://future-architect.github.io/arch-guidelines/documents/forDataManagement/datamanagement_guidelines.html |
| AWS account separation, security, audit, Security Hub, CloudTrail, cost | AWS: https://future-architect.github.io/arch-guidelines/documents/forAWS/aws_guidelines.html |
| Terraform naming, syntax, variables, modules, resource design | Terraform: https://future-architect.github.io/arch-guidelines/documents/forTerraform/terraform_guidelines.html |
| Git branch strategy, branch names, main/develop/release/hotfix/topic | Git Branch Flow: https://future-architect.github.io/arch-guidelines/documents/forGitBranch/git_branch_standards.html |
| Markdown design documents, folder structure, diagrams, table definitions | Markdown Design Documents: https://future-architect.github.io/arch-guidelines/documents/forMarkdown/markdown_design_document.html |
| Code review process, review viewpoints, PR templates, CI checks | Code Review: https://future-architect.github.io/arch-guidelines/documents/forCodeReview/code_review.html |
| Performance testing plan, load testing, metrics, test steps | Performance Test: https://future-architect.github.io/arch-guidelines/documents/forPerformanceTest/performance_test.html |
| Slack workspace/channel/user naming and collaboration usage | Slack Usage: https://future-architect.github.io/arch-guidelines/documents/forSlack/slack_usage_guidelines.html |
| Technical writing, PREP/STAR, message design, explanation quality | Technical Writing: https://future-architect.github.io/arch-guidelines/documents/forTechnicalWriting/technical_writing_guidelines.html |
| Architect soft skills, situation analysis, planning, facilitation | Soft Skill: https://future-architect.github.io/arch-guidelines/documents/forSoftSkill/softskill_guidelines.html |

## Raw Markdown URL Map

When terminal or web extraction is easier than browser navigation, use the GitHub raw Markdown pages.

Base raw URL:

```text
https://raw.githubusercontent.com/future-architect/arch-guidelines/main/
```

Important raw paths:

```text
documents/forPrinciple/principle_guidelines.md
documents/forWebFrontend/web_frontend_guidelines.md
documents/forWebAPI/web_api_guidelines.md
documents/forAsync/async_guidelines.md
documents/forBatch/batch_guidelines.md
documents/forIF/if_guidelines.md
documents/forReport/report_guidelines.md
documents/forMail/mail_guidelines.md
documents/forLog/log_guidelines.md
documents/forDB/postgresql_guidelines.md
documents/forDB/dynamodb_guidelines.md
documents/forDataGovernance/data_governance_guidelines.md
documents/forDataManagement/datamanagement_guidelines.md
documents/forAWS/aws_guidelines.md
documents/forTerraform/terraform_guidelines.md
documents/forGitBranch/git_branch_standards.md
documents/forMarkdown/markdown_design_document.md
documents/forCodeReview/code_review.md
documents/forPerformanceTest/performance_test.md
documents/forSlack/slack_usage_guidelines.md
documents/forTechnicalWriting/technical_writing_guidelines.md
documents/forSoftSkill/softskill_guidelines.md
```

Example fetch:

```bash
python - <<'PY'
import requests
url = "https://raw.githubusercontent.com/future-architect/arch-guidelines/main/documents/forWebAPI/web_api_guidelines.md"
print(requests.get(url, timeout=20).text[:4000])
PY
```

## Cross-Cutting Application Principles

When applying the guidelines, keep these cross-cutting principles in mind:

1. **Expose constraints before choosing a solution.** State business, operational, security, data, scale, team, and timeline constraints.
2. **Avoid both over-engineering and under-engineering.** Explain why the proposed level of complexity is appropriate.
3. **Separate principles from project policy.** The public guideline informs judgment; it does not automatically become the user's project standard.
4. **Make trade-offs explicit.** Compare options using criteria such as maintainability, operability, security, cost, reversibility, and team familiarity.
5. **Design for operation, not only implementation.** Include logging, monitoring, failure handling, reviewability, and documentation when relevant.
6. **Prefer durable documentation.** For design decisions, suggest capturing the decision, alternatives, rationale, and consequences.
7. **Check for adjacent guidelines.** A Web API question may also need logging, performance, code review, and technical writing guidance.
