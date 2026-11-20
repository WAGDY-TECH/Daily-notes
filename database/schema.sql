-- Daily Notes Database Schema
-- Version: 1.0.0
-- Description: Hospital daily notes management system

-- ============================================
-- DATABASE CONFIGURATION
-- ============================================

PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

-- ============================================
-- CORE TABLES
-- ============================================

-- Departments Table
CREATE TABLE IF NOT EXISTS Departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ar TEXT NOT NULL,
    name_en TEXT NOT NULL,
    code TEXT UNIQUE NOT NULL,
    description TEXT,
    parent_id INTEGER,
    is_active BOOLEAN DEFAULT 1,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES Departments(id) ON DELETE SET NULL
);

-- Equipment Table
CREATE TABLE IF NOT EXISTS Equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ar TEXT NOT NULL,
    name_en TEXT NOT NULL,
    code TEXT UNIQUE NOT NULL,
    department_id INTEGER NOT NULL,
    serial_number TEXT,
    manufacturer TEXT,
    model TEXT,
    purchase_date TEXT,
    warranty_expiry TEXT,
    status TEXT NOT NULL DEFAULT 'active', -- active, maintenance, retired, broken
    location TEXT,
    description TEXT,
    is_active BOOLEAN DEFAULT 1,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE
);

-- Technicians Table
CREATE TABLE IF NOT EXISTS Technicians (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id TEXT UNIQUE,
    first_name_ar TEXT NOT NULL,
    last_name_ar TEXT NOT NULL,
    first_name_en TEXT,
    last_name_en TEXT,
    email TEXT,
    phone TEXT,
    department_id INTEGER NOT NULL,
    specialization TEXT,
    qualification TEXT,
    hire_date TEXT,
    is_active BOOLEAN DEFAULT 1,
    avatar_url TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE
);

-- ============================================
-- WORK ORDERS
-- ============================================

-- WorkOrders Table
CREATE TABLE IF NOT EXISTS WorkOrders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    work_order_number TEXT UNIQUE NOT NULL,
    title_ar TEXT NOT NULL,
    title_en TEXT,
    description_ar TEXT,
    description_en TEXT,
    department_id INTEGER NOT NULL,
    equipment_id INTEGER,
    technician_id INTEGER,
    priority TEXT NOT NULL DEFAULT 'medium', -- low, medium, high, critical
    status TEXT NOT NULL DEFAULT 'pending', -- pending, assigned, in_progress, on_hold, completed, cancelled
    category TEXT NOT NULL, -- maintenance, repair, installation, inspection, calibration
    requested_by INTEGER,
    requested_date TEXT NOT NULL,
    due_date TEXT,
    completed_date TEXT,
    estimated_hours REAL,
    actual_hours REAL,
    cost REAL DEFAULT 0,
    is_emergency BOOLEAN DEFAULT 0,
    notes TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE CASCADE,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(id) ON DELETE SET NULL,
    FOREIGN KEY (technician_id) REFERENCES Technicians(id) ON DELETE SET NULL,
    FOREIGN KEY (requested_by) REFERENCES Technicians(id) ON DELETE SET NULL
);

-- WorkOrderHistory Table
CREATE TABLE IF NOT EXISTS WorkOrderHistory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    work_order_id INTEGER NOT NULL,
    status TEXT NOT NULL,
    changed_by INTEGER NOT NULL,
    change_reason TEXT,
    notes TEXT,
    changed_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (work_order_id) REFERENCES WorkOrders(id) ON DELETE CASCADE,
    FOREIGN KEY (changed_by) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ============================================
-- CHECKLISTS
-- ============================================

-- ChecklistTemplates Table
CREATE TABLE IF NOT EXISTS ChecklistTemplates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ar TEXT NOT NULL,
    name_en TEXT NOT NULL,
    code TEXT UNIQUE NOT NULL,
    description_ar TEXT,
    description_en TEXT,
    department_id INTEGER,
    equipment_id INTEGER,
    category TEXT NOT NULL, -- maintenance, safety, inspection, startup, shutdown
    version TEXT DEFAULT '1.0',
    is_active BOOLEAN DEFAULT 1,
    estimated_duration_minutes INTEGER,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE SET NULL,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(id) ON DELETE SET NULL
);

