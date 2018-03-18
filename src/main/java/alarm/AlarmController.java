package alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlarmController {
	@Autowired
	AlarmService service;
	
	@RequestMapping(value = "/alarm/index.do", method=RequestMethod.GET)
	public ModelAndView ShowPage() {
		ModelAndView mav = new ModelAndView();
		List<AlarmVO> alarmlist = service.alarmList();
		if(alarmlist==null) {
			mav.setViewName("alarm/index");
		}else {
			mav.addObject("alarmlist",alarmlist);
			mav.setViewName("alarm/index");
		}
		return mav;
	}
	
	@RequestMapping(value = "/alarm/insert.do", method=RequestMethod.POST)
	public String insert(AlarmVO alarm) {
		int result=service.alarmInsert(alarm);
		System.out.println(result);
		if(result==1) {
			return "redirect:../alarm/index.do";
		}
		return "redirect:../alarm/index.do";
	}
	@RequestMapping(value = "/alarm/update.do", method=RequestMethod.POST)
	public String update(AlarmVO alarm) {
		System.out.println(alarm);
		int result=service.alarmUpdate(alarm);
		System.out.println(result);
		if(result==1) {
			return "redirect:../alarm/index.do";
		}
		return "redirect:../alarm/index.do";
	}
}
