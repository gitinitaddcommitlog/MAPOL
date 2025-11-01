import React from 'react';
import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/layout/Header.jsx';
import Dashboard from './pages/dashboard/Dashboard.jsx';
import MainForm from './pages/forms/MainForm.jsx';
import Reports from './pages/reports/Reports.jsx';
import './styles/globals.css';

function App() {
  return (
    <Router>
      <div style={{ 
        minHeight: '100vh', 
        background: 'linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%)' 
      }}>
        <Header />
        <main>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/form" element={<MainForm />} />
            <Route path="/reports" element={<Reports />} />
          </Routes>
        </main>
        <footer style={{
          background: 'var(--gradient-primary)',
          color: 'white',
          padding: '2rem 1rem',
          marginTop: '3rem',
          textAlign: 'center'
        }}>
          <div className="container">
            <p style={{ margin: 0, opacity: 0.9 }}>
              © 2024 ENA Waste Management Ltd. | MARPOL Compliance System v2.0
            </p>
            <p style={{ margin: '0.5rem 0 0 0', fontSize: '0.875rem', opacity: 0.7 }}>
              Tema Kpone Car Park | P.O. BOX GP 4369, Accra
            </p>
          </div>
        </footer>
      </div>
    </Router>
  );
}

export default App;
