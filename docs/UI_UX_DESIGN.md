# Daily Notes - UI/UX Design Documentation

## Overview
This document outlines the visual identity, design system, and user interface guidelines for the Daily Notes application - a hospital daily notes management system.

---

## 1. Visual Identity

### 1.1 Color Palette

#### Primary Colors
| Color | Hex Code | Usage |
|-------|----------|-------|
| **Yellow** | `#FFFC00` | Primary color, CTAs, highlights, accents |
| **Black** | `#171717` | Dark backgrounds, text on light backgrounds |
| **White** | `#FFFFFF` | Light backgrounds, text on dark backgrounds |
| **Gray** | `#F3F4F6` | Cards, dividers, secondary surfaces |

#### Semantic Colors

**Success States**
- Light: `#D1FAE5`
- Default: `#10B981` (Emerald)
- Dark: `#065F46`

**Warning States**
- Light: `#FEF3C7`
- Default: `#F59E0B` (Amber)
- Dark: `#92400E`

**Error States**
- Light: `#FEE2E2`
- Default: `#EF4444` (Red)
- Dark: `#991B1B`

**Info States**
- Light: `#DBEAFE`
- Default: `#3B82F6` (Blue)
- Dark: `#1E40AF`

**Status Colors for Work Orders**
- **Pending**: `#F59E0B` (Amber)
- **Assigned**: `#3B82F6` (Blue)
- **In Progress**: `#10B981` (Emerald)
- **On Hold**: `#F59E0B` (Amber)
- **Completed**: `#10B981` (Emerald)
- **Cancelled**: `#EF4444` (Red)

**Status Colors for Tasks**
- **Pending**: `#6B7280` (Gray)
- **In Progress**: `#3B82F6` (Blue)
- **Completed**: `#10B981` (Emerald)
- **Cancelled**: `#EF4444` (Red)
- **Postponed**: `#F59E0B` (Amber)

**Priority Colors**
- **Low**: `#6B7280` (Gray)
- **Medium**: `#3B82F6` (Blue)
- **High**: `#F59E0B` (Amber)
- **Critical**: `#EF4444` (Red)

### 1.2 Typography

#### Arabic Font
- **Primary**: Noto Sans Arabic
- **Fallback**: Amiri, Traditional Arabic, Arial
- **Weights**: Regular (400), Medium (500), Bold (700)

#### English Font
- **Primary**: SF Pro Display (Headings)
- **Secondary**: SF Pro Text (Body)
- **Fallback**: Inter, Roboto, system fonts
- **Weights**: Regular (400), Medium (500), Bold (700)

#### Numbers
- Use **SF Pro Text** or **Noto Sans Arabic** (consistent with UI)
- Ensure proper RTL alignment
- Use Arabic numerals (٠١٢٣٤٥٦٧٨٩) for Arabic content
- Use Western numerals (0123456789) for English content

#### Font Sizes

| Type | Size (px) | Size (sp) | Line Height | Usage |
|------|-----------|-----------|-------------|-------|
| Display Large | 57 | 57sp | 64sp | Page titles |
| Display Medium | 45 | 45sp | 52sp | Section headers |
| Display Small | 36 | 36sp | 44sp | Subsection headers |
| Headline Large | 32 | 32sp | 40sp | Card titles |
| Headline Medium | 28 | 28sp | 36sp | Dialog titles |
| Headline Small | 24 | 24sp | 32sp | Section titles |
| Title Large | 22 | 22sp | 28sp | Card subtitles |
| Title Medium | 16 | 16sp | 24sp | Button text, list items |
| Title Small | 14 | 14sp | 20sp | Secondary buttons |
| Body Large | 16 | 16sp | 24sp | Body text |
| Body Medium | 14 | 14sp | 20sp | Secondary text |
| Body Small | 12 | 12sp | 16sp | Captions, hints |
| Label Large | 14 | 14sp | 20sp | Form labels |
| Label Small | 12 | 12sp | 16sp | Helper text |

### 1.3 Spacing System

Based on 4px grid system:
- **xxs**: 4px
- **xs**: 8px
- **sm**: 12px
- **md**: 16px
- **lg**: 24px
- **xl**: 32px
- **2xl**: 48px
- **3xl**: 64px

### 1.4 Border Radius

