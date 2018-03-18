package traffic;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import weather.Weather;

@Controller
public class TrafficIndexController {
	@Autowired
	Traffic logic;
	
	@RequestMapping("/traffic/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("traffic");
		return mav;
	}
	@RequestMapping(value="/traffic/get.do",produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getGeo(@RequestParam String address) {
		JSONObject result=new JSONObject();
		try {
			result=logic.getGeo(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toJSONString();
	}
}
