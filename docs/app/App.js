import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
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
        background: 'linear-gradient(135deg, #f8fafc 0%, #f1f5f9 50%, #e2e8f0 100%)',
        backgroundAttachment: 'fixed'
      }}>
        <Header />
        <main style={{ padding: '0' }}>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/form" element={<MainForm />} />
            <Route path="/reports" element={<Reports />} />
          </Routes>
        </main>
        
        {/* Enhanced Footer */}
        <footer style={{
          background: 'var(--gradient-primary)',
          color: 'white',
          padding: '40px 0 24px',
          marginTop: '80px',
          borderTop: '1px solid rgba(255, 255, 255, 0.1)'
        }}>
          <div className="container">
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
              gap: '40px',
              marginBottom: '32px'
            }}>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>ENA Waste Management Ltd.</h4>
                <p style={{ opacity: 0.7, lineHeight: 1.6 }}>
                  Professional maritime waste management solutions ensuring full MARPOL 73/78 compliance and environmental protection.
                </p>
              </div>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>Contact Info</h4>
                <p style={{ opacity: 0.7, marginBottom: '8px' }}>📍 Tema Kpone Car Park</p>
                <p style={{ opacity: 0.7, marginBottom: '8px' }}>📦 P.O. BOX GP 4369, Accra</p>
                <p style={{ opacity: 0.7 }}>📞 0244316155, 024272684, 0558674185</p>
              </div>
              <div>
                <h4 style={{ marginBottom: '16px', opacity: 0.9 }}>Compliance</h4>
                <p style={{ opacity: 0.7, lineHeight: 1.6 }}>
                  Under regulations of MARPOL 73/78 and Ghana Ports and Harbours Authority Declaration
                </p>
              </div>
            </div>
            
            <div style={{
              borderTop: '1px solid rgba(255, 255, 255, 0.1)',
              paddingTop: '24px',
              textAlign: 'center',
              opacity: 0.7
            }}>
              <p style={{ margin: 0 }}>
                © 2024 ENA Waste Management Ltd. All rights reserved. | MARPOL Compliance System v2.0
              </p>
            </div>
          </div>
        </footer>
      </div>
    </Router>
  );
}

export default App;
