# AIDe - AI Development Framework

> **Note**: If you're here to clean up old branches, see [BRANCH_CLEANUP.md](BRANCH_CLEANUP.md) for instructions.

# Quick Start

## Orchestrated Workflow (Recommended)

**Start with the master orchestration prompt for complete workflow governance:**

1) **Fill the spec-prompt.md**
   - Edit `spec-prompt.md` (in project root) with as much information as possible
   - The AI agent will help complete missing sections

2) **Launch the orchestrated workflow**
   - Open `agent_base/specs/orchestrate-prompt.md` and run it with your agent
   - The orchestrator will guide you through all four stages: ideate → plan → design → build
   - It verifies exit criteria at each stage transition to prevent skipped steps

3) **Follow the intent-based approach**
   - The agent will declare its role and intent at each stage
   - You'll see clear communication about what's happening and why
   - Example: "I am the Architect Agent and my next intent is to create a C4 diagram"

## Manual Stage-by-Stage (Alternative)

If you prefer to run stages individually:

1) **Start ideation**
   - Open `agent_base/specs/ideate-prompt.md` and run it with your agent
   - Agent declares: "I am the Ideation Agent"
   - Complete requirements gathering

2) **Proceed through the workflow**
   - Plan: `agent_base/specs/plan-prompt.md` (Agent: "I am the Planning Agent")
   - Design: `agent_base/specs/design-prompt.md` (Agent: "I am the Architect Agent")
   - Build: `agent_base/specs/build-prompt.md` (Agent: "I am the Coder Agent")

## Intent-Based Communication

All agents in this framework use an intent-based approach:

- **Role Declaration**: Each agent identifies itself at the start
- **Intent Statements**: Before actions, agents state their specific intent
- **Example**: "I am the Architect Agent and my next intent is to create a C4 Container-level diagram in systemDesign.md"

This provides transparency and helps ensure stages aren't skipped or quality gates bypassed.

## Workflow Architecture

```
orchestrate-prompt.md (Master Controller)
    ├── ideate-prompt.md → Verify Exit Criteria
    ├── plan-prompt.md → Verify Exit Criteria
    ├── design-prompt.md → Verify Exit Criteria
    └── build-prompt.md → Verify Exit Criteria
```

Each stage must satisfy exit criteria before the next stage begins.

## Notes
- The orchestrator uses `spec-prompt.md` (in project root) as the launch script and follows its Cascading Rulebook for precedence and conflict resolution
- Decision and progress logging is handled by the AI workflow as defined in `spec-prompt.md` and governance documents
- If guidance appears to conflict, the agent follows the Cascading Rulebook in `spec-prompt.md`
- The orchestrator prevents common issues like skipped design stages or missing test steps
