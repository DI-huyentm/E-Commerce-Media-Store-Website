import React, { useEffect } from 'react';
import { filter, orderBy } from 'lodash';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import CardContent from '@mui/material/CardContent';
import Fab from '@mui/material/Fab';
import Grid from '@mui/material/Grid2';
import Rating from '@mui/material/Rating';
import Skeleton from '@mui/material/Skeleton';
import Stack from '@mui/material/Stack';
import Tooltip from '@mui/material/Tooltip';
import Typography from '@mui/material/Typography';
import useMediaQuery from '@mui/material/useMediaQuery';
import Link from 'next/link';
import { useDispatch, useSelector } from 'react-redux';
// import { fetchProducts, addToCart, filterReset } from '@/store/apps/eCommerce/EcommerceSlice';
import ProductSearch from './ProductSearch';
import { IconBasket, IconMenu2 } from '@tabler/icons-react';
import AlertCart from '../productCart/AlertCart';
import BlankCard from '../../../shared/BlankCard';
import Image from 'next/image';
import { fetchProducts, selectProducts } from '@/store/apps/eCommerce/EcommerceSlice';

import { addItemToCartAsync } from '@/store/apps/eCommerce/CartManage';

const ProductList = () => {
  const lgUp = useMediaQuery((theme) => theme.breakpoints.up('lg'));
  const dispatch = useDispatch();
  // const products = useSelector((state) => state.ecommerce.products);
  const products = useSelector(selectProducts);

  useEffect(() => {
    dispatch(fetchProducts()); // Lấy tất cả sản phẩm mà không phân trang
  }, [dispatch]);

  const getVisibleProduct = (products, sortBy, filters, search) => {
    if (sortBy === 'newest') {
      products = orderBy(products, ['created'], ['desc']);
    }
    if (sortBy === 'priceDesc') {
      products = orderBy(products, ['price'], ['desc']);
    }
    if (sortBy === 'priceAsc') {
      products = orderBy(products, ['price'], ['asc']);
    }
    if (sortBy === 'discount') {
      products = orderBy(products, ['discount'], ['desc']);
    }

    if (filters.category !== 'All') {
      products = products.filter((_product) => _product.category.includes(filters.category));
    }

<<<<<<< HEAD
=======


    //FILTER PRODUCTS BY Search
>>>>>>> 0124caa39083dfd4e7d770e4f4d4f9e0f82c4c57
    if (search !== '') {
      products = products.filter((_product) =>
        _product.title.toLocaleLowerCase().includes(search.toLocaleLowerCase()),
      );
    }
<<<<<<< HEAD
=======

>>>>>>> 0124caa39083dfd4e7d770e4f4d4f9e0f82c4c57
    return products;
  };

  const getProducts = getVisibleProduct(
    products,
    useSelector((state) => state.ecommerce.sortBy),
    useSelector((state) => state.ecommerce.filters),
    useSelector((state) => state.ecommerce.productSearch),
  );

  const handleAddToCart = (product) => {
    dispatch(addItemToCartAsync(product));
  };

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

  const [isLoading, setLoading] = React.useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(false);
    }, 1000);

    return () => clearTimeout(timer);
  }, []);

  return (
    <Box>
      <Stack
        direction="row"
        sx={{
          justifyContent: 'space-between',
          pb: 3,
        }}
      >
        {lgUp ? (
          <Typography variant="h5">Products</Typography>
        ) : (
          <Fab onClick={onClick} color="primary" size="small">
            <IconMenu2 width="16" />
          </Fab>
        )}
        <Box>
          <ProductSearch />
        </Box>
      </Stack>
      <Grid container spacing={3}>
        {getProducts.length > 0 ? (
          <>
            {getProducts.map((product) => (
              <Grid
                key={product.id}
                size={{
                  xs: 12,
                  lg: 4,
                  md: 4,
                  sm: 6,
                }}
                sx={{
                  display: 'flex',
                  alignItems: 'stretch',
                }}
              >
                {isLoading ? (
                  <Skeleton
                    variant="rectangular"
                    width={270}
                    height={300}
                    sx={{
                      borderRadius: (theme) => theme.shape.borderRadius / 5,
                    }}
                  />
                ) : (
                  <BlankCard className="hoverCard">
                    <Typography component={Link} href={`/apps/ecommerce/detail/${product.id}`}>
                      <Image
                        src={product.imageUrl}
                        alt="img"
                        width={250}
                        height={268}
                        style={{ width: '100%' }}
                      />
                    </Typography>
                    <Tooltip title="Add To Cart">
                      <Fab
                        size="small"
                        color="primary"
                        onClick={() => handleAddToCart(product)}
                        sx={{
                          bottom: '75px',
                          right: '15px',
                          position: 'absolute',
                        }}
                      >
                        <IconBasket size="16" />
                      </Fab>
                    </Tooltip>
                    <CardContent sx={{ p: 3, pt: 2 }}>
                      <Typography variant="h6">{product.title}</Typography>
                      <Stack
                        direction="row"
                        sx={{
                          alignItems: 'center',
                          justifyContent: 'space-between',
                          mt: 1,
                        }}
                      >
                        <Stack direction="row" sx={{ alignItems: 'center' }}>
                          <Typography variant="h6">{product.price}đ</Typography>
                        </Stack>
<<<<<<< HEAD
                        <Typography variant="h6">{product.quantityInStock}</Typography>
=======
                        {/* <Rating name="read-only" size="small" value={product.rating} readOnly /> */}
>>>>>>> 0124caa39083dfd4e7d770e4f4d4f9e0f82c4c57
                      </Stack>
                    </CardContent>
                  </BlankCard>
                )}
                <AlertCart handleClose={handleClose} openCartAlert={cartalert} />
              </Grid>
            ))}
          </>
        ) : (
          <Grid
            size={{
              xs: 12,
              lg: 12,
              md: 12,
              sm: 12,
            }}
          >
            <Box
              sx={{
                textAlign: 'center',
                mt: 6,
              }}
            >
              <Image src="/images/products/empty-shopping-cart.svg" alt="cart" width={200} height={100} />
              <Typography variant="h2">There is no Product</Typography>
              <Typography variant="h6" sx={{ mb: 3 }}>
                The Product you are searching is no longer available.
              </Typography>
              <Button variant="contained" onClick={() => dispatch(filterReset())}>
                Try Again
              </Button>
            </Box>
          </Grid>
        )}
      </Grid>
    </Box>
  );
};

export default ProductList;
