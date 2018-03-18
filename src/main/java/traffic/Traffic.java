package traffic;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Service
public class Traffic{
	public JSONObject getGeo(String address) throws Exception{
		DocumentBuilderFactory factory	= DocumentBuilderFactory.newInstance();
		String mainurl="http://maps.googleapis.com/maps/api/geocode/xml?";
		String realUrl=mainurl+"&address="+URLEncoder.encode(address,"UTF-8")+"&language=ko&sensor=false";
		DocumentBuilder builder = factory.newDocumentBuilder();
		JSONObject geo=new JSONObject();
		URL url = new URL(realUrl);
        try {
            URLConnection conn = url.openConnection();
            BufferedInputStream bis = new BufferedInputStream(url.openStream());
            Document document = builder.parse(bis);
            Element root = document.getDocumentElement();
            NodeList item=root.getElementsByTagName("formatted_address");
            geo.put("name",item.item(0).getTextContent());
            Node item2=root.getElementsByTagName("location").item(0);
            NodeList itemlist=item2.getChildNodes();
            for(int i=0;i<itemlist.getLength();i++) {
            	Node child=itemlist.item(i);
            	if(child.getNodeName()=="lat") {
            		geo.put("lat",child.getTextContent());
            	}else if(child.getNodeName()=="lng") {
            		geo.put("lng",child.getTextContent());
            	}
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return geo;
	}
}
