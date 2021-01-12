package com.ryuland.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ryuland.dto.UserDTO;
import com.ryuland.util.SecurityUtils;

@RestController(value = "sessionAPI")
public class SesstionAPI {
	
	@PostMapping("/api/session")
	public ResponseEntity<UserDTO> checkUser() throws Exception {
		SecurityUtils.getPrincipal().getId();
		return new ResponseEntity<UserDTO>(new UserDTO(), HttpStatus.OK);
	}
	
}
