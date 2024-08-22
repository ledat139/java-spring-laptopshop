package vn.tdat.laptopshop.controller.client;

import java.util.List;

import org.springframework.boot.autoconfigure.jms.JmsProperties.Listener.Session;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.domain.Role;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.domain.DTO.RegisterDTO;
import vn.tdat.laptopshop.service.ProductService;
import vn.tdat.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "/client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("newRegister", new RegisterDTO());
        return "/client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(Model model, @ModelAttribute("newRegister") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        User user = this.userService.registerDTOtoUser(registerDTO);

        // List<FieldError> errors = bindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(error.getField() + " - " + error.getDefaultMessage());
        // }

        if (bindingResult.hasErrors()) {
            return "/client/auth/register";
        }

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        Role role = this.userService.getRoleByName("USER");
        user.setRole(role);
        user.setPassword(hashPassword);
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "/client/auth/login";
    }

    @GetMapping("/accessDenied")
    public String getAccessDeniedPage(Model model) {
        return "/client/auth/accessDenied";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        long productId = id;
        String email = (String) request.getSession(false).getAttribute("email");
        this.productService.handleAddProductToCart(productId, email);

        return "redirect:/";
    }
}
