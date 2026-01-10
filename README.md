# Magnetar Heimarmene

![Status](https://img.shields.io/badge/Status-Pre--Alpha-orange) ![Version](https://img.shields.io/badge/Version-0.2.0-blue) ![Plasma](https://img.shields.io/badge/Plasma-6-green) ![Build Status](https://github.com/scherenhaenden/MagnetarHeimarmene/actions/workflows/release.yml/badge.svg)

> **"Unified Event Horizon: Chronology, Atmosphere, and Warnings"**

Magnetar Heimarmene is a high-density information singularity for the KDE Plasma 6 Desktop. It redefines how you perceive your day by fusing disparate data streams—calendar events, astronomical data, weather patterns, and severe alerts—into a single, cohesive "Event Horizon" visualization.

## 🌟 The Vision

Imagine looking at your calendar and not just seeing "Meeting at 3 PM," but intuitively knowing "Meeting at 3 PM, dragging into a thunderstorm, under a waning moon."

Magnetar Heimarmene unifies:
*   **Chronology:** Your schedule from Google Calendar (via KDE Online Accounts).
*   **Atmosphere:** Real-time and forecasted weather conditions overlaying your timeline.
*   **Warnings:** Severe weather alerts that actively interact with your scheduled events (e.g., suggesting an umbrella for a specific commute).

## ✨ Features (Planned)

*   **The Singularity:** A robust core engine that processes time and weather data.
*   **Event Horizon:** A stunning, translucent QML interface following the Magnetar visual language.
*   **Smart Overlays:** Rain intensity, temperature gradients, and astronomical phases displayed directly on your event list.
*   **Conflict Resolution:** Intelligent warnings when weather conditions conflict with outdoor events.

## 🚀 Getting Started

### Prerequisites

*   **KDE Plasma 6**: This widget is built for the latest generation of the Plasma desktop.
*   **KDE Online Accounts**: Configured with your Google Calendar.
*   **Qt 6.6+**: The underlying framework.

### Installation

1.  Go to the [Releases](https://github.com/scherenhaenden/MagnetarHeimarmene/releases) page.
2.  Download the latest .plasmoid file (e.g., MagnetarHeimarmene-vX.Y.Z.plasmoid).
3.  Install it using the command line:
    ```bash
    kpackagetool6 --install MagnetarHeimarmene-vX.Y.Z.plasmoid
    ```
    *Or use the "Install from File..." option in Plasma Widget Explorer.*

### Development Setup

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/scherenhaenden/MagnetarHeimarmene.git
    cd MagnetarHeimarmene
    ```

2.  **View the Applet:**
    You can use `plasmoidviewer` to test the applet in a window:
    ```bash
    plasmoidviewer -a .
    ```

## 🛠️ Tech Stack

*   **QML / QtQuick:** For the "Event Horizon" user interface.
*   **JavaScript:** For "The Singularity" logic core.
*   **Plasma 6 API:** For deep integration with the desktop environment.

## 🤝 Contributing

We welcome fellow travelers of the cosmos! If you wish to contribute:
1.  Check the `PLAN.md` to see what we are working on.
2.  Fork the repo and create a pull request.
3.  Join the discussion on our issue tracker.

---

*Crafted with 🌟 by [Edward Flores](https://github.com/scherenhaenden)*