- **None**: 0px
- **Small**: 4px (form inputs, small buttons)
- **Medium**: 8px (cards, standard buttons)
- **Large**: 12px (modal dialogs)
- **Full**: 9999px (pills, avatars)

### 1.5 Shadows

- **Small**: 0 1px 2px rgba(0, 0, 0, 0.1)
- **Medium**: 0 2px 4px rgba(0, 0, 0, 0.1)
- **Large**: 0 4px 8px rgba(0, 0, 0, 0.1)
- **Elevated**: 0 8px 16px rgba(0, 0, 0, 0.1)

### 1.6 Icons

- Use **Material Icons** or **Custom SVG icons**
- Size: 24px (standard), 20px (small), 32px (large)
- Color: Inherit from text color or use primary yellow
- Consistent icon set across the app

---

## 2. Design Principles

### 2.1 RTL (Right-to-Left) Support
- **Default direction**: RTL for Arabic content
- **Bidirectional support**: Handle mixed Arabic/English content
- **Alignment**: Right-aligned for Arabic, left-aligned for English
- **Navigation**: Back button on right, forward on left (RTL)
- **Text fields**: Cursor and alignment follow language direction

### 2.2 Mobile-First Design
- **Primary platform**: Mobile (iOS & Android)
- **Breakpoints**:
  - Mobile: < 600px
  - Tablet: 600px - 1024px
  - Desktop: > 1024px
- **Touch targets**: Minimum 44x44px
- **Responsive**: Adapt layout for different screen sizes

### 2.3 Accessibility
- **Color contrast**: Minimum 4.5:1 for text
- **Text scaling**: Support up to 200% zoom
- **Screen readers**: Proper ARIA labels and semantics
- **Focus indicators**: Visible focus states
- **Keyboard navigation**: Full keyboard support

---

## 3. Theme System

### 3.1 Light Mode

| Element | Color |
|---------|-------|
| Background | `#FFFFFF` |
| Surface | `#F3F4F6` |
| Primary | `#FFFC00` |
| Primary Container | `#FFF9C4` |
| Secondary | `#171717` |
| Text Primary | `#171717` |
| Text Secondary | `#6B7280` |
| Text Tertiary | `#9CA3AF` |
| Divider | `#E5E7EB` |
| Error | `#EF4444` |
| Success | `#10B981` |
| Warning | `#F59E0B` |
| Info | `#3B82F6` |

### 3.2 Dark Mode

| Element | Color |
|---------|-------|
| Background | `#171717` |
| Surface | `#1F2937` |
| Surface Variant | `#374151` |
| Primary | `#FFFC00` |
| Primary Container | `#4A4A00` |
| Secondary | `#FFFFFF` |
| Text Primary | `#FFFFFF` |
| Text Secondary | `#D1D5DB` |
| Text Tertiary | `#9CA3AF` |
| Divider | `#374151` |
| Error | `#FCA5A5` |
| Success | `#34D399` |
| Warning | `#FBBF24` |
| Info | `#60A5FA` |

### 3.3 Theme Toggle
- **Storage**: Save preference in database (UserSettings table)
- **Default**: System preference
- **Options**: Light, Dark, System
- **Transition**: Smooth animation between themes

---

## 4. Navigation Structure

### 4.1 Main Navigation (Bottom Navigation Bar)

Mobile-first approach with bottom navigation for primary sections:

```
+---------------------+---------------------+---------------------+---------------------+
|     يومياتي         |     ذكرياتي        |     المهام          |     البحث           |
|   (Daily Notes)     |    (Memories)       |    (Tasks)          |   (Search)          |
+---------------------+---------------------+---------------------+---------------------+
```

**Icons**:
- يومياتي (Daily Notes): 📝
- ذكرياتي (Memories): 📚
- المهام (Tasks): ✅
- البحث (Search): 🔍

### 4.2 Secondary Navigation (Drawer/Side Menu)

For additional sections and settings:

