import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import Avatar from '@mui/material/Avatar';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Divider from '@mui/material/Divider';
import List from '@mui/material/List';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import Typography from '@mui/material/Typography';
import { filterProducts, filterReset } from '@/store/apps/eCommerce/EcommerceSlice';
import { IconCircles, IconHanger, IconNotebook, IconMoodSmile } from '@tabler/icons-react';

const ProductFilter = () => {
  const dispatch = useDispatch();
  const active = useSelector((state) => state.ecommerceReducer.filters);
  const customizer = useSelector((state) => state.customizer);
  const br = `${customizer.borderRadius}px`;

  const filterCategory = [
    {
      id: 1,
      filterbyTitle: 'Filter by Category',
    },
    {
      id: 2,
      name: 'All',
      sort: 'All',
      icon: IconCircles,
    },
    {
      id: 3,
      name: 'Book',
      sort: 'book',
      icon: IconHanger,
    },
    {
      id: 9,
      name: 'DVD',
      sort: 'dvd',
      icon: IconNotebook,
    },
    {
      id: 10,
      name: 'CD',
      sort: 'cd',
      icon: IconMoodSmile,
    },
  ];

  return (
    <>
      <List>
        {/* ------------------------------------------- */}
        {/* Category filter */}
        {/* ------------------------------------------- */}
        {filterCategory.map((filter) => {
          if (filter.filterbyTitle) {
            return (
              <Typography
                variant="subtitle2"
                key={filter.id}
                sx={{
                  fontWeight: 600,
                  px: 3,
                  mt: 2,
                  pb: 2
                }}
              >
                {filter.filterbyTitle}
              </Typography>
            );
          } else {
            return (
              <ListItemButton
                sx={{ mb: 1, mx: 3, borderRadius: br }}
                selected={active.category === `${filter.sort}`}
                onClick={() => dispatch(filterProducts({ category: `${filter.sort}` }))}
                key={filter.id}
              >
                <ListItemIcon sx={{ minWidth: '30px' }}>
                  <filter.icon stroke="1.5" size="19" />
                </ListItemIcon>
                <ListItemText>{filter.name}</ListItemText>
              </ListItemButton>
            );
          }
        })}

        <Divider />

        {/* ------------------------------------------- */}
        {/* Reset */}
        {/* ------------------------------------------- */}
        <Box sx={{ p: 3 }}>
          <Button variant="contained" onClick={() => dispatch(filterReset())} fullWidth>
            Reset Filters
          </Button>
        </Box>
      </List>
    </>
  );
};

export default ProductFilter;
