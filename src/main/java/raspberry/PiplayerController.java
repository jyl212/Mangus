package raspberry;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PiplayerController {
	private static String url = "http://192.168.0.22:3000/piplay";
	@RequestMapping("/player/play.do")
	public String play() {
		String reqStr = url+"/play"+"?id=5acc623e75f3e80ca915ab86";
		
		HttpURLConnection connection;
		try {
			connection = (HttpURLConnection)new URL(reqStr).openConnection();

            connection.setRequestMethod("GET");
            connection.setDoInput(true);
 
            InputStream is = connection.getInputStream();
 
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String readLine = null;
 
            while ((readLine = br.readLine()) != null) {
                System.out.println(readLine);
            }
 
            br.close();
 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/index.do";
	}

}
