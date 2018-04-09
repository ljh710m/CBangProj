package util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class PLoginUpload {
	
	public static String parseInsertFileInfo(MultipartHttpServletRequest req, String file_name, String path, String member_no) throws Exception{
		
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
		
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
        
        //서버의 물리적 경로 얻기
		String phisicalPath = req.getSession().getServletContext().getRealPath(path);
		File file = new File(phisicalPath);
        
        if(file.exists() == false){
            file.mkdirs();
        }

		MultipartFile uploadFile = req.getFile(file_name);

		originalFileName = uploadFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
		System.out.println(originalFileName);
		file = new File(phisicalPath + File.separator + storedFileName);
		uploadFile.transferTo(file);

		return storedFileName;
	}
}
