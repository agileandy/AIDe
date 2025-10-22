Agentic Workflow Prompt Suite

Overview
This repository provides a lightweight prompt set for running an agentic software delivery workflow (ideate → plan → design → build) with clear governance and traceability. The entry point is specs/spec-prompt.md, which acts as the launch script and defines a Cascading Rulebook for source-of-truth precedence.

Who this is for
- Junior/mid-level developers or technically aware users who want structure and clarity when collaborating with AI agents.
- Teams who want consistent governance, quality gates, and traceability across stages.

How to use
1) Start with the launch script
- Open specs/spec-prompt.md.
- Fill in Name, Objective, Context (editable files, languages, constraints), Stakeholders, Success Metrics, Acceptance Criteria Summary, and Tasks.
- Use the Blocks section to declare explicit constraints (tech and operational). These guide all stages.
- The Cascading Rulebook defines how to resolve conflicts between sources (spec, project context, governance, design, role guides, stage prompts).

2) Seed core context
- specs/context/projectContext.md: Capture the project vision, goals, scope, stakeholders, and acceptance details.
- specs/context/systemDesign.md: Maintain architecture and technical decisions.
- specs/context/activeDevelopment.md: Log decisions, progress, blockers, and outcomes (newest entries at the top).

3) Run the staged workflow
- Ideate: Use specs/ideate-prompt.md to elicit and solidify requirements. It references the launch spec and governance docs.
- Plan: Use specs/plan-prompt.md to break down tasks and define acceptance criteria with tester alignment.
- Design: Use specs/design-prompt.md to produce architecture aligned to the plan and constraints.
- Build: Use specs/build-prompt.md to implement via TDD with quality gates.

4) Follow governance and roles
- Governance: specs/orchestrator/orchestrator.md and specs/orchestrator/workflow.md.
- Roles: specs/architect/architect.md, specs/coder/coder.md, specs/tester/tester.md.

5) Keep artifacts in sync
- Do not duplicate content across prompts. Reference the canonical files above.
- Record important decisions and conflicts in specs/context/activeDevelopment.md, citing sources and using the Rulebook to resolve conflicts.

Tips
- Treat specs/spec-prompt.md as the living launch spec for this initiative. Update tasks and constraints as you learn.
- Prefer links/references to copying content between files. This reduces drift.
- Use atomic commits and clear messages referencing tasks and acceptance criteria.

FAQ
- How do I handle conflicting guidance? Follow the Cascading Rulebook in specs/spec-prompt.md and log outcomes in specs/context/activeDevelopment.md. Escalate per orchestrator rules if unresolved.
- Can I change the stage prompts? Yes—keep them minimal and refer back to canonical sources rather than duplicating rules.
