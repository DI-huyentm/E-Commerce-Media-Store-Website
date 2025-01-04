import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api/v1';

export const fetchProducts = async (page) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/media?page=${page}`);
    return response.data.result.mediaPage;
  } catch (error) {
    console.error('Error fetching products:', error);
    throw error;
  }
};