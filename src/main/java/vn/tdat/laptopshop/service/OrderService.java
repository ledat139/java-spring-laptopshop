package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.Order;
import vn.tdat.laptopshop.domain.OrderDetail;
import vn.tdat.laptopshop.repository.OrderDetailRepository;
import vn.tdat.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> getAllOrder(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order saveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public void deleteOrder(Order order) {
        List<OrderDetail> orderDetails = order.getOrderDetails();
        for (OrderDetail od : orderDetails) {
            this.orderDetailRepository.delete(od);
        }
        this.orderRepository.delete(order);
    }

    public long countOrder() {
        return this.orderRepository.count();
    }
}
