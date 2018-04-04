package search;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import weather.Weather;

@Controller
public class SearchIndexController {
	@Autowired 
	private ResourceLoader resourceLoader;
	
	@RequestMapping("/search/index.do")
	public ModelAndView index(@RequestParam String gender, @RequestParam String birth) {
		ModelAndView mav=new ModelAndView();
		Search search = new Search();
		NaverCrawling naver = new NaverCrawling(); 
		List<String> keyword = naver.realtime();
		JSONParser parser = new JSONParser();
        JSONObject jsonObj = new JSONObject();
        JSONObject tmp = new JSONObject();
		List<SearchVO> searchlist = new ArrayList<SearchVO>();
		SearchVO searchdata = null;
		JSONArray arr = new JSONArray();
		String newstitle ="";
		String newslink = "";
		for(int i=0; i<keyword.size();i++) {
			try {
				jsonObj = (JSONObject)parser.parse(search.News(keyword.get(i)).toString());
				
				arr = (JSONArray)jsonObj.get("items");
				tmp = (JSONObject)arr.get(0);
				newstitle = tmp.get("title").toString();
				newslink = tmp.get("link").toString();
				searchdata = new SearchVO(keyword.get(i), newstitle, newslink);
				searchlist.add(searchdata);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int age=119-Integer.parseInt(birth.substring(0, 2));
		
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();

		
		int content =0;
		String url = "http://127.0.0.1:5000/search?gender="+gender+"&age="+age+"&content="+content;
		String sb="";  
		try {
			HttpURLConnection  conn = 
					(HttpURLConnection)new URL(url).openConnection();
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "*/*");
			conn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
			conn.setRequestMethod("GET");
			
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));  

            String line = null;  

            while ((line = br.readLine()) != null) {  
             sb = sb+line + "\n";  
            }  
            String path = resourceLoader.getResource("classpath:python").getURI().getPath();
            BufferedReader file = null;
            if(sb.toString().contains("ok")) {
            	file = new BufferedReader(
            			new InputStreamReader(
            					new FileInputStream(path+"result.txt"),"UTF-8"));
        		int count=0;		
            	while(true) {
            		String fileLine = file.readLine();
            		if(fileLine==null) {
            			break;
            		}
            		
            		if(count<10) {
            			list2.add(fileLine);
            		}
            		else {
            			list3.add(fileLine);
            			
            		}
            		count++;
            		
            	}
            }
            br.close();  
  
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		mav.addObject("searchlist2",list2);
		mav.addObject("searchlist3",list3);

		mav.addObject("searchlist",searchlist);
		mav.setViewName("search");
		return mav;
	}
	
}
