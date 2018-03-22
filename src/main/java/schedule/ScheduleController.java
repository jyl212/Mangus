package schedule;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;


@Controller
public class ScheduleController {
	@Autowired
	ScheduleService service;
	
	@RequestMapping(value="/schedule/index.do")
	public ModelAndView index(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		List<ScheduleVO> schedulelist = service.scheduleList();
		ScheduleVO schedule;
		int size = schedulelist.size();
		
		
		JSONObject root = new JSONObject();
		JSONArray montlyArray = new JSONArray();
		String url = "/springProject/schedule/index.do"; 
		for (int i = 0; i < size; i++) {
			JSONObject montlyInfo = new JSONObject();
			schedule = schedulelist.get(i);
			montlyInfo.put("id", schedule.getSchedule_no());
			montlyInfo.put("name", schedule.getSchedule_title());
			montlyInfo.put("location", schedule.getSchedule_location());
			montlyInfo.put("memo", schedule.getSchedule_memo());
			montlyInfo.put("startdate", schedule.getStartdate());
			montlyInfo.put("enddate", schedule.getEnddate());
			montlyInfo.put("starttime", schedule.getStarttime());
			montlyInfo.put("endtime", schedule.getEndtime());
			montlyInfo.put("color", schedule.getColor());
			montlyInfo.put("url", url.toString());
			montlyArray.add(montlyInfo);
		}
		root.put("monthly", montlyArray);
		
		String Info = root.toJSONString();
		
		try {
			String path=WebUtils.getRealPath(req.getSession().getServletContext(),"/resources/json");
			path = path+"\\events.json";
			FileWriter file = new FileWriter(path);
			file.write(Info);
			file.flush();
			file.close();
	 
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("schedulelist",schedulelist);
		mav.setViewName("schedule");
		return mav;
	}
	
	@RequestMapping(value ="/schedule/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(ScheduleVO schedule) {
		service.scheduleInsert(schedule);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:../schedule/index.do");
		return mav;
	}
	@RequestMapping(value ="/schedule/insert.do", method=RequestMethod.GET)
	public ModelAndView showView() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule/insert");
		return mav;
	}
	
}
