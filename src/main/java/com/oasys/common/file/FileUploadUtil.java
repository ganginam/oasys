package com.oasys.common.file;

//import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//import javax.imageio.ImageIO;

//import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
//	파일 생성
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdir();
	}
	
	
/*	파일 업로드 메소드
 *	파일명이 중복시 해결방법
 *	system.currentTimeMillis()를 사용하거나 UUID는 128비트의 수.
 *	표준 형ㅅ깅에서 UUID는 32개의 16진수, 36개 문자(32개-4개)
 *	8-4-4-4-12.UUID.randomUUID().toString(); 
 * */
	public static ArrayList<String> fileUploads(List<MultipartFile> file,String fileName) throws IOException{
		ArrayList<String> real_name = new ArrayList<String>();
		
		String name = null;
		if(!file.isEmpty()) {
			for(MultipartFile mf : file) {
			//name = mf.getOriginalFilename();
			//if(name != null &&(!name.equals(""))) {
				name = fileName+"_"+System.currentTimeMillis()+"_"+mf.getOriginalFilename();
				real_name.add(name);
				
				String docRoot = "C://uploadStorage//"+fileName;
				makeDir(docRoot);
				File fileAdd = new File(docRoot+"/"+name);//
				mf.transferTo(fileAdd);
			}
		}
		return real_name;
	}
	
	public static String fileUpload(MultipartFile file,String fileName) throws IOException{
		String real_name=null;
		
		String org_name = file.getOriginalFilename();
		
		
		if(org_name != null &&(!org_name.equals(""))) {
			real_name = fileName+"_"+System.currentTimeMillis()+"_"+org_name;
			
			String docRoot = "C://uploadStorage//"+fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	public static String fileUpload(List<MultipartFile> file, String fileName) throws IOException{
		return "";
	}
//	파일 삭제 메소드
	public static void fileDelete(String fileName)throws Exception{
		boolean result = false;
		log.info(result);
		String startDirName="",docRoot="";
		String dirName = fileName.substring(0,fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName=fileName.substring(dirName.length()+1,fileName.indexOf("_",dirName.length()+1));
			docRoot = "C://uploadStorage//"+startDirName+"//"+dirName;
		}else {
			docRoot="C://uploadStorage//"+dirName;
		}
		
		File fileDelete = new File(docRoot+"/"+fileName);
		if(fileDelete.exists()&&fileDelete.isFile()) {
			result=fileDelete.delete();
		}
	}
//	파일  thumbnail 생ㄷ성  메소드
	/*public static String makeThumbnail(String fileName) throws Exception{
		String dirName = fileName.substring(0,fileName.indexOf("_"));
		//이미지가 존재하는 폴더 추출
		String imgPath = "C://uploadStorage//"+dirName;
		//추출된 폴더의 실제 경로(물리적 위치)
		File fileAdd=new File(imgPath,fileName);
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,200);
		
		String thumbnailName = "thumbnail_"+fileName;
		String docRoot = imgPath+"/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot,thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg,formatName,newFile);
		return thumbnailName;
	}*/


	
}