-- ChecklistItems Table
CREATE TABLE IF NOT EXISTS ChecklistItems (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    template_id INTEGER NOT NULL,
    item_number INTEGER NOT NULL,
    description_ar TEXT NOT NULL,
    description_en TEXT,
    category TEXT, -- preparation, inspection, testing, cleanup
    is_required BOOLEAN DEFAULT 1,
    default_value BOOLEAN DEFAULT 0,
    notes TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (template_id) REFERENCES ChecklistTemplates(id) ON DELETE CASCADE,
    UNIQUE (template_id, item_number)
);

-- ChecklistResults Table
CREATE TABLE IF NOT EXISTS ChecklistResults (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    work_order_id INTEGER NOT NULL,
    template_id INTEGER NOT NULL,
    technician_id INTEGER NOT NULL,
    started_at TEXT NOT NULL,
    completed_at TEXT,
    status TEXT NOT NULL DEFAULT 'in_progress', -- in_progress, completed, cancelled
    notes TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (work_order_id) REFERENCES WorkOrders(id) ON DELETE CASCADE,
    FOREIGN KEY (template_id) REFERENCES ChecklistTemplates(id) ON DELETE CASCADE,
    FOREIGN KEY (technician_id) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ChecklistItemResults Table
CREATE TABLE IF NOT EXISTS ChecklistItemResults (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    result_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    checklist_item_id INTEGER NOT NULL,
    value BOOLEAN NOT NULL, -- checked or not
    notes TEXT,
    timestamp TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (result_id) REFERENCES ChecklistResults(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES ChecklistItems(id) ON DELETE CASCADE,
    FOREIGN KEY (checklist_item_id) REFERENCES ChecklistItems(id) ON DELETE CASCADE
);

-- ============================================
-- NOTES AND DAILY ENTRIES
-- ============================================

-- Notes Table
CREATE TABLE IF NOT EXISTS Notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title_ar TEXT NOT NULL,
    title_en TEXT,
    content_ar TEXT NOT NULL,
    content_en TEXT,
    category TEXT, -- general, technical, safety, meeting, training
    priority TEXT DEFAULT 'normal', -- low, normal, high
    color_tag TEXT, -- User-defined color for categorization
    is_pinned BOOLEAN DEFAULT 0,
    is_archived BOOLEAN DEFAULT 0,
    created_by INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- DailyEntries Table
CREATE TABLE IF NOT EXISTS DailyEntries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL, -- YYYY-MM-DD format
    day_summary_ar TEXT,
    day_summary_en TEXT,
    weather TEXT,
    mood TEXT, -- happy, neutral, tired, stressed, sad
    energy_level INTEGER, -- 1-10
    sleep_hours REAL,
    created_by INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Technicians(id) ON DELETE CASCADE,
    UNIQUE (date, created_by)
);

-- ============================================
-- MEMORIES
-- ============================================

-- Memories Table
CREATE TABLE IF NOT EXISTS Memories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title_ar TEXT NOT NULL,
    title_en TEXT,
    content_ar TEXT NOT NULL,
    content_en TEXT,
    memory_date TEXT NOT NULL, -- Date of the memory (not creation date)
    category TEXT, -- personal, work, family, travel, achievement
    tags TEXT, -- Comma-separated tags
    location TEXT,
    is_favorite BOOLEAN DEFAULT 0,
    is_private BOOLEAN DEFAULT 0,
    created_by INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ============================================
-- TASKS
-- ============================================

-- Tasks Table
CREATE TABLE IF NOT EXISTS Tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title_ar TEXT NOT NULL,
    title_en TEXT,
    description_ar TEXT,
    description_en TEXT,
    category TEXT, -- work, personal, urgent, routine
    priority TEXT NOT NULL DEFAULT 'medium', -- low, medium, high, critical
    status TEXT NOT NULL DEFAULT 'pending', -- pending, in_progress, completed, cancelled, postponed
    due_date TEXT,
    due_time TEXT,
    estimated_duration_minutes INTEGER,
    actual_duration_minutes INTEGER,
    is_recurring BOOLEAN DEFAULT 0,
    recurrence_pattern TEXT, -- daily, weekly, monthly, yearly, custom
    recurrence_end_date TEXT,
    assigned_to INTEGER,
    created_by INTEGER NOT NULL,
    related_work_order_id INTEGER,
    related_equipment_id INTEGER,
    related_note_id INTEGER,
    is_archived BOOLEAN DEFAULT 0,
    completion_percentage INTEGER DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assigned_to) REFERENCES Technicians(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES Technicians(id) ON DELETE CASCADE,
    FOREIGN KEY (related_work_order_id) REFERENCES WorkOrders(id) ON DELETE SET NULL,
    FOREIGN KEY (related_equipment_id) REFERENCES Equipment(id) ON DELETE SET NULL,
    FOREIGN KEY (related_note_id) REFERENCES Notes(id) ON DELETE SET NULL
);

