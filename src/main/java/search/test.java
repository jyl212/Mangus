package search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class test {
	  public static void main(String[] args) {
	        String clientId = "YIO0_TZ2OUYAQvER4ukq";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "vgynaiLZKW";//애플리케이션 클라이언트 시크릿값";
	        JSONParser parser = new JSONParser(); 
	        Object obj = null;
	        JSONObject newsdata = null; 
	        try {
	            String text = URLEncoder.encode("박근혜", "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text
	            					+"&display=1&sort=date"; // json 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	            obj = parser.parse(response.toString());
	            newsdata = (JSONObject) obj;
	            System.out.println(newsdata.toString());
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	    }
}
