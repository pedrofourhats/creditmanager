package com.creditmanager.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.rmi.server.UID;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.creditmanager.service.dto.UploadedFileDTO;

@Controller
@RequestMapping("/fileUploader")
public class UploadFileController {

	@Value("#{configProps}")
	private Properties properties;
	
	private final String PDF_FOLDER = "folder.pdf";
	
	@RequestMapping(value="/uploadPdf", method=RequestMethod.POST)
	public @ResponseBody UploadedFileDTO uploadPdf(@RequestParam("file") MultipartFile file) throws FileNotFoundException, IOException{
		String filePath = properties.getProperty(PDF_FOLDER);
		
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		String uniqueName = "";// new UID().toString();
		
		String filename = String.format("%s_%s.%s", file.getOriginalFilename().replace(extension, ""), uniqueName, extension);
		
		File directory = new File(filePath);
		if(!directory.exists()){
			directory.mkdirs();
		}
		
		String fullname = new File(directory.getAbsoluteFile(), filename).getAbsolutePath();
		
		FileCopyUtils.copy(file.getBytes(), new FileOutputStream(fullname));
		
		return new UploadedFileDTO(filename);
	}
	
	@RequestMapping(value="getPdfFile", method=RequestMethod.GET)
	public void getPdfFile(HttpServletResponse response, String fileName){
		
		String pdfDirectoryPath = properties.getProperty(PDF_FOLDER);
		
		response.setContentType("application/pdf");
		OutputStream output  = null;
		FileInputStream input = null;
		File file = new File(pdfDirectoryPath, fileName);
		try {
			output = response.getOutputStream();
			input = new FileInputStream(file);
			byte[] buffer = new byte[(int) file.length()];
			input.read(buffer);
			response.setContentLength(buffer.length);
			output.write(buffer);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				input.close();
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
