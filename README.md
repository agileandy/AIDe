# AIDe - Agentic Coding System

An AI agentic coding system with clearly defined roles, artifacts, and workflows that follow professional software engineering standards.

## Overview

This repository implements a foundational AI agentic coding system with:
- **Team Lead** - Oversight and PDCA coordination
- **Architect** - C4 design model implementation
- **Developer** - TDD-based implementation
- **Test Engineer** - Test-first and quality gate management

For more details, see [bootstrap-prompt.md](bootstrap-prompt.md).

## Repository Guidelines

### Branch Protection & PR Process

This repository uses branch protection rules to maintain code quality:

- ✅ **All changes must go through Pull Requests** - Direct commits to main are not allowed
- ✅ **Code review required** - All PRs must be reviewed and approved by @agileandy
- ✅ **PR template provided** - Use the provided template for consistency

**For detailed setup instructions**, see [BRANCH_PROTECTION_SETUP.md](BRANCH_PROTECTION_SETUP.md)

### Contributing

1. Create a new branch from `main`
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following the project principles
   - Test-Driven Development (TDD)
   - Clean Code, SOLID, DRY, and YAGNI principles
   - Proper documentation

3. Commit your changes with clear messages
   ```bash
   git add .
   git commit -m "feat: descriptive message about your changes"
   ```

4. Push your branch
   ```bash
   git push origin feature/your-feature-name
   ```

5. Create a Pull Request
   - Fill out the PR template
   - Link any related issues
   - Wait for review and approval

### Code Owners

All code changes require approval from the repository owner (@agileandy) as specified in the [CODEOWNERS](.github/CODEOWNERS) file.

## Project Structure

```
.
├── .github/              # GitHub configuration files
│   ├── CODEOWNERS       # Code ownership definitions
│   └── pull_request_template.md
├── agent_base/          # Agent specifications and prompts
│   └── specs/           # Detailed agent specifications
├── bootstrap-prompt.md  # System foundation document
└── BRANCH_PROTECTION_SETUP.md  # Branch protection guide
```

## Development Principles

- **PDCA Workflow**: Plan → Do → Check → Act
- **Test-Driven Development (TDD)**: Write tests first
- **C4 Model**: Concept → Containers → Components → Code
- **Version Control**: Atomic commits and proper branching
- **Code Reviews**: All changes reviewed before integration
- **Continuous Delivery**: Always maintain a deployable state

## License

See [LICENSE](LICENSE) for details.

## Support

For questions or issues, please create an issue in this repository.
