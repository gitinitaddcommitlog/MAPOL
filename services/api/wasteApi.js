const API_BASE = 'http://localhost:5000/api';

// Generic API request function
async function apiRequest(endpoint, options = {}) {
  const url = `${API_BASE}${endpoint}`;
  
  const config = {
    headers: {
      'Content-Type': 'application/json',
      ...options.headers,
    },
    ...options,
  };

  if (config.body && typeof config.body === 'object') {
    config.body = JSON.stringify(config.body);
  }

  try {
    const response = await fetch(url, config);
    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.message || `HTTP error! status: ${response.status}`);
    }

    return data;
  } catch (error) {
    console.error('API request failed:', error);
    throw error;
  }
}

export const wasteApi = {
  // Submit MARPOL form
  async submitForm(formData) {
    return apiRequest('/forms/submit', {
      method: 'POST',
      body: formData,
    });
  },

  // Get all form submissions
  async getSubmissions() {
    return apiRequest('/forms/submissions');
  },

  // Get submission by ID
  async getSubmission(id) {
    return apiRequest(`/forms/submissions/${id}`);
  },

  // Get dashboard statistics
  async getStatistics() {
    return apiRequest('/forms/statistics');
  },

  // Health check
  async healthCheck() {
    return apiRequest('/health');
  },
};

export default wasteApi;
