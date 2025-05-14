-- ===============================
-- 📦 Task Table Schema
-- ===============================
CREATE TABLE tasks (
  _id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_enum TEXT NOT NULL,
  priority_enum INTEGER NOT NULL,
  difficulty_enum INTEGER NOT NULL,
  title TEXT NOT NULL,
  detail TEXT NOT NULL,
  is_done INTEGER NOT NULL DEFAULT 0,
  start_date TEXT NOT NULL,
  estimate_date TEXT NOT NULL,
  complete_date TEXT,
  image_path TEXT DEFAULT '/asset/images/default.png',
  is_active INTEGER NOT NULL DEFAULT 1,
  create_date TEXT NOT NULL,
  updated_date TEXT
);

-- ===============================
-- 🌱 Seed Data (Optional)
-- ===============================
INSERT INTO tasks (
  category_enum, priority_enum, difficulty_enum, title, detail, is_done,
  start_date, estimate_date, complete_date, image_path, is_active,
  create_date, updated_date
) VALUES
('Work', 1, 1, 'Write Report', 'Write project report for supervisor', 0,
 '2025-05-10T09:00:00', '2025-05-12T18:00:00', NULL, '/asset/images/default.png', 1,
 '2025-05-09T10:00:00', NULL),

('Personal', 3, 2, 'Grocery Shopping', 'Buy vegetables and fruits', 1,
 '2025-05-08T15:00:00', '2025-05-08T17:00:00', '2025-05-08T17:30:00', NULL, 1,
 '2025-05-07T09:30:00', '2025-05-08T18:00:00');
