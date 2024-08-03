package vn.tdat.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.tdat.laptopshop.domain.Role;

@Repository
public interface RoleRepositoty extends JpaRepository<Role, Long> {
    Role findByName(String name);

}
