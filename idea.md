Here is a detailed breakdown of the concept, features, and technical considerations, which would be perfect for guiding an AI coding assistant.
Tool Concept: CVE-Watch
A command-line utility that scans a software project's dependencies, checks them against a public vulnerability database (like the GitHub Advisory Database or NVD), and reports any known security vulnerabilities, offering automated fix suggestions where possible.
Core Logic / How It Works
The fundamental insight for the agent to understand is that source code files themselves don't have CVEs; the third-party packages they depend on do. Therefore, the core logic is:
Dependency Discovery: Scan the target directory for known dependency manifest and lock files. This is the most critical step.
JavaScript: package-lock.json, yarn.lock, pnpm-lock.yaml
Python: requirements.txt, poetry.lock, Pipfile.lock
Ruby: Gemfile.lock
Java: pom.xml, build.gradle
Go: go.sum
Rust: Cargo.lock
Dependency Parsing: Parse these files to extract a precise list of all installed packages and their exact versions (e.g., lodash@4.17.20). This is a structured data extraction problem.
Vulnerability Database Query: For each dependency, query a vulnerability database API. A good choice would be the GitHub Advisory Database API or the OSV (Open Source Vulnerability) database API, as they are free and comprehensive. The query would be: "Are there any known vulnerabilities for package X at version Y?"
Reporting & Suggestion: If the API returns any vulnerabilities for a given package version, format the information into a clear, human-readable report. The "suggested fix" is almost always provided by the vulnerability database (e.g., "Upgrade to version Z").
Detailed Feature Breakdown
CLI Commands & Flags
The tool would be invoked with cve-watch <command> [options].
cve-watch scan <path>: The primary command for a one-time scan.
cve-watch monitor <path>: The command to run the tool in a persistent watch mode.
Flags:
--severity [low|medium|high|critical]: Only report vulnerabilities of a certain severity level or higher. (e.g., --severity high).
--json: Output the report in JSON format for integration with other tools.
--fix: (Advanced) Attempt to automatically run the package manager command to upgrade the vulnerable packages. This is a high-impact feature.
1. scan Mode
Behavior:
Recursively searches the specified <path> for all supported dependency files.
Parses all found files to create a master list of unique dependencies.
Queries the vulnerability database for each dependency.
Prints a formatted report to the console.
Exits with a non-zero status code if vulnerabilities are found (essential for CI/CD pipelines).
Use Case: Ideal for running in a continuous integration (CI) script, a pre-commit hook, or for a one-off audit of a project.
2. monitor Mode
Behavior:
Performs an initial scan just like the scan command.
After the initial scan, it sets up a file system watcher.
Crucially, it only watches the specific dependency files it discovered (e.g., package-lock.json), not the entire codebase.
When one of these files is saved (e.g., after an npm install), it automatically triggers a re-scan of that specific file's dependencies.
It then prints a new report only if new vulnerabilities are found or if existing ones are resolved.
Use Case: Perfect for a developer to run in a background terminal window while they are actively working on a project, providing immediate feedback if they add a risky dependency.
Output Format
A clear, color-coded console output is key for usability.
code
Code
Scanning /Users/dev/my-react-app...
Found 2 vulnerabilities in package-lock.json

[HIGH] axios@0.21.1
  Severity: High (CVSS 7.5)
  Vulnerability: CVE-2021-3749 - Improper Input Validation
  Description: A vulnerability in the `is-buffer` dependency of axios allows...
  Patched in: >=0.21.2
  Suggested Fix: npm install axios@0.21.2

[CRITICAL] express@4.17.1
  Severity: Critical (CVSS 9.8)
  Vulnerability: CVE-2022-24999 - Regular Expression Denial of Service
  Description: The `qs` library used by Express is vulnerable to...
  Patched in: >=4.17.3
  Suggested Fix: npm install express@4.17.3

Scan complete. 2 vulnerabilities found.
Technical Implementation Details for the AI Agent
Language Choice: Python or Go are excellent choices.
Python: Great libraries for file watching (watchdog), API requests (requests), CLI creation (argparse, click), and colored output (rich).
Go: Excellent for building fast, self-contained binaries. Strong concurrency features could be useful for querying the API.
Key Dependencies/Libraries to Use:
CLI Parsing: argparse (Python), cobra (Go).
File System Watching: watchdog (Python), fsnotify (Go).
HTTP Requests: requests (Python), standard net/http (Go).
Dependency File Parsers: This is the main challenge. For some lockfiles (package-lock.json), a simple JSON parser is enough. For others (yarn.lock, poetry.lock), a custom parser or an existing library would be needed. This is a great sub-task for the agent.
Rich Console Output: rich (Python).
Workflow to Guide the AI Agent
Step 1: Bootstrap the CLI. Create the basic command structure for scan and monitor using a library like click.
Step 2: Implement Discovery. Write the logic to find all files named package-lock.json (start with one type) in a given directory.
Step 3: Implement the Parser. Write the code to parse a package-lock.json file and extract a list of name: version pairs.
Step 4: Implement the API Client. Write a function that takes a package name and version, calls the OSV or GitHub API, and returns any vulnerability data.
Step 5: Build the scan Command. Integrate the discovery, parsing, and API client. Format the results and print them to the console.
Step 6: Build the monitor Command. Use the watchdog library to monitor the found files and call the scan logic whenever a file is modified.
Step 7: Add Features. Implement severity filtering and JSON output.
Step 8 (Advanced): Add support for another lockfile type, like requirements.txt. This will force the agent to design a more extensible parsing system.