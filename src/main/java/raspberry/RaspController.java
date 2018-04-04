package raspberry;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RaspController {
	@RequestMapping("/rasp.do")
	public String raspCall() {
		String url="http://192.168.0.12:5000/rasp";
		ModelAndView mav=new ModelAndView();
		/*try {
			HttpURLConnection conn=(HttpURLConnection)new URL(url).openConnection();
			System.out.println("test");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "*");
			conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
			conn.setRequestMethod("GET");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		return "redirect:http://192.168.0.12:5000/rasp";
	}
	
	@RequestMapping("/result.do")
	public String test() {
		return "redirect:/raspberry/test";
	}
}
