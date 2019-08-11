package org.zerock.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;

public class UploadFileUtilsForBBS {
	/*
	 * @Resource(name="uploadPath") private String uploadPath;
	 */
		

		private static final Logger logger = LoggerFactory.getLogger(UploadFileUtilsForBBS.class);
		
		
		public boolean deleteAllFiles(List<String> files,String uploadPath)throws Exception{
			
			logger.info("delete all files: "+files);
			
			if(files ==null  || files.isEmpty() ) {
				return true; 
			}
			
			for(String fileName : files) {
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				
				if(mType != null){
					
					String front = fileName.substring(0,12);
					String end = fileName.substring(14);
					logger.info(uploadPath +(front + end).replace('/', File.separatorChar));
					new File(uploadPath +(front + end).replace('/', File.separatorChar)).delete();
					
				}
				new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			}
			
			return true;
		}
		
		public static String uploadFile(String uploadPath, 
									String originalName, byte[] fileData)throws Exception{
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + originalName;
			String savePath = calcPath(uploadPath);
			File target = new File(uploadPath + savePath, saveName);
			FileCopyUtils.copy(fileData, target);
			String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
			String uploadedFileName = null;
			
			if(MediaUtils.getMediaType(formatName) != null) {
				uploadedFileName = makeThumbnail(uploadPath, savePath, saveName);
			}else {
				uploadedFileName = makeIcon(uploadPath, savePath, saveName);
			}
			
			return uploadedFileName;
		}
		private static String makeIcon(String uploadPath, String path, String fileName)throws Exception{
			String iconName = uploadPath + path + File.separator + fileName;
			
			return iconName.substring(uploadPath.length()).
					replace(File.separatorChar, '/');
		}
		
		private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
			
			BufferedImage sourceImg =ImageIO.read(new File(uploadPath + path, fileName));
			BufferedImage destImg = Scalr.resize(sourceImg,
					Scalr.Method.AUTOMATIC,
					Scalr.Mode.FIT_TO_HEIGHT,100);
			
			String thumbnailName = uploadPath + path + File.separator + "s_"+fileName;
			
			File newFile = new File(thumbnailName);
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			ImageIO.write(destImg, formatName.toUpperCase(), newFile);
			
			return thumbnailName.substring(
						uploadPath.length()).replace(File.separatorChar, '/');
		}
		

		private static String calcPath(String uploadPath){
			Calendar cal = Calendar.getInstance();
			
			String yearPath = File.separator + cal.get(Calendar.YEAR);
			
			String monthPath = yearPath + File.separator + 
					new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
			
			String datePath = monthPath + File.separator + 
					new DecimalFormat("00").format(cal.get(Calendar.DATE));
			
			makeDir(uploadPath , yearPath,monthPath,datePath);
			
			logger.info(datePath);
			
			return datePath;
			
		}
		
		private static void makeDir(String uploadPath , String... paths){
			
			if(new File(uploadPath + paths[paths.length -1]).exists()){
				return;
			}
			
			for(String path : paths) {
				
				File dirPath = new File(uploadPath + path);
				
				if(!dirPath.exists()) {
					dirPath.mkdir();
				}
			}
		}
		
		
		
}
