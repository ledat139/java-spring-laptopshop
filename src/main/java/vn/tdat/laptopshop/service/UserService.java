package vn.tdat.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.tdat.laptopshop.domain.Role;
import vn.tdat.laptopshop.domain.User;
import vn.tdat.laptopshop.domain.DTO.RegisterDTO;
import vn.tdat.laptopshop.repository.RoleRepositoty;
import vn.tdat.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepositoty roleRepositoty;

    public UserService(UserRepository userRepository, RoleRepositoty roleRepositoty) {
        this.userRepository = userRepository;
        this.roleRepositoty = roleRepositoty;
    }

    public User handleSaveUser(User TDat) {
        return this.userRepository.save(TDat);
    }

    public String handleHello() {
        return "hello form service";
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepositoty.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUser() {
        return this.userRepository.count();
    }
}
