# Architecture of MagnetarHeimarmene

## 1. The Magnetar Philosophy (Architectural Constraints)

To ensure long-term stability and strictly follow the **MagnetarModel**, the code is separated into three distinct layers. This prevents "Spaghetti Code" in QML.

*   **The Singularity (Core Logic):** Pure JavaScript modules. They handle data fetching, parsing, and normalization. They possess no UI awareness.
*   **The Event Horizon (View):** QML files. They are strictly visual. They receive data from the Singularity and render it. They do not perform complex logic.
*   **The Bridge (Integration):** The interface between the Widget and the KDE Host System (Akonadi/PIM).

## 2. Architecture Diagram

```text
[ Google Servers ] <---> [ KDE Online Accounts ] <---> [ Akonadi Server ]
                                                              ^
                                                              |
                                                      [ The Bridge ]
                                                              |
                                                    [ MagnetarHeimarmene ]
                                                    /         |          \
                                         (Data Flow)          |          (Visuals)
                                              /               |               \
                                     [ The Singularity ] --- [ State ] --- [ The Event Horizon ]
                                     (JS Modules:             (QML Props)    (QML Views:
                                      HeimarmeneEngine,                       HorizonView,
                                      AtmosphereEngine)                       WeatherOrb)
```

## 3. Directory Structure (Magnetar Compliant)

This structure **MUST** be respected.

```text
MagnetarHeimarmene/
├── metadata.json                 # Plasma 6 Identity Card
├── README.md                     # Governance & Entry Point
├── ARCHITECTURE.md               # This file
├── ...                           # Other Magnetar Model files
│
├── contents/
│   ├── ui/                       # [THE EVENT HORIZON] - Visuals Only
│   │   ├── main.qml              # Root Entry
│   │   ├── HorizonView.qml       # Main Timeline Render
│   │   ├── WeatherOrb.qml        # Weather Visualization
│   │   └── WarningFlare.qml      # Emergency Alert Overlay
│   │
│   ├── core/                     # [THE SINGULARITY] - Logic Only
│   │   ├── HeimarmeneEngine.js   # Calendar Parsing & Conflict Logic
│   │   ├── AtmosphereEngine.js   # Weather Data Normalization
│   │   └── MagnetarUtils.js      # Time/Date formatters
│   │
│   └── assets/                   # [STATIC MATTER]
│       ├── icons/
│       └── sounds/               # (Optional) For high-priority alerts
│
└── tests/                        # Automated Integrity Checks
    └── tst_Singularity.qml
```

## 4. Component Descriptions

### The Singularity (Core)
*   `HeimarmeneEngine.js`: Handles calendar data ingestion from the `DataSource`, parsing dates, and detecting conflicts.
*   `AtmosphereEngine.js`: Normalizes weather data from the DataEngine.
*   `MagnetarUtils.js`: Shared utility functions.

### The Event Horizon (UI)
*   `main.qml`: The root entry point. Manages state and loads sub-components.
*   `HorizonView.qml`: The primary timeline visualization.
*   `WeatherOrb.qml`: Visual representation of current weather.
*   `WarningFlare.qml`: Overlay for critical alerts.

### The Bridge
*   Uses `DataSource` with engine `"org.kde.plasma.PimCalendars"` to access Akonadi data without custom C++ backends (for V1.0).
