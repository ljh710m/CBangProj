package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
		
		JSONArray listArray = new JSONArray();
		JSONObject optionInfo = null;
					
		//service.insert(req.getParameter("name"));
		
		List<BuildingOptionListDto> list = service.buildingOptionList();
		
		for(int i=0; i<list.size(); i++) {
			optionInfo = new JSONObject();
			optionInfo.put("option_code", list.get(i).getOption_code());
			optionInfo.put("name", list.get(i).getName());
			listArray.add(optionInfo);
		}
		System.out.println(listArray.toJSONString());
		//System.out.println(listArray);
		
		//System.out.println(JSONArray.toJSONString(list));		
		//return JSONArray.toJSONString(list);
		
		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			
			//resp.setContentType("application/json");
				
						
			out.print(listArray.toJSONString());
			
			out.flush();
			
		} catch (IOException e) {}
		
		return "";
	}

}
