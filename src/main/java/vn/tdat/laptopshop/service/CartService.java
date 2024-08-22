package vn.tdat.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart getCardByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public Cart handleSaveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }
}
