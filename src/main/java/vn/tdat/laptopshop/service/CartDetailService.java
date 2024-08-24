package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.CartDetail;
import vn.tdat.laptopshop.domain.Product;
import vn.tdat.laptopshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public CartDetail handleSaveCartDetail(CartDetail cartDetail) {
        return this.cartDetailRepository.save(cartDetail);
    }

    public CartDetail getCartDetailByCartAndProduct(Cart cart, Product product) {
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }

    public List<CartDetail> getCartDetailByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);
    }
}
