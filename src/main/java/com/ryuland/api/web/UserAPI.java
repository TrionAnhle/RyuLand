package com.ryuland.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.constant.SystemConstant;
import com.ryuland.dto.UserDTO;
import com.ryuland.service.IUserService;

@RestController(value = "userAPIOfWeb")
public class UserAPI {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping(value = "/api/web/user")
	public ResponseEntity<UserDTO> addUser(@RequestBody UserDTO newDto){
		newDto.setRole(SystemConstant.ROLE_USER);
		UserDTO dto = userService.save(newDto);
		return new ResponseEntity<UserDTO>(dto, HttpStatus.OK);
	}
	
	@PutMapping(value = "/api/web/user")
	public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO newDto){
		newDto.setRole(SystemConstant.ROLE_USER);
		UserDTO dto = userService.save(newDto);
		return new ResponseEntity<UserDTO>(dto, HttpStatus.OK);
	}
	
}
