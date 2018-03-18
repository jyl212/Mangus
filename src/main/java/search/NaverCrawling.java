package search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class NaverCrawling {
	public List<String> realtime(){
		List<String> real = new ArrayList<String>();
	    Document doc = null;
	    try {
	    	doc = Jsoup.connect("http://www.naver.com/").get();
	    } catch (IOException e1) {
	
	    }
	    Elements elements = doc.select("li.ah_item");
	    for (int i=0; i<10; i++) {
	    	String article = elements.get(i).select("span.ah_k").text();
	    	real.add(article);
	        }
		return real;
	}

}
