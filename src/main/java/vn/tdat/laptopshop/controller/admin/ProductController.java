package vn.tdat.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.domain.Role;
import vn.tdat.laptopshop.service.UploadService;
import vn.tdat.laptopshop.service.ProductService;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getDashBoard(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("inputFile") MultipartFile file) {

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String productImg = this.uploadService.handleUploadFile(file, "product");
        product.setImage(productImg);
        product.setSold(0);
        this.productService.createProduct(product);
        System.out.println("run here" + product);
        return "redirect:/admin/product";

    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);

        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProductPage(Model model, @ModelAttribute("product") @Valid Product product,
            BindingResult updateProductBindingResult,
            @RequestParam("inputFile") MultipartFile file) {
        Product updateProduct = this.productService.getProductById(product.getId());
        List<FieldError> errors = updateProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (updateProductBindingResult.hasErrors()) {
            return "/admin/product/update";
        }
        updateProduct.setName(product.getName());
        updateProduct.setPrice(product.getPrice());
        updateProduct.setDetailDesc(product.getDetailDesc());
        updateProduct.setShortDesc(product.getShortDesc());
        updateProduct.setQuantity(product.getQuantity());
        updateProduct.setFactory(product.getFactory());
        updateProduct.setTarget(product.getTarget());
        updateProduct.setSold(product.getSold());
        String productImg = this.uploadService.handleUploadFile(file, "product");
        if (productImg != "")
            updateProduct.setImage(productImg);
        this.productService.createProduct(updateProduct);
        System.out.println("run here" + updateProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("product", new Product());
        model.addAttribute("id", id);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("product") Product product) {
        this.productService.deleteById(product.getId());
        return "redirect:/admin/product";
    }
}
