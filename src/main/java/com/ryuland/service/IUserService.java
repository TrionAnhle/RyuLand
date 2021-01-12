package com.ryuland.service;

import java.util.List;

import com.ryuland.dto.UserDTO;

public interface IUserService {
	UserDTO save(UserDTO user);
	List<UserDTO> findAll();
}
