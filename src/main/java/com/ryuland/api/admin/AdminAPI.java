package com.ryuland.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.constant.SystemConstant;
import com.ryuland.dto.UserDTO;
import com.ryuland.service.IUserService;

@RestController(value = "adminAPIOfWeb")
public class AdminAPI {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping(value = "/api/admin")
	public ResponseEntity<UserDTO> addAdmin(@RequestBody UserDTO newDto){
		newDto.setRole(SystemConstant.ROLE_ADMIN);
		UserDTO dto = userService.save(newDto);
		return new ResponseEntity<UserDTO>(dto, HttpStatus.OK);
	}
}
