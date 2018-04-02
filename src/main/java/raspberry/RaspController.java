package raspberry;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RaspController {
	@RequestMapping("/rasp.do")
	public void raspCall() {
		String url="http://192.168.0.12:5000/rasp";
		ModelAndView mav=new ModelAndView();
		try {
			HttpURLConnection conn=(HttpURLConnection)new URL(url).openConnection();
			//mav.setViewName("/raspberry/test.jsp");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