-- TaskHistory Table
CREATE TABLE IF NOT EXISTS TaskHistory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    task_id INTEGER NOT NULL,
    status TEXT NOT NULL,
    changed_by INTEGER NOT NULL,
    change_reason TEXT,
    notes TEXT,
    changed_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(id) ON DELETE CASCADE,
    FOREIGN KEY (changed_by) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ============================================
-- ATTACHMENTS
-- ============================================

-- Attachments Table
CREATE TABLE IF NOT EXISTS Attachments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    file_name TEXT NOT NULL,
    original_file_name TEXT NOT NULL,
    file_path TEXT NOT NULL,
    file_url TEXT,
    file_type TEXT NOT NULL, -- image, pdf, document, audio, video, other
    file_size_bytes INTEGER NOT NULL,
    mime_type TEXT,
    thumbnail_path TEXT,
    entity_type TEXT NOT NULL, -- work_order, note, daily_entry, memory, task, equipment, technician
    entity_id INTEGER NOT NULL,
    uploaded_by INTEGER NOT NULL,
    description TEXT,
    tags TEXT,
    is_public BOOLEAN DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (uploaded_by) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ============================================
-- USER SETTINGS AND PREFERENCES
-- ============================================

-- UserSettings Table
CREATE TABLE IF NOT EXISTS UserSettings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL UNIQUE,
    theme_mode TEXT NOT NULL DEFAULT 'system', -- light, dark, system
    language TEXT NOT NULL DEFAULT 'ar', -- ar, en
    font_size TEXT DEFAULT 'medium', -- small, medium, large
    date_format TEXT DEFAULT 'YYYY-MM-DD',
    time_format TEXT DEFAULT '24-hour', -- 24-hour, 12-hour
    start_of_week INTEGER DEFAULT 6, -- 0=Sunday, 1=Monday, ..., 6=Saturday
    enable_notifications BOOLEAN DEFAULT 1,
    notification_sound BOOLEAN DEFAULT 1,
    notification_vibration BOOLEAN DEFAULT 1,
    auto_backup BOOLEAN DEFAULT 1,
    backup_frequency TEXT DEFAULT 'daily', -- daily, weekly, monthly
    last_backup_date TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Technicians(id) ON DELETE CASCADE
);

-- ============================================
-- SEARCH INDEXES
-- ============================================

-- Full-text search for Notes
CREATE VIRTUAL TABLE IF NOT EXISTS NotesSearch USING fts5(
    title_ar, title_en, content_ar, content_en, category, tags,
    tokenize = "unicode61 remove_diacritics 2"
);

-- Full-text search for WorkOrders
CREATE VIRTUAL TABLE IF NOT EXISTS WorkOrdersSearch USING fts5(
    work_order_number, title_ar, title_en, description_ar, description_en, category, status, priority
);

-- Full-text search for Memories
CREATE VIRTUAL TABLE IF NOT EXISTS MemoriesSearch USING fts5(
    title_ar, title_en, content_ar, content_en, category, tags, location
);

-- Full-text search for Tasks
CREATE VIRTUAL TABLE IF NOT EXISTS TasksSearch USING fts5(
    title_ar, title_en, description_ar, description_en, category, status, priority
);

-- Full-text search for Equipment
CREATE VIRTUAL TABLE IF NOT EXISTS EquipmentSearch USING fts5(
    name_ar, name_en, code, serial_number, manufacturer, model, description
);

-- ============================================
-- TRIGGERS FOR UPDATING TIMESTAMPS
-- ============================================

-- Trigger for updating updated_at on Departments
CREATE TRIGGER IF NOT EXISTS update_departments_timestamp 
AFTER UPDATE ON Departments
FOR EACH ROW
BEGIN
    UPDATE Departments SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on Equipment
