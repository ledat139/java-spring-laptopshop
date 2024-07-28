package vn.tdat.laptopshop.service;

import java.util.List;

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

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

}
