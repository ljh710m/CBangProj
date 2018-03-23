package command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.ResponseBody;

import model.BuildingOptionListDto;
import mvc.command.CommandHandler;
import service.BuildingOptionListService;

public class BuildingOptionHandler implements CommandHandler{
	
	private BuildingOptionListService service = new BuildingOptionListService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String mode = req.getParameter("mode");
		if(mode.equals("regit")) {//등록
			register(req,resp);						
		}
		else if(mode.equals("edit")){//수정
			
		}
		else {//삭제
			
		}
			
		return null;
	}
		
	private String register(HttpServletRequest req, HttpServletResponse resp) {
				
		service.insert(req.getParameter("name"));
		
		List<BuildingOptionListDto> list = service.buildingOptionList();
		
		System.out.println(JSONArray.toJSONString(list));
		
		return JSONArray.toJSONString(list);
	}

}
