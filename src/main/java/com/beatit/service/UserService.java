package com.beatit.service;

import com.beatit.dto.User;

public interface UserService {

	User findUserByEmail(String email);
	void saveUser(User user);
}
