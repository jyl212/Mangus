package weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class test {
	public static void main(String[] args) throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/index/laundry?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String lat="37.1234";
		String lon="126.1234";
		String realUrl=mainurl+"&lat="+lat+"&lon="+lon+"&village="+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		URL url = new URL(realUrl);
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONObject wIdex=(JSONObject)obj.get("wIndex");
            JSONArray laundry=(JSONArray)wIdex.get("laundry");
            JSONObject dry=(JSONObject)laundry.get(0);
            JSONObject comment=(JSONObject)dry.get("day00");
            String index=(String)comment.get("comment");
            if(index.equals("")) {
            	comment=(JSONObject)dry.get("day01");
            	index=(String)comment.get("comment");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
