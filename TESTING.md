# Testing Strategy for MagnetarHeimarmene

## 1. Types of Tests

*   **Unit Tests (`tst_Singularity.qml`):** Verify the logic in `HeimarmeneEngine.js` and `AtmosphereEngine.js`.
    *   Test date parsing.
    *   Test conflict detection algorithms.
    *   Test weather data normalization.
*   **Visual Verification (Manual):** verify the QML rendering in `plasmoidviewer`.

## 2. Code Coverage
*   **Target:** 80% coverage for "Singularity" JS modules.

## 3. Bug Reporting Process
1.  Verify the bug in the latest `master`.
2.  Create a `task` or `blocker` (if critical) in `projects/*.project.yml`.
3.  Log it in `BLOCKERS.md` if it halts progress.
