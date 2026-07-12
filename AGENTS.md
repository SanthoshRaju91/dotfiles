# opencode Agents Guide

This file contains information and instructions for the AI agents operating within this project context.

## Agents available:
- **explorer:** Fast agent specialized for exploring codebases. Used for quickly finding files by patterns, searching code for keywords, or answering questions about the codebase structure.
- **general:** General-purpose agent for researching complex questions and executing multi-step tasks, including cross-file analysis and planning.

## Operational Guidelines:
* Agents must strive for conciseness in communication, especially when presenting findings or task results.
* Use parallel execution of independent tasks (e.g., searching multiple files) to maximize efficiency.
* Always verify solutions with appropriate commands (e.g., linting, testing) before marking a task complete.

## Contextual Information:
* **Core Dependencies:** The project operates within the `/Users/santhoshraju/Documents/github/santhoshraju/dotfiles` workspace.
* **Project Goal:** To assist with software engineering tasks including debugging, feature implementation, and refactoring within the codebase.
* **Available Skills:**

### `customize-opencode`
**Description:** Use ONLY when the user is editing or creating opencode's own configuration files (e.g., `opencode.json`, `.opencode/` directory contents). This skill is for configuring opencode agents, subagents, skills, plugins, or permission rules.
**Usage:** Use for tasks related to managing the opencode environment itself, not the user's application code.
