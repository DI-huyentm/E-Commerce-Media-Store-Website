package vn.hust.aims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;
import vn.hust.aims.repository.ProductRepository;
import vn.hust.aims.entity.Product;
import vn.hust.aims.exception.ResourceNotFoundException;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    // 1. Sắp xếp sản phẩm với phân trang
    public Page<Product> getSortedProducts(String sortBy, String direction, int page, int size) {
        Sort sort = direction.equalsIgnoreCase("asc") ? Sort.by(sortBy).ascending() : Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        return productRepository.findAll(pageable);
    }

    // 2. Xem chi tiết sản phẩm
    public Product getProductById(Long id) {
        Optional<Product> productOpt = productRepository.findById(id);
        if (!productOpt.isPresent()) {
            throw new ResourceNotFoundException("Product not found with id: " + id);
        }
        return productOpt.get();
    }

    // 3. Tìm kiếm sản phẩm
    public List<Product> searchProducts(String keyword) {
        return productRepository.findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(keyword, keyword);
    }

    /// Dùng cho việc thêm, sửa, xóa sản phẩm (Duong lam)

    public List<Product> filterProducts(String keyword, String category, String brand) {
        if (keyword != null && !keyword.isEmpty()) {
            return productRepository.findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(keyword, keyword);
        } else if (category != null && brand != null) {
            return productRepository.findByCategoryIgnoreCaseAndBrandIgnoreCase(category, brand);
        } else {
            return productRepository.findAll();
        }
    }
}
