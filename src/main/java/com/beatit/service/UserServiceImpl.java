package com.beatit.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.beatit.dto.Role;
import com.beatit.dto.User;
import com.beatit.repository.RoleRepository;
import com.beatit.repository.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService,UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptEncoder;
	
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void saveUser(User user) {
		user.setPassword(bCryptEncoder.encode(user.getPassword()));
		user.setEnabled(1);
		Role role = roleRepository.findByRole("User");
		Set<Role> roleSet = new HashSet<Role>();
		roleSet.add(role);
		user.setRoles(roleSet);
		userRepository.save(user);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = findUserByEmail(username);
		if(user == null){
			throw new UsernameNotFoundException(username);
		}
		return new UserDetailsImpl(user);
	}
}
