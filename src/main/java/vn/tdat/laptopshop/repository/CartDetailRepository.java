package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.CartDetail;
import vn.tdat.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);
    
}
