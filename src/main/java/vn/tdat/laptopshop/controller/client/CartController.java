package vn.tdat.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.tdat.laptopshop.domain.Cart;
import vn.tdat.laptopshop.domain.CartDetail;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.service.CartDetailService;
import vn.tdat.laptopshop.service.CartService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
    private final CartDetailService cartDetailService;
    private final CartService cartService;

    public CartController(CartDetailService cartDetailService, CartService cartService) {
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        Long userId = (Long) request.getSession(false).getAttribute("id");
        User user = new User();
        user.setId(userId);
        Cart cart = this.cartService.getCardByUser(user);
        double priceTotal = 0;
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            for (CartDetail cartDetail : cartDetails) {
                priceTotal += cartDetail.getPrice() * cartDetail.getQuantity();
            }
            model.addAttribute("cartDetails", cartDetails);
            model.addAttribute("cart", cart);
        }

        model.addAttribute("priceTotal", priceTotal);

        return "/client/cart/show";
    }

    @PostMapping("/delete-product-from-cart/{id}")
    public String deleteProductFromCart(Model model, @PathVariable long id, HttpServletRequest request) {
        this.cartDetailService.deleteCartDetailById(id);
        User user = new User();
        user.setId((Long) request.getSession(false).getAttribute("id"));
        Cart cart = this.cartService.getCardByUser(user);
        cart.setSum(cart.getSum() - 1);
        this.cartService.handleSaveCart(cart);
        if (cart.getSum() == 0)
            this.cartService.deleteById(cart.getId());
        request.getSession(false).setAttribute("sum", cart.getSum());
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckout(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart.getCartDetails();
        this.cartDetailService.updateCartDetailBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        Long userId = (Long) request.getSession(false).getAttribute("id");
        User user = new User();
        user.setId(userId);
        Cart cart = this.cartService.getCardByUser(user);
        double priceTotal = 0;
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            for (CartDetail cartDetail : cartDetails) {
                priceTotal += cartDetail.getPrice() * cartDetail.getQuantity();
            }
            model.addAttribute("cartDetails", cartDetails);
            model.addAttribute("cart", cart);
        }

        model.addAttribute("priceTotal", priceTotal);
        return "/client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrderPage(HttpServletRequest request, @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        User user = new User();
        user.setId((long) session.getAttribute("id"));
        this.cartService.handlePlaceOrder(user, receiverName, receiverAddress, receiverPhone, session);

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankPage() {
        return "client/cart/thanks";
    }

}
