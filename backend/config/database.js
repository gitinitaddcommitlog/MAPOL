import sqlite3 from 'sqlite3';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const dbPath = path.join(__dirname, '../database/marpol.db');

// Create database directory if it doesn't exist
const dbDir = path.dirname(dbPath);
if (!fs.existsSync(dbDir)) {
  fs.mkdirSync(dbDir, { recursive: true });
}

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error('Error opening database:', err.message);
  } else {
    console.log('Connected to SQLite database.');
    initializeDatabase();
  }
});

function initializeDatabase() {
  // Ships table
  db.run(`CREATE TABLE IF NOT EXISTS ships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ship_name TEXT NOT NULL,
    imo_number TEXT UNIQUE NOT NULL,
    gross_tonnage REAL,
    owner_operator TEXT,
    distinctive_number TEXT,
    flag_state TEXT,
    ship_type TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
  )`);

  // Port visits table
  db.run(`CREATE TABLE IF NOT EXISTS port_visits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ship_id INTEGER,
    location_terminal TEXT,
    arrival_datetime DATETIME,
    departure_datetime DATETIME,
    last_port_country TEXT,
    next_port_country TEXT,
    last_waste_discharge_port TEXT,
    last_discharge_date DATE,
    next_discharge_port TEXT,
    submitting_person TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ship_id) REFERENCES ships (id)
  )`);

  // Waste discharge records table
  db.run(`CREATE TABLE IF NOT EXISTS waste_discharges (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    port_visit_id INTEGER,
    marpol_annex TEXT NOT NULL,
    waste_type TEXT NOT NULL,
    quantity REAL DEFAULT 0,
    substance_name TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (port_visit_id) REFERENCES port_visits (id)
  )`);

  // Waste retained records table
  db.run(`CREATE TABLE IF NOT EXISTS waste_retained (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    port_visit_id INTEGER,
    marpol_annex TEXT NOT NULL,
    waste_type TEXT NOT NULL,
    max_capacity REAL DEFAULT 0,
    amount_retained REAL DEFAULT 0,
    next_delivery_port TEXT,
    volume_before_next_port REAL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (port_visit_id) REFERENCES port_visits (id)
  )`);

  // Form submissions table (main form records)
  db.run(`CREATE TABLE IF NOT EXISTS form_submissions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ship_id INTEGER,
    port_visit_id INTEGER,
    deliver_all_waste BOOLEAN DEFAULT FALSE,
    remarks TEXT,
    captain_signature TEXT,
    captain_agreed BOOLEAN DEFAULT FALSE,
    agent_signature TEXT,
    ema_signature TEXT,
    pdf_file_path TEXT,
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    status TEXT DEFAULT 'submitted',
    FOREIGN KEY (ship_id) REFERENCES ships (id),
    FOREIGN KEY (port_visit_id) REFERENCES port_visits (id)
  )`);

  // Users table (for authentication if needed)
  db.run(`CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role TEXT DEFAULT 'user',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  )`);

  console.log('Database tables initialized successfully.');
}

export default db;
