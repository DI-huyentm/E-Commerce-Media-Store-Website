'use client';
import React, { useEffect, useState } from 'react';
import { usePathname } from 'next/navigation';
import Link from 'next/link';

// MUI Elements
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import Chip from '@mui/material/Chip';
import Divider from '@mui/material/Divider';
import Fab from '@mui/material/Fab';
import Grid from '@mui/material/Grid2';
import Rating from '@mui/material/Rating';
import Stack from '@mui/material/Stack';
import Typography from '@mui/material/Typography';
import { useTheme } from '@mui/material/styles';

import { useDispatch, useSelector } from 'react-redux';
import { fetchProducts, addToCart, selectProductByIndex } from '@/store/apps/eCommerce/EcommerceSlice';
import { IconCheck, IconMinus, IconPlus } from '@tabler/icons-react';
import AlertCart from '../productCart/AlertCart';
import { createSelector } from 'reselect';


const ProductDetail = () => {
  const theme = useTheme();
  const dispatch = useDispatch();
  const router = usePathname();

  const getTitle = router.split('/').pop();

  // Get Product
  useEffect(() => {
    dispatch(fetchProducts());
  }, [dispatch]);

  // // Get Products
  //  
    // Get Products
  const product = useSelector(selectProductByIndex(getTitle - 1));



  //const product = useSelector((state) => state.ecommerceReducer.products?.result?.mediaPage?.content || [getTitle]);
  // Find the product based on ID or index
  //const product = products.find(p => p.id === getTitle) || null;
  //set qty
  const [count, setCount] = useState(1);
//console.log('Product data:', products);

  // for alert when added something to cart
  const [cartalert, setCartalert] = React.useState(false);

  const handleClick = () => {
    setCartalert(true);
  };

  const handleClose = (reason) => {
    if (reason === 'clickaway') {
      return;
    }
    setCartalert(false);
  };
  
  return (
  <Box p={2}>
    {product ? (
      <>
        <Box display="flex" alignItems="center">
            {/* ------------------------------------------- */}
            {/* Badge and category */}
            {/* ------------------------------------------- */}
            <Chip label="In Stock" color="success" size="small" />
            <Typography color="textSecondary" variant="caption" ml={1} textTransform="capitalize">
              {product?.category}
            </Typography>
          </Box>
          {/* ------------------------------------------- */}
          {/* Title and description */}
          {/* ------------------------------------------- */}
          <Typography fontWeight="600" variant="h4" mt={1}>
            {product?.title}
          </Typography>
          <Typography variant="subtitle2" mt={1} color={theme.palette.text.secondary}>
            {product?.description}
          </Typography>
          {/* ------------------------------------------- */}
          {/* Price */}
          {/* ------------------------------------------- */}
          <Typography mt={2} variant="h4" fontWeight={600}>
            <Box
              component={'small'}
              color={theme.palette.text.secondary}
              sx={{ textDecoration: 'line-through' }}
            >
            </Box>{' '}
            {product.price}đ
          </Typography>
          {/* ------------------------------------------- */}
          {/* Ratings */}
          {/* ------------------------------------------- */}
          <Stack direction={'row'} alignItems="center" gap="10px" mt={2} pb={3}>
          </Stack>
          <Divider />
          {/* ------------------------------------------- */}
          {/* Quantity in Stock, Weight */}
          {/* ------------------------------------------- */}
          <Box display="flex" justifyContent="space-between" mt={2}>
            <Typography variant="body2" color="textSecondary">
              Quantity in Stock: {product.quantityInStock}
            </Typography>
          </Box>
          <Divider />
          {/* ------------------------------------------- */}
          {/* Additional Information */}
          {/* ------------------------------------------- */}
          <Box mt={3}>
            <Typography variant="h6" fontWeight="600">Additional Information</Typography>
            <Box mt={2}>
              <Typography variant="body2" color="textSecondary">
                Authors: {product.authors}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Publisher: {product.publisher}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Publication Date: {product.publicationDate}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Pages: {product.pages}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Language: {product.language}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Type: {product.type}
              </Typography>
              <Typography variant="body2" color="textSecondary">
              Weight: {product.weight} kg
            </Typography>
            </Box>
          </Box>
          <Divider />
          {/* ------------------------------------------- */}
          {/* Qty */}
          {/* ------------------------------------------- */}
          <Stack direction="row" alignItems="center" pb={5} mt={2}>
            <Typography variant="h6" mr={4}>
              QTY:
            </Typography>
            <Box>
              <ButtonGroup size="small" color="secondary" aria-label="small button group">
                <Button key="one" onClick={() => setCount(count < 2 ? count : count - 1)}>
                  <IconMinus size="1.1rem" />
                </Button>
                <Button key="two">{count}</Button>
                <Button key="three" onClick={() => setCount(count + 1)}>
                  <IconPlus size="1.1rem" />
                </Button>
              </ButtonGroup>
            </Box>
          </Stack>
          <Divider />
          {/* ------------------------------------------- */}
          {/* Buttons */}
          {/* ------------------------------------------- */}
          <Grid container spacing={2} mt={3}>
            <Grid
              size={{
                xs: 12,
                lg: 4,
                md: 6
              }}
            >
              <Button
                color="primary"
                size="large"
                fullWidth
                component={Link}
                variant="contained"
                href="/apps/ecommerce/checkout"
                onClick={() => dispatch(addToCart(product))}
              >
                Buy Now
              </Button>
            </Grid>
            <Grid
              size={{
                xs: 12,
                lg: 4,
                md: 6
              }}
            >
              <Button
                color="error"
                size="large"
                fullWidth
                variant="contained"
                onClick={() => dispatch(addToCart(product)) && handleClick()}
              >
                Add to Cart
              </Button>
            </Grid>
          </Grid>
          <Typography color="textSecondary" variant="body1" mt={4}>
            Dispatched in 2-3 weeks
          </Typography>
          <Link href="/" color="inherit">
            Why the longer time for delivery?
          </Link>
          {/* ------------------------------------------- */}
          {/* Alert When click on add to cart */}
          {/* ------------------------------------------- */}
          <AlertCart handleClose={handleClose} openCartAlert={cartalert} />
        </>
      ) : (
        'No product'
      )}
    </Box>
);

};

export default ProductDetail;
