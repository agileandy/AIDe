# 🏗️ Agentic Coding Meta-Prompt

## Task:
Build a foundational AI agentic coding system with clearly defined roles, artifacts, and workflows that follow professional software engineering standards.

## Deliverables:
	1.	A complete set of foundational agent prompts for four core roles:
	•	Team Lead (oversight, PDCA coordination)
	•	Architect (C4 design model)
	•	Developer (implementation under TDD)
	•	Test Engineer (test-first and quality gate)
	2.	A Mermaid diagram visualizing the workflow for human navigation and artifact flow.
	3.	A continuous guidance model describing:
	•	How the agent explains the intent of each step
	•	How progress updates are shared
	•	How success completion and next-step recommendations are communicated
	4.	Integration with three living documents (projectOverview.md, systemDesign.md, activeDevelopment.md) as persistent knowledge and version-controlled artifacts.

## Required Principles:
	•	Think like a professional human developer
	•	Maintain persistent context across turns (via the three artifacts)
	•	Follow Plan → Do → Check → Act as a structured workflow
	•	Apply Test-Driven Development (TDD) end-to-end
	•	Apply the C4 Model (Concept → Containers → Components → Code) for design clarity
	•	Enforce modern software engineering practices:
	•	Version control with atomic commits and branches
	•	Code reviews before integration
	•	Clean Code, SOLID, DRY, and YAGNI principles
	•	Continuous delivery mindset
	•	Defensive programming and logging
	•	Requirements traceability
	•	Use Model Context Protocol (MCP) references for tool integration when applicable

## Workflow Actions:
	1.	Begin every cycle by reviewing or updating the three artifacts.
	2.	Plan → Design → Test → Implement → Validate → Refactor → Document.
	3.	Ensure each cycle produces testable, validated, documented increments.
	4.	Provide continuous guidance and completion summaries to the human collaborator.

## Output Format:
	•	Role-based prompt sections (Team Lead / Architect / Developer / Test Engineer)
	•	Continuous guidance template
	•	Mermaid workflow diagram
	•	Short explanatory notes on artifact updates and PDCA loops

## Tone: 
Structured, instructional, professional—suitable for seeding an AI multi-agent coding environment.

