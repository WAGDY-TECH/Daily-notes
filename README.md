# Daily Notes - Hospital Daily Notes Management System

## Overview

**Daily Notes** is a comprehensive mobile-first application designed for hospital staff to manage daily work orders, notes, tasks, memories, and equipment maintenance. The application features a clean RTL (right-to-left) interface optimized for Arabic-speaking users with full support for English medical terminology.

## Features

### Core Functionality
- **Work Orders Management**: Create, track, and manage maintenance work orders
- **Equipment Tracking**: Monitor hospital equipment status and maintenance history
- **Technician Management**: Manage technician profiles and assignments
- **Department Organization**: Hierarchical department structure
- **Checklists**: Create and use standardized checklists for maintenance procedures

### Daily Notes & Memories
- **Notes**: Create, categorize, and search personal and work-related notes
- **Daily Entries**: Log daily summaries, mood, energy levels, and sleep patterns
- **Memories**: Store and categorize important memories with tags and locations

### Task Management
- **Task Tracking**: Create, assign, and track tasks with priorities and due dates
- **Recurring Tasks**: Support for recurring task patterns
- **Task History**: Track status changes and completion history

### Additional Features
- **Attachments**: Upload and manage files (images, documents, PDFs)
- **Comprehensive Search**: Full-text search across all entities
- **RTL Support**: Full right-to-left support for Arabic content
- **Mobile-First Design**: Optimized for mobile devices with responsive layouts
- **Theme Support**: Light, dark, and system theme modes
- **Multi-language**: Arabic and English language support

## Technology Stack

- **Framework**: Flutter 3.x
- **Language**: Dart 3.x
- **State Management**: Riverpod
- **Database**: SQLite (via sqflite)
- **Storage**: Shared Preferences, Secure Storage
- **Navigation**: Go Router
- **Localization**: Flutter Localizations + intl

## Design System

### Colors
- **Primary**: `#FFFC00` (Yellow)
- **Background (Light)**: `#FFFFFF` (White)
- **Background (Dark)**: `#171717` (Black)
- **Surface**: `#F3F4F6` (Gray)

### Typography
- **Arabic**: Noto Sans Arabic
- **English (Headings)**: SF Pro Display
- **English (Body)**: SF Pro Text

### Design Principles
- Mobile-first approach
- RTL (Right-to-Left) by default
- Rounded corners for cards
- Unified icon set
- Bottom navigation for main sections
- Side/drawer navigation for secondary sections

## Project Structure

```
daily-notes/
├── android/                    # Android platform code
├── ios/                        # iOS platform code
├── lib/                        # Main Dart code
│   ├── main.dart               # Application entry point
│   ├── app.dart                # App configuration
│   ├── config/                 # Configuration files
│   │   └── routes.dart         # Route definitions
│   ├── core/                   # Core utilities
│   │   └── theme/              # Theme configuration
│   │       ├── colors.dart
│   │       └── app_theme.dart
│   ├── data/                   # Data layer
│   │   ├── models/             # Data models
│   │   ├── datasources/        # Data sources
│   │   └── repositories/       # Repository implementations
│   ├── domain/                 # Domain layer
│   │   ├── entities/           # Business entities
│   │   ├── repositories/       # Repository interfaces
│   │   └── usecases/           # Use cases
│   └── presentation/           # Presentation layer
│       ├── providers/          # State providers
│       ├── screens/            # Application screens
│       └── widgets/            # Reusable widgets
├── assets/                     # Static assets
│   ├── fonts/                  # Font files
│   ├── icons/                  # Icon files
│   └── images/                 # Image files
├── database/                   # Database files
│   └── schema.sql              # Database schema
├── docs/                       # Documentation
│   ├── UI_UX_DESIGN.md         # UI/UX design documentation
│   └── ARCHITECTURE.md         # Architecture documentation
├── pubspec.yaml                # Project configuration
└── README.md
```

## Database Schema

The application uses SQLite with the following tables:

- **Departments**: Hospital departments hierarchy
- **Equipment**: Medical equipment inventory
- **Technicians**: Staff and technician profiles
- **WorkOrders**: Maintenance and repair work orders
- **WorkOrderHistory**: Status change history for work orders
- **ChecklistTemplates**: Reusable checklist templates
- **ChecklistItems**: Items within checklists
- **ChecklistResults**: Completed checklist instances
- **ChecklistItemResults**: Individual item results
- **Notes**: Personal and work notes
- **DailyEntries**: Daily journal entries
- **Memories**: Important memories and events
- **Tasks**: Task management
- **TaskHistory**: Status change history for tasks
- **Attachments**: File attachments for all entities
- **UserSettings**: User preferences and settings

