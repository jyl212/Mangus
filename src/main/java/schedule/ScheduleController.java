package schedule;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ScheduleController {
	@Autowired
	ScheduleService service;
	
	@RequestMapping(value="/schedule/index.do")
	public ModelAndView index() {
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
			System.out.println(schedule.getSchedule_no());
			montlyInfo.put("id", schedule.getSchedule_no());
			montlyInfo.put("name", schedule.getSchedule_title());
			montlyInfo.put("startdate", schedule.getStartdate());
			montlyInfo.put("enddate", schedule.getEnddate());
			montlyInfo.put("starttime", schedule.getStarttime());
			montlyInfo.put("endtime", schedule.getEndtime());
			montlyInfo.put("color", "#5cb85c");
			montlyInfo.put("url", url.toString());
			montlyArray.add(montlyInfo);
		}
		root.put("monthly", montlyArray);
		
		String Info = root.toJSONString();
		System.out.println(root);
		
		try {
			FileWriter file = new FileWriter("C:\\ICT\\WORK\\mangus\\springproject\\src\\main\\webapp\\resources\\json\\events.json");
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
	@RequestMapping(value="/schedule/get.do",produces="text/json;charset=UTF-8")
	@ResponseBody
	public JSONObject getGeo() {
		List<ScheduleVO> schedulelist = service.scheduleList();
		ScheduleVO schedule;
		int size = schedulelist.size();
		
		
		JSONObject root = new JSONObject();
		JSONArray montlyArray = new JSONArray();
		String url = "/springProject/schedule/index.do"; 
		for (int i = 0; i < size; i++) {
			JSONObject montlyInfo = new JSONObject();
			schedule = schedulelist.get(i);
			System.out.println(schedule.getSchedule_no());
			montlyInfo.put("id", schedule.getSchedule_no());
			montlyInfo.put("name", schedule.getSchedule_title());
			montlyInfo.put("startdate", schedule.getStartdate());
			montlyInfo.put("enddate", schedule.getEnddate());
			montlyInfo.put("starttime", schedule.getStarttime());
			montlyInfo.put("endtime", schedule.getEndtime());
			montlyInfo.put("color", "#5cb85c");
			montlyInfo.put("url", url.toString());
			montlyArray.add(montlyInfo);
		}
		root.put("monthly", montlyArray);
		return root;
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
