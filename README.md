# Canonical Project Model of MagnetarHeimarmene

> **Status:** Pre-Alpha / Definition Phase
> **Core Directive:** Unified Chronological & Atmospheric Awareness
> **Governance:** Magnetar Canonical Project Model

## 1. Purpose

**MagnetarHeimarmene** is a high-density information singularity for the KDE Plasma 6 Desktop. It unifies disparate data streams—calendar events, astronomical data, weather patterns, and severe alerts—into a single, cohesive "Event Horizon" visualization.

This project strictly follows the **Magnetar Canonical Project Model** for documentation, planning, and governance, ensuring long-term stability and architectural integrity (separating the "Singularity" core logic from the "Event Horizon" view).

## 2. How to Use This Repository

To collaborate on this project, follow these steps:

1.  **Clone the Canonical Model:** Ensure you have the full repository structure.
2.  **Initialize Configuration:** Copy `projects/_template.project.yml` to `projects/magnetar_heimarmene.project.yml` and fill it out (if not already present).
3.  **Read the Documentation:** Familiarize yourself with the *Project Contents* below.
4.  **Follow the Rules:** Adhere to `RULES.md`, `WIP_GUIDELINES.md`, and `BRANCHING_MODEL.md`.
5.  **Check Progress:** Consult `PLAN.md` and `STATUS.md` before picking up tasks.
6.  **Log Your Actions:** Every state change must be recorded in `BITACORA.md`.

## 3. Project Contents

The following documentation files define the project:

| File | Purpose |
| :--- | :--- |
| `PLAN.md` | **Source of Truth** for milestones, tasks, and estimates. |
| `BITACORA.md` | Chronological **Logbook** of all events, decisions, and state changes. |
| `REQUIREMENTS.md` | Functional & non-functional specifications (Calendar, Weather, etc.). |
| `ARCHITECTURE.md` | System structure (Singularity vs Event Horizon), modules, and design decisions. |
| `RULES.md` | Naming conventions, task states, and workflow standards. |
| `STATUS.md` | Current health summary, risks, and progress statistics. |
| `TESTING.md` | Testing strategy, coverage targets, and reporting rules. |
| `BLOCKERS.md` | Registry of active blockers and their escalation paths. |
| `BRANCHING_MODEL.md` | Git workflow and branch naming rules. |
| `WIP_GUIDELINES.md` | Policies on Work-In-Progress limits. |

## 4. Progress Model Overview

This project tracks progress through defined states:
`planned` → `ready` → `in_progress` → `in_review` → `done`.

*   **Milestones:** Group related tasks (e.g., "Phase A: The Skeleton").
*   **Traceability:** Every state transition must be logged in `BITACORA.md`.
*   **Source of Truth:** The `projects/*.project.yml` file is the machine-readable source of truth for the project state.

## 5. YAML Project Schema

The `projects/magnetar_heimarmene.project.yml` file contains the canonical schema including:
*   **Metadata:** Project name, description, start date.
*   **Stakeholders:** Team members and roles.
*   **Milestones & Tasks:** Structured data driving `PLAN.md`.
*   **Risks:** Active risks and mitigations.

## 6. Guidance for AI Collaborators

If you are an AI agent working on this project:
1.  **Parse** the `projects/*.project.yml` file to understand the current state.
2.  **Consult** `PLAN.md` and `STATUS.md` to determine your focus.
3.  **Respect** `RULES.md`, `WIP_GUIDELINES.md`, and `BRANCHING_MODEL.md`.
4.  **Update** `BITACORA.md` after completing **any** work.

## 7. Applying This Template

1.  Copy the repository structure.
2.  Replace placeholder content with project-specific details.
3.  Instantiate and validate the project YAML file.
4.  Establish initial milestones and log the initial state in `PLAN.md`, `STATUS.md`, and `BITACORA.md`.

## 8. Validating Canon Compliance

*   [ ] All required files exist (see Section 3).
*   [ ] Project YAML matches the schema.
*   [ ] `BITACORA.md` is updated chronologically.
*   [ ] Active branches follow `BRANCHING_MODEL.md`.
*   [ ] Testing and blocker processes match their respective documents.