For the complete database schema, see [database/schema.sql](database/schema.sql).

## Getting Started

### Prerequisites

- Flutter SDK 3.16 or higher
- Dart SDK 3.0 or higher
- Android Studio or Xcode (for mobile development)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/WAGDY-TECH/Daily-notes.git
   cd Daily-notes
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate code (if using freezed):
   ```bash
   flutter pub run build_runner build
   ```

4. Run the application:
   ```bash
   flutter run
   ```

### Android Setup

1. Ensure you have Android SDK installed
2. Create an Android emulator or connect a physical device
3. Run: `flutter run -d android`

### iOS Setup

1. Ensure you have Xcode installed (macOS only)
2. Run: `flutter run -d ios`

## Configuration

### Environment Variables

Create a `.env` file in the root directory for environment-specific configurations:

```env
# App configuration
APP_NAME=Daily Notes
APP_VERSION=1.0.0

# Database configuration
DB_NAME=daily_notes.db
DB_VERSION=1

# Theme configuration
DEFAULT_THEME=system
DEFAULT_LANGUAGE=ar
```

### Theme Configuration

The application supports three theme modes:
- **Light**: Light background with dark text
- **Dark**: Dark background with light text
- **System**: Follows system preference

Theme preferences are automatically saved and restored between app launches.

### Language Configuration

The application supports two languages:
- **Arabic (ar)**: RTL layout, Arabic text
- **English (en)**: LTR layout, English text

Language preferences are automatically saved and restored.

## UI/UX Design

For detailed design specifications, see [docs/UI_UX_DESIGN.md](docs/UI_UX_DESIGN.md).

### Key Design Decisions

1. **Mobile-First**: Optimized for mobile devices with responsive layouts for tablets and desktop
2. **RTL Support**: Full right-to-left support for Arabic content
3. **Accessibility**: High contrast colors, proper text scaling, and keyboard navigation
4. **Consistency**: Unified design language across all screens

### Screen Designs

The application includes the following main screens:

- **Splash Screen**: Loading screen with app logo
- **Home Screen**: Dashboard with daily summary and quick access
- **Work Orders**: List and detail views for work orders
- **Notes**: List and detail views for notes
- **Daily Entries**: Calendar and detail views for daily entries
- **Memories**: Grid and detail views for memories
- **Tasks**: List and detail views for tasks
- **Equipment**: List and detail views for equipment
- **Technicians**: List and detail views for technicians
- **Departments**: Hierarchical view of departments
- **Checklists**: Template and execution views for checklists
- **Search**: Comprehensive search across all entities
- **Settings**: App preferences and configuration

## Architecture

For detailed architecture information, see [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

### Architecture Pattern

The application follows **Clean Architecture** principles with the following layers:

1. **Presentation Layer**: Screens, widgets, and state management
2. **Domain Layer**: Business logic, entities, and use cases
3. **Data Layer**: Data sources, repositories, and models
4. **External Layer**: Database, file system, and network

### State Management

The application uses **Riverpod** for state management:
- **Providers**: For dependency injection and simple state
- **State Notifiers**: For complex state management
- **Async Values**: For handling loading, error, and data states

### Database

The application uses **SQLite** via the `sqflite` package:
- **Database Helper**: Singleton pattern for database access
- **DAO Pattern**: Data Access Objects for each entity
- **Migrations**: Version-controlled schema updates

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run unit tests
flutter test test/unit

# Run widget tests
flutter test test/widget

# Run integration tests
flutter test test/integration
```

### Test Coverage

The application includes tests for:
- Use cases (unit tests)
- Widgets (widget tests)
- User flows (integration tests)

## Contributing

### Code Style

- Follow Dart style guide
- Use consistent naming conventions
- Add comments for complex logic
- Keep functions and methods small and focused

### Commit Messages

Use conventional commit messages:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test-related changes
- `chore`: Maintenance tasks

### Pull Request Process

1. Create a feature branch from `main`
2. Make your changes
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request
6. Wait for code review
7. Address review comments
8. Merge after approval

## License

This project is proprietary and confidential. All rights reserved.

## Contact

For questions or support, please contact:
- **Repository**: [WAGDY-TECH/Daily-notes](https://github.com/WAGDY-TECH/Daily-notes)
- **Issues**: [GitHub Issues](https://github.com/WAGDY-TECH/Daily-notes/issues)

## Version History

- **1.0.0** (2024-01-15): Initial release
  - Database schema definition
  - UI/UX design documentation
  - Application architecture
  - Basic project structure

---

*Made with Flutter and Dart*
