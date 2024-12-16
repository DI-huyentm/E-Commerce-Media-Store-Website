package vn.hust.aims.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hust.aims.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String name, String description);

    List<Product> findByCategoryIgnoreCaseAndBrandIgnoreCase(String category, String brand);

    List<Product> findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCaseAndCategoryIgnoreCaseAndBrandIgnoreCase(
            String name, String description, String category, String brand);
}
