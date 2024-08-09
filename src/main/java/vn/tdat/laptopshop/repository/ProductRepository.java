package vn.tdat.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tdat.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();
}
