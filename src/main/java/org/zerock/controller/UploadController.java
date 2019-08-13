package org.zerock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtilsForBBS;


@Controller
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger =LoggerFactory.getLogger(UploadController.class);
	
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles",method=RequestMethod.POST)
	public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]")String[] files)throws Exception{
		
		logger.info("delete all files: "+files);
		
		if(files ==null  || files.length ==0 ) {
			return new ResponseEntity<String>("deleted",HttpStatus.OK); 
		}
		
		for(String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null){
				
				String front = fileName.substring(0,12);
				String end = fileName.substring(14);
				new File(uploadPath +(front + end).replace('/', File.separatorChar)).delete();
				
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("fName")String fName)throws Exception{
		
		String fileName = URLDecoder.decode(fName, "UTF-8") ; //한글 인코딩
		logger.info("delete file: "+ fName);
		logger.info("After encoding delete file: "+ fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){
			
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath +(front + end).replace('/', File.separatorChar)).delete();
			
		}
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fName)throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = URLDecoder.decode(fName, "UTF-8") ; //한글 인코딩 
		logger.info("File name : "+ fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
					headers,
					HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
			
		return entity;
	}
	
	
	@RequestMapping(value="/uploadAjax",method = RequestMethod.POST,produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<String>(
				
	UploadFileUtilsForBBS.uploadFile(uploadPath,file.getOriginalFilename(),file.getBytes()),HttpStatus.CREATED); 
					
	}
	
	@RequestMapping(value="/uploadAjax",method = RequestMethod.GET)
	public void uploadAjax(){
		
	}

	@RequestMapping(value="/uploadForm",method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception{
		logger.info("originalName : "+file.getOriginalFilename());
		logger.info("size : "+ file.getSize());
		logger.info("contentType : "+ file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(),file.getBytes());
		
		model.addAttribute("savedName",savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData)throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedname = uid.toString()+"_"+originalName;
		File target = new File(uploadPath,savedname);
		FileCopyUtils.copy(fileData,target);
		
		return savedname;
	}
	
	@RequestMapping(value="/uploadForm",method = RequestMethod.GET)
	public String uploadForm(){
		return "uploadForm";
	}
			
}