CREATE TRIGGER IF NOT EXISTS update_equipment_timestamp 
AFTER UPDATE ON Equipment
FOR EACH ROW
BEGIN
    UPDATE Equipment SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on Technicians
CREATE TRIGGER IF NOT EXISTS update_technicians_timestamp 
AFTER UPDATE ON Technicians
FOR EACH ROW
BEGIN
    UPDATE Technicians SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on WorkOrders
CREATE TRIGGER IF NOT EXISTS update_work_orders_timestamp 
AFTER UPDATE ON WorkOrders
FOR EACH ROW
BEGIN
    UPDATE WorkOrders SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on ChecklistTemplates
CREATE TRIGGER IF NOT EXISTS update_checklist_templates_timestamp 
AFTER UPDATE ON ChecklistTemplates
FOR EACH ROW
BEGIN
    UPDATE ChecklistTemplates SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on Notes
CREATE TRIGGER IF NOT EXISTS update_notes_timestamp 
AFTER UPDATE ON Notes
FOR EACH ROW
BEGIN
    UPDATE Notes SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on DailyEntries
CREATE TRIGGER IF NOT EXISTS update_daily_entries_timestamp 
AFTER UPDATE ON DailyEntries
FOR EACH ROW
BEGIN
    UPDATE DailyEntries SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on Memories
CREATE TRIGGER IF NOT EXISTS update_memories_timestamp 
AFTER UPDATE ON Memories
FOR EACH ROW
BEGIN
    UPDATE Memories SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- Trigger for updating updated_at on Tasks
CREATE TRIGGER IF NOT EXISTS update_tasks_timestamp 
AFTER UPDATE ON Tasks
FOR EACH ROW
BEGIN
    UPDATE Tasks SET updated_at = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

-- ============================================
-- TRIGGERS FOR FULL-TEXT SEARCH
-- ============================================

-- Trigger for Notes search index
CREATE TRIGGER IF NOT EXISTS insert_notes_search 
AFTER INSERT ON Notes
FOR EACH ROW
BEGIN
    INSERT INTO NotesSearch(rowid, title_ar, title_en, content_ar, content_en, category, tags)
    VALUES (NEW.id, NEW.title_ar, NEW.title_en, NEW.content_ar, NEW.content_en, NEW.category, NEW.tags);
END;

CREATE TRIGGER IF NOT EXISTS update_notes_search 
AFTER UPDATE ON Notes
FOR EACH ROW
BEGIN
    UPDATE NotesSearch SET 
        title_ar = NEW.title_ar,
        title_en = NEW.title_en,
        content_ar = NEW.content_ar,
        content_en = NEW.content_en,
        category = NEW.category,
        tags = NEW.tags
    WHERE rowid = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS delete_notes_search 
AFTER DELETE ON Notes
FOR EACH ROW
BEGIN
    DELETE FROM NotesSearch WHERE rowid = OLD.id;
END;

-- Trigger for WorkOrders search index
CREATE TRIGGER IF NOT EXISTS insert_work_orders_search 
AFTER INSERT ON WorkOrders
FOR EACH ROW
BEGIN
    INSERT INTO WorkOrdersSearch(rowid, work_order_number, title_ar, title_en, description_ar, description_en, category, status, priority)
    VALUES (NEW.id, NEW.work_order_number, NEW.title_ar, NEW.title_en, NEW.description_ar, NEW.description_en, NEW.category, NEW.status, NEW.priority);
END;

CREATE TRIGGER IF NOT EXISTS update_work_orders_search 
AFTER UPDATE ON WorkOrders
FOR EACH ROW
BEGIN
    UPDATE WorkOrdersSearch SET 
        work_order_number = NEW.work_order_number,
        title_ar = NEW.title_ar,
        title_en = NEW.title_en,
        description_ar = NEW.description_ar,
        description_en = NEW.description_en,
        category = NEW.category,
        status = NEW.status,
        priority = NEW.priority
    WHERE rowid = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS delete_work_orders_search 
AFTER DELETE ON WorkOrders
FOR EACH ROW
BEGIN
    DELETE FROM WorkOrdersSearch WHERE rowid = OLD.id;
END;

-- ============================================
-- INITIAL DATA
-- ============================================

