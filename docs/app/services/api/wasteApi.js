import { mockApi } from './mockApi.js';

const API_BASE_URL = 'http://localhost:5000/api';
const IS_PRODUCTION = import.meta.env.PROD;

export const wasteApi = {
  async submitForm(formData) {
    // Use mock API in production (GitHub Pages)
    if (IS_PRODUCTION) {
      return await mockApi.submitForm(formData);
    }

    try {
      const response = await fetch(`${API_BASE_URL}/forms`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      return await response.json();
    } catch (error) {
      console.error('API Error, using mock data:', error);
      return await mockApi.submitForm(formData);
    }
  },

  async getReports() {
    // Use mock API in production (GitHub Pages)
    if (IS_PRODUCTION) {
      return await mockApi.getReports();
    }

    try {
      const response = await fetch(`${API_BASE_URL}/reports`);
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      return await response.json();
    } catch (error) {
      console.error('API Error, using mock data:', error);
      return await mockApi.getReports();
    }
  },

  async checkHealth() {
    if (IS_PRODUCTION) {
      return await mockApi.checkHealth();
    }

    try {
      const response = await fetch(`${API_BASE_URL}/health`);
      return await response.json();
    } catch (error) {
      console.error('Health check failed, using mock:', error);
      return await mockApi.checkHealth();
    }
  }
};
