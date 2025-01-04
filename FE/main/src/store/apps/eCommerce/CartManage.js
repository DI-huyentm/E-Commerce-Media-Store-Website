import axios from 'axios';
import { createSelector } from 'reselect';
import { addToCart, removeFromCart } from '@/store/apps/eCommerce/EcommerceSlice';

const cartId = 1; // Giỏ hàng có id là 1

const selectEcommerceReducer = (state) => state.ecommerce;

export const selectCartItems = createSelector(
  [selectEcommerceReducer],
  (ecommerce) => ecommerce.cart.result?.cart.cartMediaList || []
);

export const selectCartTotal = createSelector(
  [selectCartItems],
  (cartItems) => cartItems.reduce((total, item) => {
    if (item.media && item.media.price) {
      return total + item.media.price * item.quantity;
    }
    return total;
  }, 0)
);

export const fetchCart = async (dispatch) => {
  try {
    const response = await axios.get(`http://localhost:8080/api/v1/cart/${cartId}`); // Không có phân trang
    if (response.data.code === '200' && response.data.result && response.data.result.cart && response.data.result.cart.cartMediaList) {
      response.data.result.cart.cartMediaList.forEach((item) => {
        dispatch(addToCart(item)); // Cập nhật giỏ hàng
      });
    } else {
      console.error('Error fetching cart: Invalid response structure', response.data);
    }
  } catch (error) {
    console.error('Error fetching cart', error);
  }
};

export const addItemToCartAsync = async (dispatch, product) => {
  try {
    const response = await axios.post(`http://localhost:8080/api/v1/cart/${cartId}/cart-media`, {
      mediaId: product.id,
      quantity: 1, // Bạn có thể thay đổi số lượng tùy theo yêu cầu
    });
    if (response.data.code === '200') {
      dispatch(addToCart({ ...product, quantity: 1 }));
    }
  } catch (error) {
    console.error('Error adding item to cart', error);
  }
};

export const removeItemFromCartAsync = async (dispatch, cartMediaId, product) => {
  try {
    const response = await axios.delete(`http://localhost:8080/api/v1/cart/${cartId}/cart-media/${cartMediaId}`);
    if (response.data.code === '200') {
      dispatch(removeFromCart(product)); // Xóa sản phẩm khỏi giỏ hàng
    }
  } catch (error) {
    console.error('Error removing item from cart', error);
  }
};
