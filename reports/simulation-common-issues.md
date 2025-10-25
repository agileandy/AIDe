# Simulation Review: Common Issues and Prompt Mitigations

## Reviewed Simulations
The orchestrated workflow simulation covered the full DAC sequence (Ideate → Plan → Design → Build/Test), with each agent role executing its prompt while deliberate hallucinations and common delivery risks were injected. Each stage produced similar friction points:

- **Ideation Stage Simulation** – Encountered ambiguous success metrics and a hallucinated WebAssembly dependency that required orchestrator intervention.
- **Planning Stage Simulation** – Faced invented tooling requirements ("Telemetry SDK v9") and dependency validation gaps, causing tester rejection and rework.
- **Design Stage Simulation** – Highlighted unverified claims about existing architecture components (event bus) and the need for traceable design decisions.
- **Build/Test Stage Simulation** – Surfaced premature success claims (integration tests "already passing") and difficulty enforcing evidence-based reporting.

## Common Cross-Simulation Issues
| Category | Recurring Symptoms | Impact |
| --- | --- | --- |
| **Ambiguity Escalation Drag** | Multi-turn clarifications to nail down objectives and success metrics. | Slows progression from Ideate to Plan; introduces repeated context syncing. |
| **Documentation Overhead Drift** | Frequent edits across `projectContext.md`, `systemDesign.md`, and `activeDevelopment.md` without automation. | Increases bookkeeping load and risk of inconsistent records. |
| **Hallucination Detection Latency** | Agents assert prior work or dependencies without evidence. | Forces manual policing by orchestrator/tester; potential for incorrect downstream decisions. |
| **Sequential Bottlenecks** | Tester and architect idle while waiting for stage approval. | Missed opportunity to prepare deliverables in parallel, elongating cycle time. |
| **Unbounded Conflict Resolution** | No timeboxes when disputes or hallucinations arise, leading to stalled progress. | Workflow can deadlock without explicit escalation deadlines. |

## Prompt-Level Mitigation Suggestions
Below are concrete prompt updates that target the shared issues. Each suggestion references the file and includes draft wording ready to insert.

### Orchestrator Prompt (`specs/orchestrate-prompt.md`)
- **Add Evidence Requirement:**
  > "When any role references prior work, repository state, or external dependencies, require a direct citation (file path + line or PR reference). Reject the claim if the citation is missing or unverifiable."
- **Introduce Resolution Timebox:**
  > "If a blocker persists for more than two clarification rounds, enforce a 10-minute (or single-agent-cycle) timebox to either resolve, escalate to the human, or roll back to the previous stage. Document the decision in `activeDevelopment.md`."

### Ideation Prompt (`specs/ideate-prompt.md`)
- **Clarify Success Metrics Checklist:**
  > "Before completing Ideation, present the success metrics back to the human in structured bullet form and obtain explicit confirmation (yes/no). Halt progression until confirmation is received."
- **Hallucination Guard Clause:**
  > "Forbid proposing solutions that reference technologies not present in the current project context unless corroborated with a citation from project artifacts."

### Planning Prompt (`specs/plan-prompt.md`)
- **Dependency Validation Step:**
  > "For every dependency introduced, include a 'Verification Source' field that links to requirements, design notes, or repo files. Reject tasks lacking verification and loop back to Ideation/Orchestrator if justification cannot be provided."
- **Tester Collaboration Hook:**
  > "Invite the tester to draft acceptance criteria concurrently. Provide them with a 'Pending Review' state that becomes active once Orchestrator grants stage approval, enabling pre-work without breaking the gating rules."

### Design Prompt (`specs/design-prompt.md`)
- **Repository Reality Check:**
  > "Before referencing existing components, run a quick repository scan (e.g., file search) and paste the findings (paths matched or 'none found') into the design log. Proceed only with verifiable components."
- **Traceability Template:**
  > "Document architectural decisions using an ADR-style snippet (Context → Decision → Consequences) and cross-link to planning tasks to maintain traceability."

### Build Prompt (`specs/build-prompt.md`) and Tester Prompt (`specs/tester`)
- **Evidence-Based Test Reporting:**
  > "Every time the coder/tester reports a test result, include the command executed and a brief output snippet (or reference to stored logs). Orchestrator must reject status updates lacking this evidence."
- **Parallel Preparation Guidance:**
  > "Allow the tester to outline automation scaffolding while the coder is still implementing, provided all scripts are marked 'Draft' and not executed until Design exit criteria are formally met."

## Additional Improvement Opportunities
- **Centralized Logging Utility:** Develop a script or template that auto-updates the three main documentation files to minimize drift.
- **Prompt Snippets Library:** Maintain a shared library of citation and evidence macros that each role can reuse to reduce prompt length while standardizing expectations.

Incorporating these targeted adjustments should mitigate the recurring issues observed across the simulations by tightening evidence requirements, enabling controlled parallelism, and keeping conflict resolution bounded.
