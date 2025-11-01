import express from 'express';
import { formController } from '../controllers/formController.js';

const router = express.Router();

// Form submission routes
router.post('/submit', formController.submitForm);
router.get('/submissions', formController.getSubmissions);
router.get('/submissions/:id', formController.getSubmission);
router.get('/statistics', formController.getStatistics);

export default router;
