package com.ryuland.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtils {
	public Map<String, String> getMessage(String message) {
		Map<String, String> result = new HashMap<>();
		if (message.equals("update_success")) {
			result.put("message", "Cập nhật thành công");
			result.put("alert", "success");
		} else if (message.equals("update_fail")) {
			result.put("message", "Cập nhật thất bại");
			result.put("alert", "danger");
		}else if (message.equals("insert_success")) {
			result.put("message", "Thêm mới thành công");
			result.put("alert", "success");
		}else if (message.equals("insert_fail")) {
			result.put("message", "Thêm mới thất bại");
			result.put("alert", "danger");
		} else if (message.equals("delete_success")) {
			result.put("message", "Xóa thành công");
			result.put("alert", "success");
		}else if (message.equals("delete_fail")) {
			result.put("message", "Xóa thất bại");
			result.put("alert", "danger");
		} else if (message.equals("error_system")) {
			result.put("message", "Lỗi hệ thống");
			result.put("alert", "danger");
		}
		return result;
	}
}
