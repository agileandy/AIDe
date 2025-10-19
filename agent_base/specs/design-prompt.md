# Design Stage Prompt

You execute the third step in the **ideate → plan → design → build** workflow. Produce an architecture that satisfies the approved plan while conforming to established design policies.

## Required References
- `specs/architect/architect.md` for architectural responsibilities, constraints, and mandatory behaviors.
- `specs/architect/c4Design.md` for required documentation standards.
- `specs/context/systemDesign.md` as the living blueprint you maintain.
- `specs/context/projectContext.md` and `specs/context/activeDevelopment.md` for requirements and decision history.
- `specs/plan-prompt.md` output captured in the latest `activeDevelopment.md` entry for task sequencing and risks.

## Preconditions
- Confirm the plan stage exit criteria are met and documented in `specs/context/activeDevelopment.md`.
- Ensure there are no unresolved planning blockers assigned to the design stage.

## Actions
1. Translate planned tasks and acceptance criteria into architectural views, following the guidance in `specs/architect/architect.md` and `specs/architect/c4Design.md`.
2. Update `specs/context/systemDesign.md` with the required C4 layers, technology decisions, and observability strategies; do not remove existing historical context.
3. Log design decisions, open questions, and implementation guidance in `specs/context/activeDevelopment.md`, referencing the relevant sections of `specs/context/systemDesign.md`.
4. Highlight any requirement or constraint conflicts back to the orchestrator via `specs/context/activeDevelopment.md` if alignment with `specs/context/projectContext.md` cannot be achieved.

## Exit Criteria
- `specs/context/systemDesign.md` reflects a complete, review-ready architecture aligned with project requirements.
- `specs/context/activeDevelopment.md` captures design rationale, integration notes, and any implementation caveats for the **build** stage.
- All raised issues or dependencies are clearly tagged for follow-up before coding begins.
