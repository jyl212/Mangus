package main;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import authentication.SecurityLoginDTO;
import schedule.ScheduleService;
import schedule.ScheduleVO;
import weather.Weather;

@Controller
public class IndexController {
	@Autowired
	ScheduleService service;
	
	@RequestMapping("index.do")
	public ModelAndView index(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-M-d", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		System.out.println ( mTime );
		HttpSession sessoion = req.getSession();
		SecurityLoginDTO member=(SecurityLoginDTO)sessoion.getAttribute("user");
		if(member!=null) {
			System.out.println(member.getId());
			List<ScheduleVO> todayschedule =  service.todayschedule(mTime, member.getId());
			System.out.println(todayschedule);
			mav.addObject("todayschedule",todayschedule);
		}
		
		Weather logic=new Weather();
		JSONObject today=new JSONObject();
		try {
			today = logic.getminutely();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("today",today);
		mav.setViewName("index");
		return mav;
	}
}
