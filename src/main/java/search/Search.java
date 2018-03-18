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

public class Search {
	
	public StringBuffer News(String keyeword) throws Exception{
		String clientId = "YIO0_TZ2OUYAQvER4ukq";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "vgynaiLZKW";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = new StringBuffer();
        JSONParser parser = new JSONParser();
        Object obj;
        JSONObject jsonObj = new JSONObject();
        try {
            String text = URLEncoder.encode(keyeword, "UTF-8");
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

            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            obj = parser.parse(response.toString());
            jsonObj = (JSONObject)obj;
        } catch (Exception e) {
            System.out.println(e);
        }
		return response;
	}
	
	
	
	
	
}
