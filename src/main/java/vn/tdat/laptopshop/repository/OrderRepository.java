package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tdat.laptopshop.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);
}
