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
import org.springframework.stereotype.Service;

@Service
public class Weather {
	public JSONObject getminutely() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/current/minutely?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String city="서울";
		String county="강북구";
		String village="수유동";
		String realUrl=mainurl+"&city="+URLEncoder.encode(city,"UTF-8")+"&county="+URLEncoder.encode(county,"UTF-8")+"&village="+URLEncoder.encode(village,"UTF-8")+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		JSONObject todayweather=new JSONObject();
		URL url = new URL(realUrl);
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONArray weather=(JSONArray)obj.get("minutely");
            JSONObject item=(JSONObject)weather.get(0);
            JSONObject codetmp=(JSONObject)item.get("sky");
            String code=(String)codetmp.get("code");
            todayweather.put("sky",item.get("sky"));
            todayweather.put("rain",item.get("rain"));
            todayweather.put("temperature",item.get("temperature"));
            todayweather.put("wind",item.get("wind"));
            todayweather.put("img",getimg(code));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return todayweather;
	}
	public JSONObject threedays() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/forecast/3days?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String city="서울";
		String county="강북구";
		String village="수유동";
		String realUrl=mainurl+"&city="+URLEncoder.encode(city,"UTF-8")+"&county="+URLEncoder.encode(county,"UTF-8")+"&village="+URLEncoder.encode(village,"UTF-8")+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		JSONObject daysweather=new JSONObject();
		URL url = new URL(realUrl);
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONArray daysinfo=(JSONArray)obj.get("forecast3days");
            JSONObject weathers=(JSONObject)daysinfo.get(0);
            JSONObject weatherlist=(JSONObject)weathers.get("fcst3hour");
            JSONObject skys=(JSONObject)weatherlist.get("sky");
            JSONObject precipitations=(JSONObject)weatherlist.get("precipitation");
            JSONObject temperatures=(JSONObject)weatherlist.get("temperature");
            JSONObject winds=(JSONObject)weatherlist.get("wind");
            JSONObject fcstdaily=(JSONObject)weathers.get("fcstdaily");
            JSONObject daylist=(JSONObject)fcstdaily.get("temperature");
            JSONArray codelist=new JSONArray();
            JSONArray namelist=new JSONArray();
            JSONArray problist=new JSONArray();
            JSONArray typelist=new JSONArray();
            JSONArray templist=new JSONArray();
            JSONArray wspdlist=new JSONArray();
            JSONArray daysmaxtemp=new JSONArray();
            JSONArray daysmintemp=new JSONArray();
            JSONArray imglist=new JSONArray();
			for (int j = 4; j <= 49; j = j + 3) {
				String codekeyword="code"+j+"hour";
				String namekeyword="name"+j+"hour";
				String probkeyword="prob"+j+"hour";
				String typekeyword="type"+j+"hour";
				String tempkeyword="temp"+j+"hour";
				String wspdkeyword="wspd"+j+"hour";
				String img=getimg((String)skys.get(codekeyword));
				codelist.add(skys.get(codekeyword));
				namelist.add(skys.get(namekeyword));
				problist.add(precipitations.get(probkeyword));
				typelist.add(precipitations.get(typekeyword));
				wspdlist.add(winds.get(wspdkeyword));
				templist.add(temperatures.get(tempkeyword));
				imglist.add(img);
			}
			for(int i=2;i<=3;i++) {
				String maxkeyword="tmax"+i+"day";
				String minkeyword="tmin"+i+"day";
				daysmaxtemp.add(daylist.get(maxkeyword));
				daysmintemp.add(daylist.get(minkeyword));
			}
			daysweather.put("imglist",imglist);
			daysweather.put("codelist",codelist);
			daysweather.put("namelist",namelist);
			daysweather.put("problist",problist);
			daysweather.put("typelist",typelist);
			daysweather.put("wspdlist",wspdlist);
			daysweather.put("templist",templist);
			daysweather.put("daysmaxtemp",daysmaxtemp);
			daysweather.put("daysmintemp",daysmintemp);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return daysweather;
	}
	public String wct() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/index/wct?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String lat="37.1234";
		String lon="126.1234";
		String realUrl=mainurl+"&lat="+lat+"&lon="+lon+"&village="+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		URL url = new URL(realUrl);
		String index="";
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONObject wIdex=(JSONObject)obj.get("wIndex");
            JSONArray wctIndex=(JSONArray)wIdex.get("wctIndex");
            JSONObject wct=(JSONObject)wctIndex.get(0);
            JSONObject current=(JSONObject)wct.get("current");
            index=(String)current.get("index");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return index;
	}
	public int th() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/index/th?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String lat="37.1234";
		String lon="126.1234";
		String realUrl=mainurl+"&lat="+lat+"&lon="+lon+"&village="+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		URL url = new URL(realUrl);
		String index="";
		int result=0;
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONObject wIdex=(JSONObject)obj.get("wIndex");
            JSONArray thIndex=(JSONArray)wIdex.get("thIndex");
            JSONObject th=(JSONObject)thIndex.get(0);
            JSONObject forecast=(JSONObject)th.get("forecast");
            index=(String)forecast.get("index4hour");
            index=index.substring(0,index.length()-3);
            result=Integer.parseInt(index);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return result;
	}
	public String uv() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/index/uv?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String lat="37.1234";
		String lon="126.1234";
		String realUrl=mainurl+"&lat="+lat+"&lon="+lon+"&village="+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		URL url = new URL(realUrl);
		String index="";
        
		try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONObject wIdex=(JSONObject)obj.get("wIndex");
            JSONArray uvindex=(JSONArray)wIdex.get("uvindex");
            JSONObject uv=(JSONObject)uvindex.get(0);
            JSONObject comment=(JSONObject)uv.get("day00");
            index=(String)comment.get("comment");
            if(index.equals("")) {
            	comment=(JSONObject)uv.get("day01");
            	index=(String)comment.get("comment");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
        return index;
	}
	public String lun() throws Exception{
		String mainurl="https://api2.sktelecom.com/weather/index/laundry?version=2";
		String appkey="846807fe-c79d-4457-962e-613d34311552";
		String lat="37.1234";
		String lon="126.1234";
		String realUrl=mainurl+"&lat="+lat+"&lon="+lon+"&village="+"&appkey="+appkey;
		JSONParser parser= new JSONParser();
		URL url = new URL(realUrl);
		String index="";
        try {
            URLConnection conn = url.openConnection();
            BufferedReader bis=  new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            JSONObject root=(JSONObject)parser.parse(bis);
            JSONObject obj=(JSONObject)root.get("weather");
            JSONObject wIdex=(JSONObject)obj.get("wIndex");
            JSONArray laundry=(JSONArray)wIdex.get("laundry");
            JSONObject dry=(JSONObject)laundry.get(0);
            JSONObject comment=(JSONObject)dry.get("day00");
            index=(String)comment.get("comment");
            if(index.equals("")) {
            	comment=(JSONObject)dry.get("day01");
            	index=(String)comment.get("comment");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return index;
	}
	public String getimg(String code) {
		String src="";
		switch (code) {
			case "SKY_S01":
			case "SKY_A01":
				src="sun.PNG";
				break;
			case "SKY_S02":
			case "SKY_A02":
				src="cloudesun.PNG";
				break;
			case "SKY_S03":
			case "SKY_A03":
				src="manycloude.PNG";
				break;
			case "SKY_S08":
			case "SKY_S04":
			case "SKY_A08":
			case "SKY_A04":
				src="clouderain.PNG";
				break;
			case "SKY_S09":
			case "SKY_S05":
			case "SKY_A09":
			case "SKY_A05":
				src="cloudesnow.PNG";
				break;
			case "SKY_S10":
			case "SKY_S06":
			case "SKY_A10":
			case "SKY_A06":
				src="rainorsnow.PNG";
				break;
			case "SKY_S07":
			case "SKY_A07":
				src="cloude.PNG";
				break;
			case "SKY_S11":
			case "SKY_A11":
				src="Lightning.PNG";
				break;
			case "SKY_S12":
			case "SKY_A12":
				src="Lightningrain.PNG";
				break;
			case "SKY_S13":
			case "SKY_A13":
				src="Lightningsnow.PNG";
				break;
			case "SKY_S14":
			case "SKY_A14":
				src="Lightningrainorsnow.PNG";
				break;
		}
		return src;
	}
}
