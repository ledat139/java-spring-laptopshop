package vn.tdat.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> inFactory(List<String> factories) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factories);
    }

    public static Specification<Product> inTarget(List<String> targets) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(targets);
    }

    public static Specification<Product> priceRange(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE), minPrice),
                criteriaBuilder.lessThanOrEqualTo(root.get(Product_.PRICE), maxPrice));
    }
}
