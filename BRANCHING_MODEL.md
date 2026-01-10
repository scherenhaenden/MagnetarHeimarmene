# Branching Model of MagnetarHeimarmene

This project follows a simplified GitFlow.

## Branches

*   **`master`:** The stable release branch. Pushing to this branch triggers the release workflow, which builds and uploads the `.plasmoid` artifact.
*   **`feature/<name>`:** New features.
*   **`fix/<name>`:** Bug fixes.
*   **`chore/<name>`:** Maintenance tasks.

## Workflow

1.  Create a branch from `master`.
2.  Implement changes.
3.  Update `BITACORA.md`.
4.  Open a Pull Request.
5.  Merge after review.
