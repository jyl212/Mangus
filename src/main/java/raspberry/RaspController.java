package raspberry;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RaspController {
	@RequestMapping("/rasp.do")
	public String callMycrawler(){
		int BUFFER_SIZE=1024;
		char[] buffer=new char[BUFFER_SIZE];
		int charsRead=0;
		String url = "http://192.168.0.12:5000/result";
		StringBuilder sb=new StringBuilder();  
		try {
			HttpURLConnection  conn = 
					(HttpURLConnection)new URL(url).openConnection();
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "text/html;charset=UTF-8");
			conn.setRequestProperty("Accept", "*/*");
			conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
			conn.setRequestMethod("GET");
			
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));  

            while ((charsRead = br.read(buffer,0,BUFFER_SIZE))!=-1) {  
             sb.append(buffer,0,charsRead);
            }
            System.out.println(""+sb.toString());  
            if(sb.toString().equals("재생")) {
            	return "redirect:/player/play.do";
            }
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sb.toString();
	}
	@RequestMapping("/result.do")
	public String test() {
		return "/raspberry/test";
	}
}