-- Insert default departments
INSERT OR IGNORE INTO Departments (id, name_ar, name_en, code, description, is_active) VALUES
(1, 'صيانة المعدات', 'Equipment Maintenance', 'EQ-MNT', 'قسم صيانة جميع المعدات الطبية', 1),
(2, 'صيانة كهربائية', 'Electrical Maintenance', 'ELEC-MNT', 'قسم الصيانة الكهربائية', 1),
(3, 'صيانة ميكانيكية', 'Mechanical Maintenance', 'MECH-MNT', 'قسم الصيانة الميكانيكية', 1),
(4, 'صيانة إلكترونية', 'Electronic Maintenance', 'ELEC-MNT', 'قسم الصيانة الإلكترونية', 1),
(5, 'غرف العمليات', 'Operating Rooms', 'OR', 'غرف العمليات الجراحية', 1),
(6, 'الطوارئ', 'Emergency', 'ER', 'قسم الطوارئ', 1),
(7, 'العناية المركزة', 'Intensive Care', 'ICU', 'وحدات العناية المركزة', 1);

-- Insert sample equipment
INSERT OR IGNORE INTO Equipment (name_ar, name_en, code, department_id, serial_number, manufacturer, model, status) VALUES
('جهاز أشعة X', 'X-Ray Machine', 'XRAY-001', 1, 'XR2023001', 'Siemens', 'SOMATOM', 'active'),
('جهاز مختبر', 'Lab Equipment', 'LAB-001', 1, 'LB2023001', 'Roche', 'Cobas 8000', 'active'),
('جهاز تنفس صناعي', 'Ventilator', 'VENT-001', 5, 'VN2023001', 'Dräger', 'Evita V500', 'active'),
('مراقب المريض', 'Patient Monitor', 'MON-001', 6, 'PM2023001', 'Philips', 'IntelliVue MP70', 'active');

-- Insert sample technician
INSERT OR IGNORE INTO Technicians (employee_id, first_name_ar, last_name_ar, first_name_en, last_name_en, email, phone, department_id, specialization) VALUES
('EMP001', 'أحمد', 'محمد', 'Ahmed', 'Mohamed', 'ahmed@hospital.com', '+123456789', 1, 'صيانة معدات طبية');

-- Insert sample user settings
INSERT OR IGNORE INTO UserSettings (user_id, theme_mode, language, font_size) VALUES
(1, 'dark', 'ar', 'medium');

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================

-- Indexes for Departments
CREATE INDEX IF NOT EXISTS idx_departments_parent ON Departments(parent_id);
CREATE INDEX IF NOT EXISTS idx_departments_active ON Departments(is_active);

-- Indexes for Equipment
CREATE INDEX IF NOT EXISTS idx_equipment_department ON Equipment(department_id);
CREATE INDEX IF NOT EXISTS idx_equipment_status ON Equipment(status);
CREATE INDEX IF NOT EXISTS idx_equipment_active ON Equipment(is_active);

-- Indexes for Technicians
CREATE INDEX IF NOT EXISTS idx_technicians_department ON Technicians(department_id);
CREATE INDEX IF NOT EXISTS idx_technicians_active ON Technicians(is_active);

-- Indexes for WorkOrders
CREATE INDEX IF NOT EXISTS idx_work_orders_department ON WorkOrders(department_id);
CREATE INDEX IF NOT EXISTS idx_work_orders_equipment ON WorkOrders(equipment_id);
CREATE INDEX IF NOT EXISTS idx_work_orders_technician ON WorkOrders(technician_id);
CREATE INDEX IF NOT EXISTS idx_work_orders_status ON WorkOrders(status);
CREATE INDEX IF NOT EXISTS idx_work_orders_priority ON WorkOrders(priority);
CREATE INDEX IF NOT EXISTS idx_work_orders_dates ON WorkOrders(requested_date, due_date, completed_date);
CREATE INDEX IF NOT EXISTS idx_work_orders_number ON WorkOrders(work_order_number);

-- Indexes for ChecklistTemplates
CREATE INDEX IF NOT EXISTS idx_checklist_templates_department ON ChecklistTemplates(department_id);
CREATE INDEX IF NOT EXISTS idx_checklist_templates_equipment ON ChecklistTemplates(equipment_id);
CREATE INDEX IF NOT EXISTS idx_checklist_templates_category ON ChecklistTemplates(category);
CREATE INDEX IF NOT EXISTS idx_checklist_templates_active ON ChecklistTemplates(is_active);

