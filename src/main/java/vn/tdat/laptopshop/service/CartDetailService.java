package vn.tdat.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.CartDetail;
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

}
