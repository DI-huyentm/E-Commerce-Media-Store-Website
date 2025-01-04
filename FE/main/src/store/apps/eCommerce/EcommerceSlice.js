import axios from '../../../utils/axios';
import { filter, map } from 'lodash';
import { createSlice } from '@reduxjs/toolkit';
import { createSelector } from 'reselect';

const selectEcommerceReducer = (state) => state.ecommerceReducer;

export const selectProducts = createSelector(
  [selectEcommerceReducer],
  (EcommerceReducer) => EcommerceReducer.products || []
);

// export const selectProductByTitle = (title) => createSelector(
//   [selectProducts],
//   (products) => products.find((product) => product.title === title)
// );
export const selectProductByIndex = (index) =>
  createSelector(
    [selectProducts],
    (products) => products[index]
  );

const initialState = {
  products: [],
  productSearch: '',
  sortBy: 'newest',
  cart: {
    result: {
      cart: {
        cartMediaList: []
      }
    }
  },
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
    //  SORT  PRODUCTS
    sortByProducts(state, action) {
      state.sortBy = action.payload;
    },
    //  FILTER PRODUCTS
    filterProducts(state, action) {
      state.filters.category = action.payload.category;
    },
    //  FILTER Reset
    filterReset(state) {
      state.filters.category = 'All';
      state.sortBy = 'newest';
    },
    // ADD TO CART
    addToCart: (state, action) => {
      const product = action.payload;
      const existingProduct = state.cart.result.cart.cartMediaList.find((item) => item.id === product.id);

      if (existingProduct) {
        // Cập nhật số lượng nếu sản phẩm đã tồn tại trong giỏ hàng
        existingProduct.quantity += product.quantity || 1; // Nếu có quantity từ API, dùng quantity đó, nếu không thì tăng thêm 1
      } else {
        // Thêm mới sản phẩm vào giỏ với quantity mặc định là 1
        state.cart.result.cart.cartMediaList.push({ ...product, quantity: product.quantity || 1 });
      }
    },

    removeFromCart: (state, action) => {
      const product = action.payload;
      state.cart.result.cart.cartMediaList = state.cart.result.cart.cartMediaList.filter((item) => item.id !== product.id);
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
  removeFromCart,
  filterReset,
} = EcommerceSlice.actions;

// Fetch tất cả sản phẩm
export const fetchProducts = () => async (dispatch) => {
  try {
    const response = await axios.get('http://localhost:8080/api/v1/media'); // Không có phân trang
    dispatch(getProducts(response.data)); // Cập nhật danh sách sản phẩm vào state
  } catch (error) {
    dispatch(hasError(error.message));
  }
};

export default EcommerceSlice.reducer;
