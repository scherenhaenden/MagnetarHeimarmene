# Canonical Plan of MagnetarHeimarmene

> **Authority:** This document captures the project's milestones, tasks, estimates, and status. Its structure must be kept intact. Updates here must be reflected in `projects/magnetar_heimarmene.project.yml` and `BITACORA.md`.

## 1. Milestones Overview

| Milestone ID | Name | Target Date | Description | Completion Criteria |
| :--- | :--- | :--- | :--- | :--- |
| `ms-01` | Phase A: The Skeleton | 2024-05-22 | Initialize project structure and basic QML rendering. | `metadata.json` created, `main.qml` loads with status indicator. |
| `ms-02` | Phase B: The Connection | TBD | Implement Google Calendar integration via KDE Online Accounts. | Display a list of event titles from the configured Google account. |
| `ms-03` | Phase C: The Atmosphere | TBD | Connect to Weather DataEngine and overlay data. | Temperature integers displayed on the Event List. |
| `ms-04` | Phase D: The Unification | TBD | Apply Magnetar visual theme and unify logic. | Visual theme applied, "Rain Umbrella" logic implemented. |

## 2. Task Backlog

| Task ID | Milestone | Title | Owner | Effort (pts) | State | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `task-101` | `ms-01` | Initialize `metadata.json` | Jules | 1 | `done` | Plasma 6 specifications. |
| `task-102` | `ms-01` | Create `main.qml` skeleton | Jules | 2 | `done` | Simple Red/Green status indicator. |
| `task-201` | `ms-02` | Implement `CalendarModel` | Unassigned | 5 | `planned` | Use `org.kde.plasma.calendar`. |
| `task-202` | `ms-02` | Display Event Titles | Unassigned | 3 | `planned` | List events from Google account. |
| `task-301` | `ms-03` | Connect Weather DataEngine | Unassigned | 3 | `planned` | `org.kde.weather` or Plasma 6 provider. |
| `task-302` | `ms-03` | Overlay Temperature | Unassigned | 2 | `planned` | |
| `task-401` | `ms-04` | Apply Magnetar Theme | Unassigned | 5 | `planned` | Translucency, Blur, Circular motifs. |
| `task-402` | `ms-04` | Implement Event-Weather Logic | Unassigned | 5 | `planned` | Event time == Rain time -> Umbrella Icon. |

## 3. Effort Summary

*   **Total effort:** 26 pts
*   **Completed:** 3 pts
*   **In progress:** 0 pts
*   **Remaining:** 23 pts

## 4. State Definitions

*   `planned`: Defined but not yet ready for work.
*   `ready`: Fully defined and ready to be picked up.
*   `in_progress`: Work has started.
*   `in_review`: Work is finished and pending review.
*   `blocked`: Progress is halted by an external factor.
*   `done`: Work is complete and verified.

## 5. Change Management

This document must be updated whenever tasks change state or scope. Changes must be reflected in the project's YAML file and in `BITACORA.md`.
