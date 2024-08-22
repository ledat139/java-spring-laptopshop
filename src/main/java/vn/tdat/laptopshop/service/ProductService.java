package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(long productId, String email) {
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
