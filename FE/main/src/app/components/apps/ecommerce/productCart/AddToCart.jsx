import Avatar from '@mui/material/Avatar';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import IconButton from '@mui/material/IconButton';
import Stack from '@mui/material/Stack';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Typography from '@mui/material/Typography';
import Link from 'next/link';
import { IconMinus, IconPlus, IconTrash } from '@tabler/icons-react';
import { useDispatch, useSelector } from 'react-redux';
//import { increment, deleteCart, decrement } from '@/store/apps/eCommerce/EcommerceSlice';
import Image from 'next/image';
//import { deleteCart, incrementItemQuantity, decrementItemQuantity } from '@/store/apps/eCommerce/CartManage';  // Nhập hàm delete
import { incrementItemQuantity, decrementItemQuantity, selectCartItems } from '@/store/apps/eCommerce/CartManage';
const AddToCart = () => {
  const dispatch = useDispatch();

  // Get Products
  const cart = useSelector(selectCartItems);
  console.log(cart);

  const handleIncrement = (product) => {
    incrementItemQuantity(dispatch, product);
  };

  const handleDecrement = (product) => {
    decrementItemQuantity(dispatch, product);
  };


  return (
    (<Box>
      {cart.length > 0 ? (
        <>
          <Box>
            <TableContainer sx={{ minWidth: 350 }}>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Product</TableCell>

                    <TableCell align="left">Quantity</TableCell>
                    <TableCell align="right">Price</TableCell>
                  </TableRow>
                </TableHead>

                <TableBody>
                  {cart.map((product) => (
                    <TableRow key={product.id}>
                      {/* ------------------------------------------- */}
                      {/* Product Image & Title */}
                      {/* ------------------------------------------- */}
                      <TableCell>
                        <Stack
                          direction="row"
                          sx={{
                            alignItems: "center",
                            gap: 2
                          }}>
                          <Avatar
                            src={product.media?.imageUrl}
                            alt={product.media?.title}
                            sx={{
                              borderRadius: '10px',
                              height: '80px',
                              width: '90px',
                            }}
                          />
                          <Box>
                            <Typography variant="h6">{product.media?.title}</Typography>{' '}
                            <Typography color="textSecondary" variant="body1">
                              {product.category}
                            </Typography>
                            <IconButton
                              size="small"
                              color="error"
                              onClick={() => dispatch(deleteCart(product.id))}
                            >
                              <IconTrash size="1rem" />
                            </IconButton>
                          </Box>
                        </Stack>
                      </TableCell>

                      <TableCell>
                        <ButtonGroup size="small" color="success" aria-label="small button group">
                          <Button onClick={() => handleDecrement(product.id)} disabled={product.quantity < 2}>
                            <IconMinus stroke={1.5} size="0.8rem" />
                          </Button>
                          <Button>{product.quantity}</Button>
                          <Button onClick={() => handleIncrement(product.id)}>
                            <IconPlus stroke={1.5} size="0.8rem" />
                          </Button>
                        </ButtonGroup>
                      </TableCell>
                      <TableCell align="right">
                        <Typography variant="h6">{product.media?.price}đ</Typography>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Box>
        </>
      ) : (
        <Box
          sx={{
            textAlign: "center",
            mb: 3
          }}>
          <Image src='/images/products/empty-shopping-cart.svg' alt="cart" width={200} height={200} />
          <Typography variant="h5" sx={{
            mb: 2
          }}>
            Cart is Empty
          </Typography>
          <Button component={Link} href="/apps/ecommerce/shop" variant="contained">
            Go back to Shopping
          </Button>
        </Box>
      )}
    </Box>)
  );
};

export default AddToCart;
