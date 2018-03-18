package main;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import weather.Weather;

@Controller
public class IndexController {
	@RequestMapping("index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
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
