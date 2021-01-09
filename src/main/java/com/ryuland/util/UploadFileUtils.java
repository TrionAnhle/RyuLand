package com.ryuland.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ryuland.dto.ProductDTO;

@Component
public class UploadFileUtils {

	@Autowired
	ServletContext context;
	
	public ProductDTO writeOrUpdate(ProductDTO dto) {
		byte[] bytes = Base64.getDecoder().decode(dto.getBase64().split(",")[1].getBytes());
		String newPathImage = (SecurityUtils.getPrincipal().getUsername()
				+String.valueOf(System.currentTimeMillis())
				+dto.getPathImage());
		dto.setPathImage(newPathImage);
		
		String uploadRootPath = context.getRealPath("upload");
		File uploadRootDir = new File(uploadRootPath);
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
	    }
		try {
     
            File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + dto.getPathImage());
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
		return dto;
	}
	
	public void deleteFile(String nguon) {
		String uploadRootPath = context.getRealPath("upload");
		File uploadRootDir = new File(uploadRootPath);
		File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + nguon);
		if(serverFile.delete()) {
			System.out.println("Xoa anh thanh công");
		}else System.out.println("Xoa anh that bai");
	}
	
}
