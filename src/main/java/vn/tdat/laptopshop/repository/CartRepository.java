package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.User;

import java.util.List;


@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
