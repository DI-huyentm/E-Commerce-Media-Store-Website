import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080//api/v1';

export const createOrder = async (orderData) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/place-order`, orderData);
    return response.data;
  } catch (error) {
    console.error('Error creating order:', error);
    throw error;
  }
};