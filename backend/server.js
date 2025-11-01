import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import formRoutes from './routes/formRoutes.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ADD THIS MISSING ENDPOINT
app.get('/api', (req, res) => {
  res.json({ 
    success: true, 
    message: 'MARPOL API Server',
    endpoints: {
      health: '/api/health',
      forms: '/api/forms',
      reports: '/api/reports'
    }
  });
});

app.use('/api/forms', formRoutes);

app.get('/api/health', (req, res) => {
  res.json({ 
    success: true, 
    message: 'MARPOL Backend is running!',
    timestamp: new Date().toISOString()
  });
});

// Mock reports endpoint
app.get('/api/reports', (req, res) => {
  res.json({
    success: true,
    data: [
      {
        id: 1,
        type: 'Annex V - Garbage Record Book',
        status: 'Completed',
        date: '2024-01-15',
        vessel: 'Ocean Guardian'
      }
    ]
  });
});

app.use('*', (req, res) => {
  res.status(404).json({
    success: false,
    message: 'API endpoint not found'
  });
});

app.listen(PORT, () => {
  console.log(`🚀 MARPOL Backend Server running on port ${PORT}`);
});
