package vn.tdat.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.tdat.laptopshop.domain.Order;
import vn.tdat.laptopshop.domain.OrderDetail;
import vn.tdat.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderService.getAllOrder();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("order", order);
        return "admin/order/detail";
    }

    @PostMapping("/admin/order/update/{id}")
    public String updateOrder(@PathVariable long id, @RequestParam("status") String status) {
        Order order = this.orderService.getOrderById(id);
        order.setStatus(status);
        this.orderService.saveOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(@PathVariable long id, Model model) {
        model.addAttribute("order", new Order());
        model.addAttribute("id", id);
        return "/admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(Model model, @ModelAttribute("order") Order order) {
        Order orderTemp = this.orderService.getOrderById(order.getId());
        this.orderService.deleteOrder(orderTemp);
        return "redirect:/admin/order";
    }
}