```
☰ Menu
├── شغل المستشفى (Hospital Work)
│   ├── أوامر العمل (Work Orders)
│   ├── المعدات (Equipment)
│   ├── الفنيين (Technicians)
│   ├── الأقسام (Departments)
│   └── قوائم الفحص (Checklists)
├── النوتة (Notes)
│   ├── ملاحظاتي (My Notes)
│   └── المدونات اليومية (Daily Entries)
├── الأرشيف (Archive)
│   ├── أوامر العمل المنتهية
│   ├── المهام المنتهية
│   └── الملاحظات المؤرشفة
├── الإعدادات (Settings)
│   ├── المظهر (Appearance)
│   ├── اللغة (Language)
│   ├── الإشعارات (Notifications)
│   ├── النسخ الاحتياطي (Backup)
│   └── حول التطبيق (About)
└── تسجيل الخروج (Logout)
```

### 4.3 Work Order Navigation

```
Work Orders List
    └── Work Order Details
        ├── Overview
        ├── Checklist
        ├── History
        ├── Attachments
        └── Related Tasks
```

### 4.4 Task Navigation

```
Tasks List
    └── Task Details
        ├── Overview
        ├── Related Work Order
        ├── Attachments
        └── History
```

---

## 5. Screen Designs

### 5.1 Splash Screen

```
+----------------------------------+
|                                  |
|                                  |
|         [Daily Notes Logo]        |
|              daily-notes          |
|                                  |
|         [Loading Spinner]         |
|                                  |
|                                  |
+----------------------------------+
```

