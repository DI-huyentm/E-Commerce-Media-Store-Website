import React, { useState } from 'react';
import { IconShoppingCart, IconX } from '@tabler/icons-react';
import { Box, Typography, Badge, Drawer, IconButton, Button, Stack } from '@mui/material';
import { useSelector } from 'react-redux';
import Link from 'next/link';
import CartItems from './CartItem';
import { selectCartItems, selectCartTotal } from '@/store/apps/eCommerce/CartManage';
import { sum } from 'lodash';

// const Cart = () => {
//   // Get Products
//   const cart = useSelector((state) => state.ecommerceReducer.cart.result?.cart?.cartMediaList || []);
//   const bcount = cart.length > 0 ? cart.length : '0';

//   const checkout = useSelector((state) => state.ecommerceReducer.cart);
//   const total = sum(checkout.map((product) => product.price * product.quantity));

//   const [showDrawer, setShowDrawer] = useState(false);
//   const handleDrawerClose = () => {
//     setShowDrawer(false);
//   };
const Cart = () => {
  // Get Products
  const cart = useSelector(selectCartItems);
  const bcount = cart.length > 0 ? cart.length : '0';

  const total = useSelector(selectCartTotal);

  const [showDrawer, setShowDrawer] = useState(false);
  const handleDrawerClose = () => {
    setShowDrawer(false);
  };

  return (
    <Box>
      <IconButton
        size="large"
        color="inherit"
        onClick={() => setShowDrawer(true)}
        sx={{
          color: 'text.secondary',
          ...(showDrawer && {
            color: 'primary.main',
          }),
        }}
      >
        <Badge color="error" badgeContent={bcount}>
          <IconShoppingCart size="21" stroke="1.5" />
        </Badge>
      </IconButton>
      {/* ------------------------------------------- */}
      {/* Cart Sidebar */}
      {/* ------------------------------------------- */}
      <Drawer
        anchor="right"
        open={showDrawer}
        onClose={handleDrawerClose}
        PaperProps={{ sx: { maxWidth: '500px' } }}
      >
        <Box
          sx={{
            display: "flex",
            alignItems: "center",
            p: 3,
            pb: 0,
            justifyContent: "space-between"
          }}
        >
          <Typography variant="h5" sx={{ fontWeight: 600 }}>
            Shopping Cart
          </Typography>
          <IconButton
            color="inherit"
            sx={{ color: (theme) => theme.palette.grey.A200 }}
            onClick={handleDrawerClose}
          >
            <IconX size="1rem" />
          </IconButton>
        </Box>
        {/* ------------------------------------------- */}
        {/* Cart Content */}
        {/* ------------------------------------------- */}
        <Box sx={{ p: 3 }}>
          <CartItems />
        </Box>
        {/* ------------------------------------------- */}
        {/* Checkout */}
        {/* ------------------------------------------- */}
        <Box sx={{ p: 3 }}>
          <Stack direction="row" justifyContent="space-between" mb={3}>
            <Typography variant="subtitle2" sx={{ fontWeight: 400 }}>
              Total
            </Typography>
            <Typography variant="subtitle2" sx={{ fontWeight: 600 }}>
              {total.toFixed(2)}đ
            </Typography>
          </Stack>
          <Button
            fullWidth
            component={Link}
            href="/apps/ecommerce/checkout"
            variant="contained"
            color="primary"
          >
            Checkout
          </Button>
        </Box>
      </Drawer>
    </Box>
  );
};

export default Cart;