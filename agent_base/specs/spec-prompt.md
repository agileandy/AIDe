<Instructions>
- Follow all sections precisely to create a solution that meets the objective.
- The Cascading Rulebook defines precedence and conflict resolution. Always apply it when sources disagree.
- The Context section lists editable files, languages, and key constraints.
- The Tasks section enumerates activities. Keep traceability to Context and Objective.
- Any custom instructions are defined in Blocks.
</Instructions>

<Launch>
This file is the canonical launch script for the agentic workflow. Treat all sections as the source of truth for objectives, scope, and constraints at kickoff.

Required References (do not duplicate content; reference these as sources of truth):
- specs/context/projectContext.md (project vision, goals, scope, rationale)
- specs/context/systemDesign.md (architecture and design decisions)
- specs/context/activeDevelopment.md (delivery log, progress, decisions)
- specs/orchestrator/orchestrator.md and specs/orchestrator/workflow.md (governance, sequencing, quality gates)
- specs/architect/architect.md, specs/coder/coder.md, specs/tester/tester.md (role responsibilities)
</Launch>

<Cascading Rulebook>
Order of precedence (highest wins on conflicts):
1. This spec (objectives, tasks, explicit constraints)
2. specs/context/projectContext.md (requirements and rationale)
3. specs/orchestrator/orchestrator.md and specs/orchestrator/workflow.md (governance and sequencing)
4. specs/context/systemDesign.md (architecture and technical decisions)
5. Role guides: specs/architect/architect.md, specs/coder/coder.md, specs/tester/tester.md
6. Stage prompts: specs/ideate-prompt.md, specs/plan-prompt.md, specs/design-prompt.md, specs/build-prompt.md
7. Miscellaneous materials

Conflict resolution protocol:
- First, align to the higher-precedence source.
- Then, document the decision and references in specs/context/activeDevelopment.md.
- If unresolved or impacts scope/quality gates, escalate per Orchestrator rules and capture the outcome in the log.

Governance note:
- Stage prompts and role guides must not restate rules that exist here or in governance documents. They should reference the canonical sources above.
</Cascading Rulebook>

<Name>

</Name>

<Objective>

</Objective>

<Context>
- Editable files:
- Programming language(s):
- Non-functional constraints:
- Integrations and external systems:
</Context>

<Stakeholders>
- Primary stakeholders:
- Reviewers / approvers:
</Stakeholders>

<SuccessMetrics>
- Quantitative metrics:
- Qualitative outcomes:
</SuccessMetrics>

<AcceptanceCriteriaSummary>
- High-level criteria (full details live in specs/context/projectContext.md):
</AcceptanceCriteriaSummary>

<Tasks>
1. Task 1:
2. Task 2:
3. Task 3:
4. Task 4:
*(End of tasks)*
</Tasks>

<Blocks>
**technical constraints**:
- MUST Use Python 3.12.8
- MUST Use UV as a package manager. UV is already installed, and a virtual env is already created.
- Use `uv pip install {package}` NOT `pip install {package}`.
- Always activate the virtual environment when running scripts.
- Use pytest for testing.
- Use local git as a code management tool. Setup and respect .gitignore suitable for the project.

**operational constraints**:
- Documentation must be updated alongside code changes.
- All changes require traceability to tasks and acceptance criteria.

Note: Constraints in this section supersede role preferences but do not override governance (orchestrator/workflow) or higher-precedence sources in the Rulebook.
</Blocks>
