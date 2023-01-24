package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;



public class Helper {
	
	public static boolean deleteFile(String path) {
		boolean f=false;
		
		try {
			File file=new File(path);
			f=file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean f=false;
		
		try {
			byte b[]=new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}
	
	public static String get10words(String desc) {
		String[] strs=desc.split(" ");
		if(strs.length>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res=res+strs[i]+" ";
			}
			return (res+"...");
		}else {
			return (desc+"...");
		}
	}
}
