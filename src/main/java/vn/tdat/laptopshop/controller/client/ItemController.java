package vn.tdat.laptopshop.controller.client;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.domain.Product_;
import vn.tdat.laptopshop.domain.DTO.ProductCriteriaDTO;
import vn.tdat.laptopshop.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(@PathVariable long id, Model model) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "/client/product/detail";
    }

    @PostMapping("/add-product-from-product-detail/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request,
            @RequestParam("quantity") long quantity) {
        long productId = id;
        String email = (String) request.getSession(false).getAttribute("email");
        this.productService.handleAddProductToCartFromProductDetail(productId, email, request, quantity);
        return "redirect:/product/{id}";
    }

    @GetMapping("/products")
    public String getProductsPage(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        if (productCriteriaDTO.getPage() != null && productCriteriaDTO.getPage().isPresent()) {
            page = Integer.parseInt(productCriteriaDTO.getPage().get());
        }
        Pageable pageable = PageRequest.of(page - 1, 6);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            if (productCriteriaDTO.getSort().get().equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending());
            } else if (productCriteriaDTO.getSort().get().equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());
            }
        }
        String qs = request.getQueryString();
        if (qs != null) {
            qs = qs.replace("page=" + page, "");
        }
        Page<Product> products = this.productService.getProductWithSpec(pageable, productCriteriaDTO);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("queryString", qs);
        return "/client/product/show";
    }

}
