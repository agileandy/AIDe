<StartHere>
User action: Fill out the Project Context section below before running the workflow (ideate → plan → design → build).
Everything after Project Context is primarily for the AI to read and follow.
</StartHere>

<ProjectContext>
# You fill this section first

<Name>
Hint: Short, descriptive project title (e.g., "Customer Support Triage Bot").

</Name>

<Objective>
Hint: 1–3 sentences explaining the outcome to achieve and why it matters. Include the core user value and any non-goals.

</Objective>

<Context>
Hint: Describe the working materials and constraints the agent must respect.
- Editable files: List files/folders the agent is allowed to modify (e.g., src/, tests/, pyproject.toml).
- Programming language(s): Primary languages and versions (e.g., Python 3.12, TypeScript 5).
- Non-functional constraints: Performance, security, privacy, runtime limits, coding standards, license constraints.
- Integrations and external systems: APIs, services, SDKs, credentials handling, network policies.
</Context>


<SuccessMetrics>
Hint: How we’ll know this worked.
- Quantitative metrics: Concrete targets (e.g.,
  - ">=95%" test pass rate,
  - "<200ms" p95 latency,
  - "-20%" manual triage time).
- Qualitative outcomes: Developer/UX experience goals (e.g., easier onboarding, clearer logs).
</SuccessMetrics>

<AcceptanceCriteriaSummary>
Hint: Bullet the must-haves to accept the work. Keep it short; full detail should live in specs/context/projectContext.md.
- Example: "CLI accepts --input and --output flags and validates paths."
- Example: "Errors are logged with correlation IDs."
</AcceptanceCriteriaSummary>

<Tasks>
Hint: Break work into clear, verifiable steps. Prefer small, testable increments. Reference acceptance criteria where relevant.
1. Task 1: What to build/do and why (DoD: unit tests passing; docs updated)
2. Task 2: ...
3. Task 3: ...
4. Task 4: ...
*(End of tasks)*
</Tasks>
</ProjectContext>

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

<Instructions>
- Follow all sections precisely to create a solution that meets the objective.
- The Cascading Rulebook defines precedence and conflict resolution. Always apply it when sources disagree.
- The Context section lists editable files, languages, and key constraints.
- The Tasks section enumerates activities. Keep traceability to Context and Objective.
- Any custom instructions are defined in Blocks.
</Instructions>

<CommunicationTemplate>
All agents in this workflow MUST use the following concise message structure for every outbound message and handoff.

- I am **<role>** operating in **<workflow phase>** phase
- My next intent is to **<intent statement>**
- ---
- **Summary** : Summarise the key output from the model (max n chars)
- ---
- **Human Actions** : <what if any action is needed by the human>
- ---
- **Next** : What action will be next once the human has confirmed. This might be another action for this agent or an action on another agent, in which case report `<next role>` in `<phase>` will `<intent>`

This template overrides any per-role communication verbosity. Agents must not include additional freeform commentary outside the template.
</CommunicationTemplate>
