package util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpDownUtils {
	
	private static final String FILE_PATH = "/Upload";
	
	public static List<Map<String,Object>> parseInsertFileInfo(MultipartHttpServletRequest req,String room_no) throws Exception{
		Iterator<String> iterator =  req.getFileNames();
				
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
		
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
        
        //서버의 물리적 경로 얻기
        String phisicalPath=req.getSession().getServletContext().getRealPath(FILE_PATH);
        File file = new File(phisicalPath);
        if(file.exists() == false){
            file.mkdirs();
        }
                
		if(iterator.hasNext()) {
			String uploadFile = iterator.next();
			List<MultipartFile> mFileList = req.getFiles(uploadFile);
						
			for(int i=0; i<mFileList.size();i++) {
				originalFileName = mFileList.get(i).getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                
                file = new File(phisicalPath+File.separator+storedFileName);
                mFileList.get(i).transferTo(file);
                
                listMap = new HashMap<String,Object>();
                listMap.put("room_no", room_no);
                listMap.put("original_file_name", originalFileName);
                listMap.put("stored_file_name", storedFileName);
                listMap.put("file_size", mFileList.get(i).getSize());
                list.add(listMap);												
			}	
		}
        		
		return list;
	}
}