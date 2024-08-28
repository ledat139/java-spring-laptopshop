package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.tdat.laptopshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
