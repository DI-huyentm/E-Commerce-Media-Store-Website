import { Badge, Box, Button, ButtonGroup, Drawer, IconButton, Stack, Typography } from '@mui/material';
import { IconMinus, IconPlus } from '@tabler/icons-react';
import React, { useEffect } from 'react';
import { decrementItemQuantity, fetchCart, incrementItemQuantity, selectCartItems } from '@/store/apps/eCommerce/CartManage';
import { useDispatch, useSelector } from 'react-redux';

import Avatar from '@mui/material/Avatar';
import Link from 'next/link';
import axios from 'axios';
import emptyCart from "/public/images/products/empty-shopping-cart.svg";

const CartItems = () => {
  const dispatch = useDispatch();
  const cart = useSelector(selectCartItems);

  useEffect(() => {
    dispatch(fetchCart());
  }, [dispatch]);

  const handleIncrement = async (product) => {
    if (!product.media || !product.media.id) {
      console.log("Error: media.id is missing for product:", product);
      return;
    }
    console.log("Increasing product quantity:", product);
    try {
      const response = await axios.post('/api/increment', { product });
      dispatch(incrementItemQuantity(response.data));
    } catch (error) {
      console.error('Error incrementing item quantity', error);
    }
  };

  const handleDecrement = async (product) => {
    if (!product.media || !product.media.id) {
      console.log("Error: media.id is missing for product:", product);
      return;
    }
    console.log("Decreasing product quantity:", product);
    try {
      const response = await axios.post('/api/decrement', { product });
      dispatch(decrementItemQuantity(response.data));
    } catch (error) {
      console.error('Error decrementing item quantity', error);
    }
  };

  return (
    <Box sx={{ px: 3 }}>
      {cart.length > 0 ? (
        <>
          {cart.map((product, index) => {
            if (!product || !product.media || !product.media.imageUrl || !product.media.title || isNaN(product.media.price)) {
              return null;
            }

            return (
              <Box key={`${product.id}-${index}`}>
                <Stack direction="row" spacing={2} sx={{ py: 3 }}>
                  <Avatar
                    src={product.media.imageUrl}
                    alt={product.media.title || 'No Title'}
                    sx={{
                      borderRadius: "10px",
                      height: "75px",
                      width: "95px",
                    }}
                  />
                  <Box>
                    <Typography variant="subtitle2" color="textPrimary" sx={{ fontWeight: 600 }}>
                      {product.media.title}
                    </Typography>
                    <Typography color="textSecondary" sx={{ fontSize: "12px" }}>
                      {product.media.category}
                    </Typography>
                    <Stack direction="row" spacing={2} sx={{ alignItems: "center", mt: "5px" }}>
                      <Typography variant="subtitle2" sx={{ fontWeight: "500" }}>
                        {isNaN(product.media.price * product.quantity) ? '0' : product.media.price * product.quantity}
                      </Typography>
                      <ButtonGroup size="small" aria-label="small button group">
                        <Button
                          color="success"
                          className="btn-xs"
                          variant="text"
                          onClick={() => handleDecrement(product)}
                          disabled={product.quantity < 2}
                        >
                          <IconMinus stroke={1.5} size="0.8rem" />
                        </Button>
                        <Button
                          color="inherit"
                          sx={{ bgcolor: "transparent", color: "text.secondary" }}
                          variant="text"
                        >
                          {product.quantity}
                        </Button>
                        <Button
                          color="success"
                          className="btn-xs"
                          variant="text"
                          onClick={() => handleIncrement(product)}
                        >
                          <IconPlus stroke={1.5} size="0.8rem" />
                        </Button>
                      </ButtonGroup>
                    </Stack>
                  </Box>
                </Stack>
              </Box>
            );
          })}
        </>
      ) : (
        <Box sx={{ textAlign: "center", mb: 3 }}>
          <img src={emptyCart} alt="cart" width={200} height={200} />
          <Typography variant="h5" sx={{ mb: 2 }}>
            Cart is Empty
          </Typography>
          <Button component={Link} href="/apps/ecommerce/shop" variant="contained" color="primary">
            Go to Shop
          </Button>
        </Box>
      )}
    </Box>
  );
};

export default CartItems;
