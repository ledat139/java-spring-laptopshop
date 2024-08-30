package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.CartDetail;
import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public ProductService(ProductRepository productRepository, UserService userService, CartService cart,
            CartDetailService cartDetailService) {
        this.productRepository = productRepository;
        this.userService = userService;
        this.cartService = cart;
        this.cartDetailService = cartDetailService;
    }

    public Product createProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> getAllProduct(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(long productId, String email, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        // check user xem có cart chưa nếu chưa thì add cart
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartService.getCardByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setSum(0);
                otherCart.setUser(user);
                cart = this.cartService.handleSaveCart(otherCart);
            }
            // add card-detail
            Product product = this.productRepository.findById(productId);

            if (product != null) {
                // tăng sum trong cart
                cart.setSum(cart.getSum() + 1);
                this.cartService.handleSaveCart(cart);
                session.setAttribute("sum", cart.getSum());

                // check xem có tồn tại product trong cartdetail chưa nếu có thì tăng quantity
                CartDetail cartDetailCheck = this.cartDetailService.getCartDetailByCartAndProduct(cart, product);
                if (cartDetailCheck != null) {
                    cartDetailCheck.setQuantity(cartDetailCheck.getQuantity() + 1);
                    cartDetailCheck.setCart(cart);
                    this.cartDetailService.handleSaveCartDetail(cartDetailCheck);

                }
                // nếu không thì tạo mới cartdetail
                else {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(1);
                    cartDetail.setPrice(product.getPrice());
                    this.cartDetailService.handleSaveCartDetail(cartDetail);
                }
            }
        }
    }

    public void handleAddProductToCartFromProductDetail(long productId, String email, HttpServletRequest request,
            long quantity) {
        HttpSession session = request.getSession(false);
        // check user xem có cart chưa nếu chưa thì add cart
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartService.getCardByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setSum(0);
                otherCart.setUser(user);
                cart = this.cartService.handleSaveCart(otherCart);
            }
            // add card-detail
            Product product = this.productRepository.findById(productId);

            if (product != null) {
                // tăng sum trong cart
                cart.setSum(cart.getSum() + quantity);
                this.cartService.handleSaveCart(cart);
                session.setAttribute("sum", cart.getSum());

                // check xem có tồn tại product trong cartdetail chưa nếu có thì tăng quantity
                CartDetail cartDetailCheck = this.cartDetailService.getCartDetailByCartAndProduct(cart, product);
                if (cartDetailCheck != null) {
                    cartDetailCheck.setQuantity(cartDetailCheck.getQuantity() + quantity);
                    cartDetailCheck.setCart(cart);
                    this.cartDetailService.handleSaveCartDetail(cartDetailCheck);

                }
                // nếu không thì tạo mới cartdetail
                else {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(quantity);
                    cartDetail.setPrice(product.getPrice());
                    this.cartDetailService.handleSaveCartDetail(cartDetail);
                }
            }
        }
    }

    public long countProduct() {
        return this.productRepository.count();
    }
}
