import { FormModel } from '../models/FormModel.js';

export const formController = {
  // Submit a new MARPOL form
  async submitForm(req, res) {
    try {
      const formData = req.body;
      
      // Basic validation
      if (!formData.shipName || !formData.imoNumber) {
        return res.status(400).json({
          success: false,
          message: 'Ship name and IMO number are required'
        });
      }

      const result = await FormModel.createFormSubmission(formData);
      
      res.json({
        success: true,
        message: 'MARPOL form submitted successfully',
        data: result
      });
    } catch (error) {
      console.error('Form submission error:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to submit form',
        error: error.message
      });
    }
  },

  // Get all form submissions
  async getSubmissions(req, res) {
    try {
      const submissions = await FormModel.getAllSubmissions();
      res.json({
        success: true,
        data: submissions
      });
    } catch (error) {
      console.error('Get submissions error:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch submissions'
      });
    }
  },

  // Get submission by ID
  async getSubmission(req, res) {
    try {
      const { id } = req.params;
      const submission = await FormModel.getSubmissionById(id);
      
      if (!submission) {
        return res.status(404).json({
          success: false,
          message: 'Form submission not found'
        });
      }

      res.json({
        success: true,
        data: submission
      });
    } catch (error) {
      console.error('Get submission error:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch submission'
      });
    }
  },

  // Get dashboard statistics
  async getStatistics(req, res) {
    try {
      const stats = await FormModel.getStatistics();
      res.json({
        success: true,
        data: stats
      });
    } catch (error) {
      console.error('Get statistics error:', error);
      res.status(500).json({
        success: false,
        message: 'Failed to fetch statistics'
      });
    }
  }
};
