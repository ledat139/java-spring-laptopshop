package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tdat.laptopshop.domain.CartDetail;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

}
