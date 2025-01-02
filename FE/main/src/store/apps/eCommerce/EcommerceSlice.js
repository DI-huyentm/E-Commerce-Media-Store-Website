import axios from '../../../utils/axios';
import { filter, map } from 'lodash';
import { createSlice } from '@reduxjs/toolkit';

//const API_URL = '/api/data/eCommerce/ProductsData';

const initialState = {
  products: [],
  productSearch: '',
  sortBy: 'newest',
  cart: [],
  total: 0,
  filters: {
    category: 'All',
  },
  error: ''
};

export const EcommerceSlice = createSlice({
  name: 'ecommerce',
  initialState,
  reducers: {
    // HAS ERROR
    hasError(state, action) {
      state.error = action.payload;
    },
    // GET PRODUCTS
    getProducts: (state, action) => {
      state.products = action.payload;
    },
    SearchProduct: (state, action) => {
      state.productSearch = action.payload;
    },
    setVisibilityFilter: (state, action) => {
      state.currentFilter = action.payload;
    },
    // SORT PRODUCTS
    sortByProducts(state, action) {
      state.sortBy = action.payload;
    },
    // FILTER PRODUCTS
    filterProducts(state, action) {
      state.filters.category = action.payload.category;
    },
    // FILTER Reset
    filterReset(state) {
      state.filters.category = 'All';
      state.filters.color = 'All';
      state.filters.gender = 'All';
      state.filters.price = 'All';
      state.sortBy = 'newest';
    },
    // ADD TO CART
    addToCart(state, action) {
      const product = action.payload;
      state.cart = [...state.cart, product];
    },
    // qty increment
    increment(state, action) {
      const productId = action.payload;
      const updateCart = map(state.cart, (product) => {
        if (product.id === productId) {
          return {
            ...product,
            qty: product.qty + 1,
          };
        }
        return product;
      });

      state.cart = updateCart;
    },
    // qty decrement
    decrement(state, action) {
      const productId = action.payload;
      const updateCart = map(state.cart, (product) => {
        if (product.id === productId) {
          return {
            ...product,
            qty: product.qty - 1,
          };
        }
        return product;
      });

      state.cart = updateCart;
    },
    // delete Cart
    deleteCart(state, action) {
      const updateCart = filter(state.cart, (item) => item.id !== action.payload);
      state.cart = updateCart;
    },
  },
});

export const {
  hasError,
  getProducts,
  SearchProduct,
  setVisibilityFilter,
  sortByProducts,
  filterProducts,
  increment,
  deleteCart,
  decrement,
  addToCart,
  filterReset,
} = EcommerceSlice.actions;

export const fetchProducts = () => async (dispatch) => {
  try {
    const response = await axios.get('http://localhost:8080/api/v1/media');
    console.log(response.data);  // Kiểm tra dữ liệu trả về từ API
    dispatch(getProducts(response.data));  // Dispatch với dữ liệu nhận được
  } catch (error) {
    dispatch(hasError(error));
    console.error("API Error: ", error);  // In lỗi API nếu có
  }
};


export default EcommerceSlice.reducer;
