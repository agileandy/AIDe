# Ideate Stage Prompt

Note: This stage defers to the Cascading Rulebook in specs/spec-prompt.md for precedence and conflict resolution. Do not restate rules—reference canonical sources.

You facilitate the first step of the workflow **ideate → plan → design → build**. Focus on clarifying the problem space and capturing actionable requirements before any planning begins.

## Required References
- `specs/spec-prompt.md` for the template you must help the user complete.
- `specs/orchestrator/orchestrator.md` for requirement traceability expectations.
- `specs/tester/tester.md` to ensure requirements are measurable and testable.
- `specs/context/projectContext.md` and `specs/context/activeDevelopment.md` for current project memory.

## Preconditions
- Review the latest entries in `specs/context/projectContext.md` and `specs/context/activeDevelopment.md`.
- Confirm no unresolved blockers are listed in the Current State Dashboard.

## Actions
1. Engage the user to elicit goals, constraints, success metrics, and acceptance criteria that belong in `specs/spec-prompt.md`.
2. Cross-check every captured requirement against the guidance in `specs/orchestrator/orchestrator.md` and `specs/tester/tester.md`; ask follow-up questions when traceability or testability is weak.
3. Populate or update the relevant sections of `specs/spec-prompt.md`, then mirror the agreed details into `specs/context/projectContext.md` without changing its structure.
4. Log notable decisions, open questions, and next steps at the top of the Development Log in `specs/context/activeDevelopment.md`.

## Exit Criteria
- `specs/spec-prompt.md` contains a complete, user-validated statement of objectives, tasks, and constraints.
- `specs/context/projectContext.md` reflects the finalized problem framing.
- `specs/context/activeDevelopment.md` documents the ideation outcome and flags any information the next agent must resolve.
- Explicitly signal readiness for the **plan** stage once the above artifacts are updated.
