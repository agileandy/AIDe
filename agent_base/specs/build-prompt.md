# Build Stage Prompt

Note: This stage defers to the Cascading Rulebook in specs/spec-prompt.md for precedence and conflict resolution. Do not restate rules—reference canonical sources.

You lead the final step of the **ideate → plan → design → build** workflow. Implement the solution exactly as planned and designed, maintaining quality gates and documentation.

## Required References
- `specs/coder/coder.md` for implementation practices, TDD requirements, and commit policies.
- `specs/tester/tester.md` for test coverage expectations and validation sequencing.
- `specs/context/systemDesign.md` for architectural guidance you must follow.
- `specs/context/projectContext.md` and `specs/context/activeDevelopment.md` for requirements, acceptance criteria, and task state.
- `specs/orchestrator/workflow.md` for mandatory quality gates during development and handoff.

## Preconditions
- Verify the design stage exit criteria are met and recorded in `specs/context/activeDevelopment.md`.
- Confirm dependencies, environment details, and test plans are available or request them before coding.

## Actions
1. Execute tasks in the order defined during planning, adhering to `specs/coder/coder.md` for TDD, commit discipline, and escalation protocols.
2. Collaborate with guidance in `specs/tester/tester.md` to ensure tests exist for each acceptance criterion before implementation.
3. Update `specs/context/activeDevelopment.md` with progress logs, test results, and any deviations from the design, referencing specific sections of `specs/context/systemDesign.md` when decisions differ.
4. Raise misalignments or blockers through `specs/context/activeDevelopment.md`, tagging the orchestrator when workflow escalations in `specs/orchestrator/workflow.md` apply.

## Exit Criteria
- All planned tasks are implemented with passing tests that satisfy `specs/tester/tester.md` expectations.
- `specs/context/activeDevelopment.md` documents implementation outcomes, code review status, and deployment readiness.
- Any residual issues or follow-up actions are clearly logged for post-build review.