-- Indexes for ChecklistItems
CREATE INDEX IF NOT EXISTS idx_checklist_items_template ON ChecklistItems(template_id);

-- Indexes for ChecklistResults
CREATE INDEX IF NOT EXISTS idx_checklist_results_work_order ON ChecklistResults(work_order_id);
CREATE INDEX IF NOT EXISTS idx_checklist_results_template ON ChecklistResults(template_id);
CREATE INDEX IF NOT EXISTS idx_checklist_results_technician ON ChecklistResults(technician_id);
CREATE INDEX IF NOT EXISTS idx_checklist_results_status ON ChecklistResults(status);

-- Indexes for Notes
CREATE INDEX IF NOT EXISTS idx_notes_created_by ON Notes(created_by);
CREATE INDEX IF NOT EXISTS idx_notes_pinned ON Notes(is_pinned);
CREATE INDEX IF NOT EXISTS idx_notes_archived ON Notes(is_archived);
CREATE INDEX IF NOT EXISTS idx_notes_category ON Notes(category);
CREATE INDEX IF NOT EXISTS idx_notes_priority ON Notes(priority);

-- Indexes for DailyEntries
CREATE INDEX IF NOT EXISTS idx_daily_entries_date ON DailyEntries(date);
CREATE INDEX IF NOT EXISTS idx_daily_entries_created_by ON DailyEntries(created_by);

-- Indexes for Memories
CREATE INDEX IF NOT EXISTS idx_memories_created_by ON Memories(created_by);
CREATE INDEX IF NOT EXISTS idx_memories_date ON Memories(memory_date);
CREATE INDEX IF NOT EXISTS idx_memories_favorite ON Memories(is_favorite);
CREATE INDEX IF NOT EXISTS idx_memories_category ON Memories(category);

-- Indexes for Tasks
CREATE INDEX IF NOT EXISTS idx_tasks_created_by ON Tasks(created_by);
CREATE INDEX IF NOT EXISTS idx_tasks_assigned_to ON Tasks(assigned_to);
CREATE INDEX IF NOT EXISTS idx_tasks_status ON Tasks(status);
CREATE INDEX IF NOT EXISTS idx_tasks_priority ON Tasks(priority);
CREATE INDEX IF NOT EXISTS idx_tasks_due_date ON Tasks(due_date);
CREATE INDEX IF NOT EXISTS idx_tasks_category ON Tasks(category);
CREATE INDEX IF NOT EXISTS idx_tasks_archived ON Tasks(is_archived);
CREATE INDEX IF NOT EXISTS idx_tasks_work_order ON Tasks(related_work_order_id);
CREATE INDEX IF NOT EXISTS idx_tasks_equipment ON Tasks(related_equipment_id);

-- Indexes for Attachments
CREATE INDEX IF NOT EXISTS idx_attachments_entity ON Attachments(entity_type, entity_id);
CREATE INDEX IF NOT EXISTS idx_attachments_uploaded_by ON Attachments(uploaded_by);

-- Indexes for WorkOrderHistory
CREATE INDEX IF NOT EXISTS idx_work_order_history_work_order ON WorkOrderHistory(work_order_id);
CREATE INDEX IF NOT EXISTS idx_work_order_history_changed_by ON WorkOrderHistory(changed_by);
CREATE INDEX IF NOT EXISTS idx_work_order_history_changed_at ON WorkOrderHistory(changed_at);

-- Indexes for TaskHistory
CREATE INDEX IF NOT EXISTS idx_task_history_task ON TaskHistory(task_id);
CREATE INDEX IF NOT EXISTS idx_task_history_changed_by ON TaskHistory(changed_by);
CREATE INDEX IF NOT EXISTS idx_task_history_changed_at ON TaskHistory(changed_at);

-- ============================================
-- VIEWS FOR COMMON QUERIES
-- ============================================

-- View for active work orders
CREATE VIEW IF NOT EXISTS vw_active_work_orders AS
SELECT 
    wo.*,
    d.name_ar as department_name_ar,
    d.name_en as department_name_en,
    e.name_ar as equipment_name_ar,
    e.name_en as equipment_name_en,
    t.first_name_ar || ' ' || t.last_name_ar as technician_name_ar,
    t.first_name_en || ' ' || t.last_name_en as technician_name_en
