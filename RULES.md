# Canonical Ruleset of MagnetarHeimarmene

> **Authority:** This document codifies the **Magnetar Canonical Project Model**. The entire project and its contributors must comply with these rules. Any deviation requires a formal exception documented in `BITACORA.md`.

## 1. Naming Conventions

Strict adherence to these naming conventions is required for automation and consistency.

*   **Repositories:** `magnetar-<domain>-<descriptor>` (e.g., `magnetar-plasma-heimarmene`).
*   **Branches:** `<type>/<short-description>`.
    *   Types: `feature`, `fix`, `chore`, `experiment`, `hotfix`.
    *   Example: `feature/google-calendar-auth`, `fix/weather-parsing`.
*   **Tasks and Blockers:** `kebab-case`.
    *   Tasks: `task-<number>` (e.g., `task-101`).
    *   Blockers: `blocker-<descriptor>` (e.g., `blocker-api-limit`).
*   **YAML Keys:** `lower_snake_case`.
*   **File Names:** Must mirror those in the canonical repository structure (e.g., `HeimarmeneEngine.js`).

## 2. Required Files

The following files **must** be present in the project root. Omission requires an explicit exemption logged in `BITACORA.md`.

*   `README.md`
*   `PLAN.md`
*   `BITACORA.md`
*   `REQUIREMENTS.md`
*   `ARCHITECTURE.md`
*   `RULES.md` (This file)
*   `STATUS.md`
*   `TESTING.md`
*   `BLOCKERS.md`
*   `BRANCHING_MODEL.md`
*   `WIP_GUIDELINES.md`
*   `CONTRIBUTING.md`
*   `projects/*.project.yml`

## 3. Branching Conventions

*   **`master`:** Immutable release line. Merges require successful CI and documentation updates.
*   **`develop`** (Optional): Aggregates completed features before stabilization.
*   **`feature/*`:** Originate from `master` (or `develop`). Must be rebased before merging.
*   **`hotfix/*`:** Start from `master`. Completion triggers a `STATUS.md` update.
*   **Pull Requests:** Must reference the `task-ID` they affect and include `BITACORA.md` entries.

## 4. Allowed Task States

Tasks in `PLAN.md` and the project YAML must be in one of these states:

1.  `planned`: Defined but not yet ready for work.
2.  `ready`: Fully defined and ready to be picked up.
3.  `in_progress`: Work has started.
4.  `in_review`: Work is finished and pending review.
5.  `blocked`: Progress is halted by an external factor.
6.  `done`: Work is complete and verified.

**Transitions:**
*   `planned` → `ready`
*   `ready` → `in_progress`
*   `in_progress` → `in_review`
*   `in_review` → `done` (or back to `in_progress` if changes needed)
*   Any state ↔ `blocked`

## 5. Work-In-Progress (WIP) Constraints

*   **WIP Limit:** Maximum **2** tasks in `in_progress` per individual/agent.
*   **Exceptions:** Must be approved and documented in `WIP_GUIDELINES.md` and `BITACORA.md`.

## 6. Blocker Lifecycle

1.  **Discovery:** Log in `BLOCKERS.md` with ID, description, severity, owner, and timestamp.
2.  **Assessment:** Update risks in `STATUS.md`; note mitigation ideas in `BITACORA.md`.
3.  **Escalation:** If not resolved within **1 business day**, escalate per policy.
4.  **Resolution:** Document solution in `BITACORA.md` and set status to `resolved`.
5.  **Retrospective:** Capture lessons learned.

## 7. Documentation Discipline

*   **`BITACORA.md`:** The **Single Source of Truth** for history. Must record every state change, decision, and exception chronologically.
*   **`STATUS.md`:** Update at least once per day or after each PR merge.
*   **`PLAN.md`:** The **Single Source of Truth** for planning.

## 8. AI Agent Responsibilities

*   **Parse:** Read `projects/*.project.yml` before acting.
*   **Verify:** Do not open PRs without confirming the task state is `in_review`.
*   **Log:** Document assumptions in `BITACORA.md` when uncertain.

## 9. Compliance

*   CI pipelines should validate the presence and structure of required files.
*   Periodic audits will be conducted to ensure Magnetar compliance.
