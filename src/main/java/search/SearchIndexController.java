package search;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import weather.Weather;

@Controller
public class SearchIndexController {
	
	
	
	@RequestMapping("/search/index.do")
	public ModelAndView index() {
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
		mav.addObject("searchlist",searchlist);
		mav.setViewName("search");
		return mav;
	}
}
