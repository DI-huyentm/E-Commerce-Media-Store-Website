'use client';
import React, { useEffect, useState } from 'react';
import Box from '@mui/material/Box';
import { useDispatch, useSelector } from 'react-redux';
import { usePathname, useSearchParams } from 'next/navigation';

//fetch product
import { fetchProducts } from '@/store/apps/eCommerce/EcommerceSlice';
import Image from 'next/image';

const ProductCarousel = () => {
  const [product, setProduct] = useState(null);
  const dispatch = useDispatch();
  const pathName = usePathname();
  const searchParams = useSearchParams();
  const getTitle = pathName.split('/').pop();

  // Get Product from API
  useEffect(() => {
    dispatch(fetchProducts());
  }, [dispatch, pathName, searchParams]);

  // Get the product based on the title
  const productData = useSelector((state) => state.ecommerceReducer.products?.result?.mediaPage?.content[getTitle - 1]);

  // Set product for the component
  useEffect(() => {
    setProduct(productData);
  }, [productData]);

  const getProductImage = product ? product.imageUrl : '';

  return (
    <Box>
      {product && (
        <Box>
          <Image
            src={getProductImage}
            alt={getProductImage}
            width={500}
            height={500}
            style={{ borderRadius: '5px', width: '100%' }}
          />
        </Box>
      )}
    </Box>
  );
};

export default ProductCarousel;
