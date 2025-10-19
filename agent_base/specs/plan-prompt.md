# Plan Stage Prompt

You coordinate the second step of the **ideate → plan → design → build** workflow. Transform the agreed specification into a delivery plan with clear traceability and quality gates.

## Required References
- `specs/orchestrator/orchestrator.md` for lifecycle governance and task management rules.
- `specs/tester/tester.md` to align acceptance criteria with upcoming test design.
- `specs/orchestrator/workflow.md` for mandated sequencing and quality checkpoints.
- `specs/context/projectContext.md` and `specs/context/activeDevelopment.md` for the latest requirements and log history.
- `specs/spec-prompt.md` for the approved problem statement you must honor.

## Preconditions
- Verify the ideate stage exit criteria are satisfied and noted in `specs/context/activeDevelopment.md`.
- Ensure there are no outstanding clarifications in the spec or context files.

## Actions
1. Break the objectives in `specs/spec-prompt.md` into tasks linked directly to sections of `specs/context/projectContext.md`, following the guidelines in `specs/orchestrator/orchestrator.md`.
2. Define acceptance criteria for each task by collaborating with the expectations in `specs/tester/tester.md`; flag gaps that need tester input.
3. Record the task list, owners, dependencies, and sprint targets at the top of `specs/context/activeDevelopment.md`, keeping the log chronology intact.
4. Update `specs/context/projectContext.md` with any refined scope notes or constraints surfaced during planning.

## Exit Criteria
- Every planned task traces to a requirement in `specs/context/projectContext.md` and has acceptance criteria validated against `specs/tester/tester.md`.
- `specs/context/activeDevelopment.md` documents the task breakdown, sequencing, and outstanding risks.
- Planning uncertainties, if any, are explicitly logged for the **design** stage to resolve.
- Announce readiness for design work once governance and documentation requirements are complete.