FROM WorkOrders wo
LEFT JOIN Departments d ON wo.department_id = d.id
LEFT JOIN Equipment e ON wo.equipment_id = e.id
LEFT JOIN Technicians t ON wo.technician_id = t.id
WHERE wo.status NOT IN ('completed', 'cancelled')
ORDER BY wo.priority DESC, wo.requested_date ASC;

-- View for today's tasks
CREATE VIEW IF NOT EXISTS vw_today_tasks AS
SELECT 
    t.*,
    assigned.first_name_ar || ' ' || assigned.last_name_ar as assigned_to_name_ar,
    assigned.first_name_en || ' ' || assigned.last_name_en as assigned_to_name_en,
    created.first_name_ar || ' ' || created.last_name_ar as created_by_name_ar,
    created.first_name_en || ' ' || created.last_name_en as created_by_name_en
FROM Tasks t
LEFT JOIN Technicians assigned ON t.assigned_to = assigned.id
LEFT JOIN Technicians created ON t.created_by = created.id
WHERE t.due_date = date('now') AND t.status NOT IN ('completed', 'cancelled')
ORDER BY t.priority DESC, t.due_time ASC;

-- View for recent notes
CREATE VIEW IF NOT EXISTS vw_recent_notes AS
SELECT 
    n.*,
    t.first_name_ar || ' ' || t.last_name_ar as created_by_name_ar,
    t.first_name_en || ' ' || t.last_name_en as created_by_name_en
FROM Notes n
LEFT JOIN Technicians t ON n.created_by = t.id
WHERE n.is_archived = 0
ORDER BY n.created_at DESC
LIMIT 50;

-- View for daily summary
CREATE VIEW IF NOT EXISTS vw_daily_summary AS
SELECT 
    de.date,
    de.day_summary_ar,
    de.day_summary_en,
    de.mood,
    de.energy_level,
    de.sleep_hours,
    t.first_name_ar || ' ' || t.last_name_ar as technician_name_ar,
    t.first_name_en || ' ' || t.last_name_en as technician_name_en
FROM DailyEntries de
LEFT JOIN Technicians t ON de.created_by = t.id
ORDER BY de.date DESC
LIMIT 30;

-- View for equipment status overview
CREATE VIEW IF NOT EXISTS vw_equipment_status_overview AS
SELECT 
    d.name_ar as department_name_ar,
    d.name_en as department_name_en,
    COUNT(e.id) as total_equipment,
    SUM(CASE WHEN e.status = 'active' THEN 1 ELSE 0 END) as active_count,
    SUM(CASE WHEN e.status = 'maintenance' THEN 1 ELSE 0 END) as maintenance_count,
    SUM(CASE WHEN e.status = 'broken' THEN 1 ELSE 0 END) as broken_count,
    SUM(CASE WHEN e.status = 'retired' THEN 1 ELSE 0 END) as retired_count
FROM Departments d
LEFT JOIN Equipment e ON d.id = e.department_id
GROUP BY d.id, d.name_ar, d.name_en
ORDER BY d.name_ar;

-- View for technician workload
CREATE VIEW IF NOT EXISTS vw_technician_workload AS
SELECT 
    t.id,
    t.first_name_ar || ' ' || t.last_name_ar as technician_name_ar,
    t.first_name_en || ' ' || t.last_name_en as technician_name_en,
    COUNT(DISTINCT wo.id) as active_work_orders,
    COUNT(DISTINCT ta.id) as assigned_tasks,
    COUNT(DISTINCT cr.id) as checklist_results
FROM Technicians t
LEFT JOIN WorkOrders wo ON t.id = wo.technician_id AND wo.status NOT IN ('completed', 'cancelled')
LEFT JOIN Tasks ta ON t.id = ta.assigned_to AND ta.status NOT IN ('completed', 'cancelled')
LEFT JOIN ChecklistResults cr ON t.id = cr.technician_id AND cr.status NOT IN ('cancelled')
GROUP BY t.id, technician_name_ar, technician_name_en
ORDER BY active_work_orders DESC, assigned_tasks DESC;

COMMIT;