**Colors**: Dark background (#171717), Yellow logo (#FFFC00)
**Animation**: Fade in logo, spinning loader

### 5.2 Login Screen (if needed)

```
+----------------------------------+
|  ←  [Back]                       |
|                                  |
|         [App Logo]               |
|         مرحبا بكم                 |
|         Welcome Back              |
|                                  |
|  +----------------------------+  |
|  | 👤 Employee ID            |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | 🔒 Password               |  |
|  +----------------------------+  |
|                                  |
|  [    Login Button (Yellow)   ]  |
|                                  |
|  [   Forgot Password?          ]  |
|                                  |
+----------------------------------+
```

### 5.3 Home Screen (Daily Notes)

```
+----------------------------------+
|  ☰  يومياتي    🔔    👤        |
|----------------------------------|
|                                  |
|  [Search Bar]                    |
|                                  |
|  +----------------------------+  |
|  | 📅 اليوم                      |  |
|  | Date: 2024-01-15             |  |
|  | Mood: 😊 Energy: 8/10        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📝 المدونات اليومية          |  |
|  | [Add Daily Entry Button]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📋 أوامر العمل الجديدة      |  |
|  | 5 pending work orders        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | ✅ المهام المستحقة اليوم     |  |
|  | 3 tasks due today            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📌 ملاحظاتي المثبتة         |  |
|  | Pinned notes list            |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
|  📝    📚    ✅    🔍           |
+----------------------------------+
```

### 5.4 Work Orders List Screen

```
+----------------------------------+
|  ←  أوامر العمل    🔍    ☰      |
|----------------------------------|
|                                  |
|  [Filter Bar]                     |
|  Status: All ▼ | Priority: All   |
|                                  |
|  +----------------------------+  |
|  | 🔧 #WO-001                  |  |
|  | صيانة جهاز الأشعة            |  |
|  | Status: In Progress 🔄       |  |
|  | Priority: High 🔴            |  |
|  | Equipment: X-Ray Machine     |  |
|  | Due: Today                   |  |
|  +----------------------------+  |
|  | 🔧 #WO-002                  |  |
|  | صيانة جهاز المختبر           |  |
|  | Status: Pending ⏳           |  |
|  | Priority: Medium 🟡          |  |
|  | Equipment: Lab Equipment    |  |
|  | Due: Tomorrow                 |  |
|  +----------------------------+  |
|  | 🔧 #WO-003                  |  |
|  | تركيب جهاز تنفس صناعي      |  |
|  | Status: Completed ✅         |  |
|  | Priority: Critical 🔴        |  |
|  | Equipment: Ventilator        |  |
|  | Due: Yesterday               |  |
|  +----------------------------+  |
|                                  |
|  [    + Add Work Order        ]  |
|                                  |
+----------------------------------+
```

### 5.5 Work Order Details Screen

```
+----------------------------------+
|  ←  تفاصيل أمر العمل           |
|----------------------------------|
|                                  |
|  🔧 #WO-001                      |
|  صيانة جهاز الأشعة                |
|  X-Ray Maintenance                |
|                                  |
|  Status: In Progress 🔄           |
|  Priority: High 🔴                |
|  Assigned to: أحمد محمد          |
|  Due: Today                       |
|                                  |
|  +----------------------------+  |
|  | 📋 الوصف                      |  |
|  | صيانة دورية لجهاز الأشعة     |  |
|  | Regular maintenance...        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📝 قائمة الفحص                |  |
|  | ✅ Check item 1               |  |
|  | ✅ Check item 2               |  |
|  | ❌ Check item 3               |  |
|  | [View Full Checklist]         |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📎 المرفقات                   |  |
|  | 📄 Document.pdf               |  |
|  | 🖼️ Image.jpg                  |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📊 التاريخ                    |  |
|  | Created: 2024-01-10           |  |
|  | Updated: 2024-01-15           |  |
|  +----------------------------+  |
|                                  |
|  [    Update Status          ]  |
|  [    Add Note               ]  |
|  [    Add Attachment         ]  |
|                                  |
+----------------------------------+
```

### 5.6 Notes List Screen

```
+----------------------------------+
|  ←  ملاحظاتي    🔍    ☰         |
|----------------------------------|
|                                  |
|  [Search Bar]                     |
|                                  |
|  [Category Filter: All ▼]        |
|                                  |
|  +----------------------------+  |
|  | 📌 ملاحظة مثبتة               |  |
|  | عنوان الملاحظة                |  |
|  | هذا نص الملاحظة...            |  |
|  | Category: Technical           |  |
|  | Created: 2 days ago           |  |
|  +----------------------------+  |
|  | 📝 ملاحظة عادية               |  |
|  | عنوان آخر                    |  |
|  | نص الملاحظة...               |  |
|  | Category: General             |  |
|  | Created: 5 days ago           |  |
|  +----------------------------+  |
|  | 📝 ملاحظة أخرى                |  |
|  | عنوان ثالث                   |  |
|  | نص آخر...                    |  |
|  | Category: Safety              |  |
|  | Created: 1 week ago           |  |
|  +----------------------------+  |
|                                  |
|  [    + Add Note              ]  |
|                                  |
+----------------------------------+
```

### 5.7 Add/Edit Note Screen

```
+----------------------------------+
|  ←  إضافة ملاحظة                |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | عنوان الملاحظة *            |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | الفئة *                      |  |
|  | [Dropdown: Technical ▼]      |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | الأولوية                     |  |
|  | 🟢 Normal   🟡 High   🔴 Urgent|  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | اللون                        |  |
|  | [Color picker]                |  |
|  +----------------------------+  |
|  +----------------------------+  |
|  | النص *                       |  |
|  |                             |  |
|  |                             |  |
|  | (Multi-line text input)       |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📎 مرفقات                    |  |
|  | [Add Attachment Button]       |  |
|  +----------------------------+  |
|                                  |
|  [    Save as Draft          ]  |
|  [    Publish (Yellow)       ]  |
|                                  |
+----------------------------------+
```

### 5.8 Tasks List Screen

```
+----------------------------------+
|  ←  المهام    🔍    ☰            |
|----------------------------------|
|                                  |
|  [Filter Bar]                     |
|  Status: All ▼ | Priority: All   |
|                                  |
|  +----------------------------+  |
|  | ✅ مهمة منتهية                |  |
|  | عنوان المهمة                 |  |
|  | Due: Yesterday                |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 🔄 في تقدم                    |  |
|  | عنوان آخر                    |  |
|  | Due: Today                    |  |
|  | Progress: 50%                 |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | ⏳ في انتظار                  |  |
|  | عنوان ثالث                   |  |
|  | Due: Tomorrow                 |  |
|  +----------------------------+  |
|                                  |
|  [    + Add Task              ]  |
|                                  |
+----------------------------------+
```

### 5.9 Memories List Screen

```
+----------------------------------+
|  ←  ذكرياتي    🔍    ☰         |
|----------------------------------|
|                                  |
|  [Filter Bar]                     |
|  Category: All ▼ | Year: All      |
|                                  |
|  +----------------------------+  |
|  | ❤️  ذكرى مفضلة                |  |
|  | عنوان الذاكرة                 |  |
|  | Date: 2024-01-01              |  |
|  | Category: Achievement          |  |
|  | [Memory Image]                 |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📅 ذكرى عادية                 |  |
|  | عنوان آخر                    |  |
|  | Date: 2024-01-10              |  |
|  | Category: Work                |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 🌍 سفر                        |  |
|  | عنوان ثالث                   |  |
|  | Date: 2023-12-15              |  |
|  | Category: Travel              |  |
|  +----------------------------+  |
|                                  |
|  [    + Add Memory           ]  |
|                                  |
+----------------------------------+
```

### 5.10 Settings Screen

```
+----------------------------------+
|  ←  الإعدادات                    |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | 🎨 المظهر                     |  |
|  | Light / Dark / System        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 🌐 اللغة                      |  |
|  | العربية / English            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📱 حجم الخط                   |  |
|  | Small / Medium / Large       |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 🔔 الإشعارات                  |  |
|  | Enable / Disable              |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 💾 النسخ الاحتياطي            |  |
|  | Auto-backup: Daily           |  |
|  | Last backup: 2024-01-15      |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | ℹ️ حول التطبيق                |  |
|  | Version: 1.0.0                |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 📋 الشروط والأحكام            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | 🔒 الخصوصية                  |  |
|  +----------------------------+  |
|                                  |
|  [    Logout                  ]  |
|                                  |
+----------------------------------+
```

### 5.11 Search Screen

```
+----------------------------------+
|  [Search Bar - Focused]           |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | 🔍 Results for "صيانة"        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | أوامر العمل (2)               |  |
|  | ✅ #WO-001 - صيانة جهاز       |  |
|  | ✅ #WO-002 - صيانة مختبر      |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | الملاحظات (3)                |  |
|  | ✅ ملاحظة عن صيانة           |  |
|  | ✅ تعليمات الصيانة            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | المعدات (1)                   |  |
|  | ✅ جهاز الأشعة                |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | المهام (1)                    |  |
|  | ✅ صيانة دورية               |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

---

## 6. Component Library

### 6.1 Buttons

**Primary Button (Yellow)**
```
+---------------------+
| [Save]              |
+---------------------+
```
- Background: `#FFFC00`
- Text: `#171717`
- Padding: 12px 24px
- Border radius: 8px
- Height: 48px

**Secondary Button**
```
+---------------------+
| [Cancel]            |
+---------------------+
```
- Background: `#F3F4F6` (Light) / `#374151` (Dark)
- Text: `#171717` (Light) / `#FFFFFF` (Dark)
- Border: 1px solid `#E5E7EB` (Light) / `#4B5563` (Dark)
- Padding: 12px 24px
- Border radius: 8px
- Height: 48px

**Text Button**
```
[Forgot Password?]
```
- Text: `#3B82F6`
- No background
- Underline on hover

**Icon Button**
```
[☰]
```
- Size: 44px x 44px
- Background: Transparent or `#F3F4F6`
- Icon color: `#171717` (Light) / `#FFFFFF` (Dark)
- Border radius: 8px

**Floating Action Button**
```
  +  
```
- Size: 56px x 56px
- Background: `#FFFC00`
- Icon: `+` (24px)
- Icon color: `#171717`
- Shadow: Elevated
- Border radius: Full (28px)

### 6.2 Cards

**Standard Card**
```
+----------------------------+
| Title                      |
|----------------------------|
| Content                    |
|                            |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#1F2937` (Dark)
- Border: 1px solid `#E5E7EB` (Light) / `#374151` (Dark)
- Border radius: 8px
- Padding: 16px
- Shadow: Small

**Elevated Card**
```
+----------------------------+
| Content                    |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#1F2937` (Dark)
- Border radius: 8px
- Shadow: Medium
- Padding: 16px

**List Item Card**
```
+----------------------------+
| Title                      |
| Subtitle                   |
| Metadata                   |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#1F2937` (Dark)
- Border radius: 8px
- Padding: 12px 16px
- Margin: 8px 0
- Press effect: Ripple

### 6.3 Form Inputs

**Text Input**
```
+----------------------------+
| Label                      |
| [Input field]              |
| Hint text                  |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#374151` (Dark)
- Border: 1px solid `#E5E7EB` (Light) / `#4B5563` (Dark)
- Border radius: 4px
- Padding: 12px 16px
- Focus border: `#FFFC00` (2px)

**Text Area**
```
+----------------------------+
| Label                      |
| [Multi-line input]         |
|                            |
| Hint text                  |
+----------------------------+
```
- Same as text input but with multiple lines
- Min height: 100px

**Dropdown**
```
+----------------------------+
| Label                      |
| [Selected value ▼]         |
+----------------------------+
```
- Same styling as text input
- Dropdown icon on the left (RTL)
- Dropdown panel: White (Light) / `#1F2937` (Dark)

**Checkbox**
```
[✓] Label
```
- Size: 20px x 20px
- Unchecked: Border 2px `#E5E7EB` (Light) / `#4B5563` (Dark)
- Checked: Background `#FFFC00`, Icon `#171717`
- Label: 12px, `#171717` (Light) / `#FFFFFF` (Dark)

**Radio Button**
```
(●) Label
```
- Size: 20px x 20px
- Unchecked: Border 2px `#E5E7EB` (Light) / `#4B5563` (Dark)
- Checked: Background `#FFFC00`, Dot `#171717`
- Label: 12px, `#171717` (Light) / `#FFFFFF` (Dark)

**Switch**
```
[Toggle]
```
- Size: 44px x 24px
- Thumb size: 20px
- Off: Background `#E5E7EB` (Light) / `#374151` (Dark), Thumb `#FFFFFF`
- On: Background `#FFFC00`, Thumb `#171717`

### 6.4 Status Indicators

**Status Badge**
```
[In Progress]
```
- Padding: 4px 8px
- Border radius: 12px (Pill shape)
- Font size: 12px
- Colors based on status:
  - Pending: Background `#FEF3C7`, Text `#92400E`
  - In Progress: Background `#DBEAFE`, Text `#1E40AF`
  - Completed: Background `#D1FAE5`, Text `#065F46`
  - Cancelled: Background `#FEE2E2`, Text `#991B1B`

**Priority Badge**
```
[High]
```
- Same as status badge
- Colors:
  - Low: Background `#E5E7EB`, Text `#374151`
  - Medium: Background `#DBEAFE`, Text `#1E40AF`
  - High: Background `#FEF3C7`, Text `#92400E`
  - Critical: Background `#FEE2E2`, Text `#991B1B`

**Progress Bar**
```
[====    ] 60%
```
- Height: 4px
- Background: `#E5E7EB` (Light) / `#374151` (Dark)
- Progress: `#FFFC00`
- Border radius: 2px

### 6.5 Dialogs and Modals

**Alert Dialog**
```
+----------------------------+
| Title                      |
|----------------------------|
| Message text               |
|                            |
| [Cancel]        [OK]       |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#1F2937` (Dark)
- Border radius: 12px
- Padding: 24px
- Buttons: Right-aligned (RTL)

**Confirmation Dialog**
```
+----------------------------+
| Title                      |
|----------------------------|
| Message text               |
|                            |
| [Secondary] [Primary]      |
+----------------------------+
```
- Same as alert dialog
- Two action buttons

**Bottom Sheet**
```
+----------------------------+
| Title                      |
|----------------------------|
| Content                    |
|                            |
| [Action Button]            |
+----------------------------+
```
- Background: `#FFFFFF` (Light) / `#1F2937` (Dark)
- Border radius: 12px 12px 0 0 (Top corners only)
- Padding: 24px
- Height: Auto or 50% of screen

---

## 7. Interaction Patterns

### 7.1 Navigation
- **Bottom Navigation**: Tap to switch between main sections
- **Back Button**: Always on the right (RTL), goes back in navigation stack
- **Drawer**: Swipe from right edge or tap menu icon
- **Deep Links**: Support for opening specific screens via URLs

### 7.2 Gestures
- **Pull to Refresh**: Downward pull on lists
- **Swipe to Delete**: Horizontal swipe on list items
- **Long Press**: For multi-select or context menu
- **Pinch to Zoom**: On images and attachments

### 7.3 Feedback
- **Loading**: Spinner or skeleton loader
- **Success**: Checkmark animation + toast message
- **Error**: Error message + retry button
- **Empty State**: Illustrative icon + message + CTA

### 7.4 Animations
- **Page Transitions**: Slide (RTL: from right to left)
- **Modal Transitions**: Slide up from bottom
- **Button Press**: Ripple effect
- **Loading**: Fade in/out
- **Theme Change**: Smooth color transition

---

## 8. Responsive Design

### 8.1 Mobile (< 600px)
- Single column layout
- Bottom navigation
- Full-width cards
- Stacked buttons

### 8.2 Tablet (600px - 1024px)
- Two-column layout for lists
- Side navigation (collapsible)
- Larger cards
- More information visible

### 8.3 Desktop (> 1024px)
- Multi-column layout
- Side navigation (expanded)
- Larger spacing
- Full feature set

---

## 9. Accessibility Guidelines

1. **Color Contrast**: Ensure minimum 4.5:1 contrast ratio
2. **Text Size**: Support text scaling up to 200%
3. **Touch Targets**: Minimum 44x44px for interactive elements
4. **Screen Readers**: Use semantic HTML and ARIA labels
5. **Keyboard Navigation**: All functionality accessible via keyboard
6. **Focus Indicators**: Visible focus states for keyboard users
7. **Alternative Text**: Provide alt text for images
8. **Error Messages**: Clear, descriptive, and accessible
9. **Form Labels**: Always associate labels with inputs
10. **Skip Links**: Provide skip to content links

---

## 10. Implementation Notes

### 10.1 Flutter Implementation
- Use `Directionality` widget for RTL support
- Use `Theme` widget for theming
- Use `MediaQuery` for responsive design
- Use `Provider` or `Riverpod` for state management
- Use `sqflite` for SQLite database
- Use `shared_preferences` for simple settings
- Use `intl` package for localization

### 10.2 Color Usage in Code

```dart
// Light Theme
Color primary = const Color(0xFFFFFC00);
Color background = const Color(0xFFFFFFFF);
Color surface = const Color(0xFFF3F4F6);
Color textPrimary = const Color(0xFF171717);
Color textSecondary = const Color(0xFF6B7280);

// Dark Theme
Color primary = const Color(0xFFFFFC00);
Color background = const Color(0xFF171717);
Color surface = const Color(0xFF1F2937);
Color textPrimary = const Color(0xFFFFFFFF);
Color textSecondary = const Color(0xFFD1D5DB);
```

### 10.3 Typography in Code

```dart
TextStyle headlineLarge = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  fontFamily: isArabic ? 'NotoSansArabic' : 'SFProDisplay',
);

TextStyle bodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  fontFamily: isArabic ? 'NotoSansArabic' : 'SFProText',
);
```

---

## 11. Future Enhancements

1. **Custom Font Support**: Allow users to upload custom fonts
2. **Advanced Theming**: Custom color schemes
3. **Widget Customization**: Reorder dashboard widgets
4. **Dark Mode Scheduling**: Auto-switch based on time
5. **Animations**: More sophisticated animations
6. **Voice Input**: Voice-to-text for notes
7. **Offline Support**: Full offline functionality
8. **Sync**: Cross-device synchronization

---

## Appendix A: Font Files

To use the specified fonts, include the following font files in the project:

```
assets/fonts/
├── NotoSansArabic/
│   ├── NotoSansArabic-Regular.ttf
│   ├── NotoSansArabic-Medium.ttf
│   └── NotoSansArabic-Bold.ttf
└── SFPro/
    ├── SFProDisplay-Regular.ttf
    ├── SFProDisplay-Medium.ttf
    ├── SFProDisplay-Bold.ttf
    ├── SFProText-Regular.ttf
    ├── SFProText-Medium.ttf
    └── SFProText-Bold.ttf
```

Note: Ensure proper licensing for SF Pro fonts (Apple's proprietary fonts).
Alternative: Use Inter or Roboto as fallback.

---

## Appendix B: Color Palette Preview

### Primary Yellow
```
#FFFC00
┌─────────────────────────────┐
│                             │
│      YELLOW PRIMARY         │
│                             │
└─────────────────────────────┘
```

### Dark Background
```
#171717
┌─────────────────────────────┐
│                             │
│      DARK BACKGROUND        │
│                             │
└─────────────────────────────┘
```

### Light Background
```
#FFFFFF
┌─────────────────────────────┐
│                             │
│     LIGHT BACKGROUND        │
│                             │
└─────────────────────────────┘
```

### Gray Surface
```
#F3F4F6
┌─────────────────────────────┐
│                             │
│      GRAY SURFACE           │
│                             │
└─────────────────────────────┘
```

---

*Document Version: 1.0.0*
*Last Updated: 2024-01-15*
