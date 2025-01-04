import React, { useEffect, useState } from 'react';

import { fetchProducts } from '../../api/ProductAPI'; // Đảm bảo bạn đã import đúng API

const ProductTableList = () => {
  const [products, setProducts] = useState([]); // Lưu trữ danh sách sản phẩm
  const [page, setPage] = useState(0); // Trang hiện tại
  const [rowsPerPage, setRowsPerPage] = useState(20); // Số lượng sản phẩm mỗi trang
  const [totalElements, setTotalElements] = useState(0); // Tổng số sản phẩm
  const [order, setOrder] = useState('asc');
  const [orderBy, setOrderBy] = useState('name');
  const [selected, setSelected] = useState([]);
  const [dense, setDense] = useState(false);
  const [search, setSearch] = useState('');
  const [rows, setRows] = useState([]); // Lưu trữ sản phẩm tìm kiếm

  const fetchData = async () => {
    try {
      console.log("Chdnfbhdsb");
      console.log(`Fetching data for page ${page + 1}`);
      const response = await fetch(`http://localhost:8080/api/v1/media?page=${page + 1}`);
      const result = await response.json();
      
      // Kiểm tra dữ liệu nhận được
      console.log("API response:", result);

      if (result && result.result && result.result.mediaPage) {
        const mediaPage = result.result.mediaPage;
        
        // Cố định rowsPerPage bằng pageSize từ API
        setRowsPerPage(mediaPage.pageable.pageSize); 
        console.log(result.result.mediaPage);

        setRows(mediaPage.content);  // Lưu dữ liệu vào state
        setTotalElements(mediaPage.totalElements);  // Lưu tổng số phần tử
      } else {
        console.error("No mediaPage found in API response.");
      }
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  // Gọi API khi trang thay đổi
  useEffect(() => {
    console.log("Current page value:", page);  // Kiểm tra giá trị của page
    fetchData();
  }, [page]);

  const handleSearch = (event) => {
    const filteredRows = products.filter((row) => {
      return row.title.toLowerCase().includes(event.target.value.toLowerCase());
    });
    setSearch(event.target.value);
    setRows(filteredRows); // Cập nhật kết quả tìm kiếm
  };

  const handleChangePage = (event, newPage) => {
    console.log("Changing page to:", newPage);
    setPage(newPage);
  };

  const handleChangeDense = (event) => {
    setDense(event.target.checked);
  };

  const handleRequestSort = (event, property) => {
    const isAsc = orderBy === property && order === 'asc';
    setOrder(isAsc ? 'desc' : 'asc');
    setOrderBy(property);
  };

  const isSelected = (name) => selected.indexOf(name) !== -1;

  // Avoid a layout jump when reaching the last page with empty rows.
  const emptyRows = page > 0 ? Math.max(0, (1 + page) * rowsPerPage - rows.length) : 0;

  return (
    <Box>
      <Box>
        <EnhancedTableToolbar
          numSelected={selected.length}
          search={search}
          handleSearch={handleSearch}
        />
        <Paper variant="outlined" sx={{ mx: 2, mt: 1 }}>
          <TableContainer>
            <Table sx={{ minWidth: 750 }} aria-labelledby="tableTitle" size={dense ? 'small' : 'medium'}>
              <EnhancedTableHead
                numSelected={selected.length}
                order={order}
                orderBy={orderBy}
                onSelectAllClick={handleSelectAllClick}
                onRequestSort={handleRequestSort}
                rowCount={rows.length}
              />
              <TableBody>
                {rows.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((row, index) => {
                  const isItemSelected = isSelected(row.title);
                  return (
                    <TableRow
                      hover
                      onClick={(event) => handleClick(event, row.title)}
                      role="checkbox"
                      aria-checked={isItemSelected}
                      tabIndex={-1}
                      key={row.title}
                      selected={isItemSelected}
                    >
                      {/* Các cột trong bảng */}
                    </TableRow>
                  );
                })}
                {emptyRows > 0 && (
                  <TableRow style={{ height: (dense ? 33 : 53) * emptyRows }}>
                    <TableCell colSpan={6} />
                  </TableRow>
                )}
              </TableBody>
            </Table>
          </TableContainer>
          <TablePagination
            rowsPerPageOptions={[rowsPerPage]} // Chỉ có một lựa chọn duy nhất vì đã cố định
            component="div"
            count={totalElements}
            rowsPerPage={rowsPerPage}
            page={page}
            onPageChange={handleChangePage}
          />
        </Paper>
      </Box>
    </Box>
  );
};

export default ProductTableList;
