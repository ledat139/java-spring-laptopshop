package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.CartDetail;
import vn.tdat.laptopshop.domain.Order;
import vn.tdat.laptopshop.domain.OrderDetail;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.repository.CartDetailRepository;
import vn.tdat.laptopshop.repository.CartRepository;
import vn.tdat.laptopshop.repository.OrderDetailRepository;
import vn.tdat.laptopshop.repository.OrderRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartDetailRepository cartDetailRepository;

    public CartService(CartRepository cartRepository, OrderDetailRepository orderDetailRepository,
            OrderRepository orderRepository, CartDetailRepository cartDetailRepository) {
        this.cartRepository = cartRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Cart getCardByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public Cart handleSaveCart(Cart cart) {
        return this.cartRepository.save(cart);
    }

    public void deleteById(long id) {
        this.cartRepository.deleteById(id);
    }

    public void handlePlaceOrder(User user, String receiverName,
            String receiverAddress, String receiverPhone,
            HttpSession session) {

        // save orderDetails
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                // save order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");
                order = this.orderRepository.save(order);

                Double totalPrice = 0d;
                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
                order.setTotalPrice(totalPrice);
                this.orderRepository.save(order);
                // delete cartDetails
                for (CartDetail cartDetail : cartDetails) {
                    this.cartDetailRepository.delete(cartDetail);
                }
                this.cartRepository.delete(cart);
            }

        }
        session.setAttribute("sum", 0);

    }
}
