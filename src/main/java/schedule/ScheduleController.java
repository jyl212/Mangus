package schedule;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ScheduleController {
	@Autowired
	ScheduleService service;
	
	@RequestMapping(value="/schedule/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("schedule");
		return mav;
	}
	@RequestMapping(value ="/schedule/insert.do", method=RequestMethod.POST)
	public ModelAndView insert(ScheduleVO schedule) {
		System.out.println(schedule);
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
