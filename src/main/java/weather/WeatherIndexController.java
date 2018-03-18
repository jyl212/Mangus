package weather;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WeatherIndexController {
	@Autowired
	Weather logic;
	@RequestMapping("/weather/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		try {
			mav.addObject("today",logic.getminutely());
			mav.addObject("info",logic.threedays());
			mav.addObject("wct",logic.wct());
			mav.addObject("th",logic.th());
			mav.addObject("uv",logic.uv());
			mav.addObject("lun",logic.lun());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("weather");
		return mav;
	}
}
