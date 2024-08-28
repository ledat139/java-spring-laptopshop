package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.Order;
import vn.tdat.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> getAllOrder() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order savOrder(Order order) {
        return this.orderRepository.save(order);
    }
}
