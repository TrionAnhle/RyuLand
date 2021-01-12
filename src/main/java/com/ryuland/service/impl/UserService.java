package com.ryuland.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ryuland.converter.UserConverter;
import com.ryuland.dto.UserDTO;
import com.ryuland.entity.RoleEntity;
import com.ryuland.entity.UserEntity;
import com.ryuland.repository.IRoleRepository;
import com.ryuland.repository.UserRepository;
import com.ryuland.service.IUserService;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private IRoleRepository roleRepository;
	
	@Autowired
	private UserConverter userConverter;

	@Override
	public UserDTO save(UserDTO user) {
		UserEntity entity = userConverter.toEntity(user);
		boolean check = false;
		List<UserEntity> users = userRepository.findAll();
		for(UserEntity i : users) {
			if(user.getUserName().trim().equals(i.getUserName())) check = true;
		}
		if(check) {
			new Exception();return null;
		}
		List<RoleEntity> roles = new ArrayList<>();
		roles.add(roleRepository.findOne((long)user.getRole()));
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder(); 
		entity.setRoles(roles);
		entity.setStatus(1);
		CharSequence password = entity.getPassword().toString();
		entity.setPassword(encode.encode(password));
		
		return userConverter.toDto(userRepository.save(entity));
	}

}
