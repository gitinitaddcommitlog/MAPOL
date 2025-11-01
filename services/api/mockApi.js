// Mock API for GitHub Pages static deployment
export const mockApi = {
  async submitForm(formData) {
    // Simulate API delay
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    return {
      success: true,
      message: 'Form submitted successfully (Mock)',
      data: {
        ...formData,
        submissionId: 'MOCK-' + Date.now(),
        timestamp: new Date().toISOString()
      }
    };
  },

  async getReports() {
    await new Promise(resolve => setTimeout(resolve, 500));
    
    return {
      success: true,
      data: [
        {
          id: 1,
          type: 'Annex V - Garbage Record Book',
          status: 'Completed',
          date: '2024-01-15',
          vessel: 'Ocean Guardian',
          wasteType: 'Plastic',
          quantity: '125 kg'
        },
        {
          id: 2,
          type: 'Annex I - Oil Record Book',
          status: 'Pending',
          date: '2024-01-16',
          vessel: 'Sea Explorer',
          wasteType: 'Oil',
          quantity: '50 liters'
        }
      ]
    };
  },

  async checkHealth() {
    return {
      success: true,
      message: 'Mock API - Backend simulation',
      timestamp: new Date().toISOString()
    };
  }
};
