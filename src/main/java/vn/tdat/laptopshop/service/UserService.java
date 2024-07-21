package vn.tdat.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User TDat) {
        return this.userRepository.save(TDat);
    }

    public String handleHello() {
        return "hello form service";
    }
}
