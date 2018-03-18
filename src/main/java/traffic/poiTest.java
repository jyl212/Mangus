package traffic;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//https://api2.sktelecom.com/tmap/pois?version=1&searchKeyword=%EC%84%9C%EC%9A%B8%EC%97%AD&appKey=c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a

public class poiTest {
//	public JSONObject poiInfo() throws Exception{
	public static void main(String[] args) throws Exception{
	String mainurl="https://api2.sktelecom.com/tmap/pois?version=1";
	String appkey="c0e8a299-fba0-46d7-b3a9-f4cd7eabe75a";
	String keywords="서울";
	String realUrl=mainurl+"&searchKeyword="+URLEncoder.encode(keywords,"UTF-8")+"&appkey="+appkey;
	JSONParser parser= new JSONParser();
	JSONObject searchlist=new JSONObject();
	URL url = new URL(realUrl);
    try {
        URLConnection conn = url.openConnection();
        BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        JSONObject root=(JSONObject)parser.parse(bis);
        JSONObject obj=(JSONObject)root.get("searchPoiInfo");
     /*   JSONArray weather=(JSONArray)obj.get("minutely");
        JSONObject item=(JSONObject)weather.get(0);
        JSONObject codetmp=(JSONObject)item.get("sky");
        String code=(String)codetmp.get("code");
        todayweather.put("sky",item.get("sky"));
        todayweather.put("rain",item.get("rain"));
        todayweather.put("temperature",item.get("temperature"));
        todayweather.put("wind",item.get("wind"));
        todayweather.put("img",getimg(code));*/
        System.out.println(obj);
    } catch (IOException e) {
        e.printStackTrace();
    }
//    	return searchlist;
    
    
    }
}
