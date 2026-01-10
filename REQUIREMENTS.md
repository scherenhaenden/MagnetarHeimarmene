# Requirements for MagnetarHeimarmene

## 1. Functional Requirements

### 1.1 Google Calendar Integration (The "Heimarmene" Protocol)
*   **Must-Have:** Leverage native **KDE Online Accounts** infrastructure.
*   **Must-Have:** Connect to `Akonadi Server` via `org.kde.plasma.PimCalendars`.
*   **Must-Have:** Display events from "Personal Calendar" and "Work Calendar" (dynamically populated).
*   **Must-Have:** No direct connection to Google Servers from the widget (use System Daemon).

### 1.2 Weather & Warnings (The "Atmosphere" Layer)
*   **Must-Have:** Use `org.kde.weather` DataEngine or Plasma 6 Weather providers.
*   **Must-Have:** Parse "Warnings" strings (e.g., DWD/NOAA).
*   **Should-Have:** Visual "Gravity" changes for warnings (pulsing borders).
*   **Must-Have:** Overlay weather data onto the event timeline (e.g., rain icon on an event at 3 PM).

## 2. Non-Functional Requirements

### 2.1 System Requirements (V1.0)
*   **Host OS:** KDE Plasma 6 (Qt 6.6+).
*   **Dependencies:**
    *   `kdepim-runtime`: To process Google Calendar streams.
    *   `kaccounts-integration`: To handle Google authentication.
*   **User Setup:** User must be signed in to Google via *System Settings -> Online Accounts*.

### 2.2 Performance
*   **Must-Have:** "Singularity" logic (JS) must not block the "Event Horizon" (UI/Main Thread) significantly.
*   **Must-Have:** Efficient data updates (do not re-parse everything on every second).

### 2.3 Visuals
*   **Must-Have:** Follow the "Magnetar" visual theme (Translucency, Blur, Circular motifs).
