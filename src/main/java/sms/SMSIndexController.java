package sms;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SMSIndexController {
	
	@Autowired
	SmsService service;
	
	@RequestMapping(value="/sms/index.do", method=RequestMethod.GET)
	public ModelAndView index(@RequestParam String id) {
		ModelAndView mav=new ModelAndView();

		List<GroupVO> glist = service.glist(id);
		mav.addObject("glist", glist);
		
		List<PhoneVO> plist = service.plist(id);
		mav.addObject("plist", plist);
		
		mav.setViewName("sms");
		return mav;
	}
	
	@RequestMapping(value="/sms/send.do", method=RequestMethod.POST)
	public String send(HttpServletRequest request, @RequestParam String id) throws Exception{
		ModelAndView mav=new ModelAndView();

		String sms_url = "";
		sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청
		String user_id = "ambidexter27"; // 아이디
		String secure = "4cc7bbdeb5c687772af240245410e8f6";// 인증키

		try {
			user_id = SMS.base64Encode(user_id);
			secure = SMS.base64Encode(secure);// 인증키
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} // SMS아이디

		String msg = request.getParameter("msg");
		String rphone=request.getParameter("rphone"); //그룹, 개인으로
		String sphone=request.getParameter("phone");
		
		System.out.println(sphone);
		String sphone1 = sphone.substring(0,3); //나중에 user꺼로 변경
		System.out.println(sphone1);
		String sphone2 = sphone.substring(3,7);
		System.out.println(sphone2);
		String sphone3 = sphone.substring(7,11);
		System.out.println(sphone3);
		String rdate = "";
		String rtime = "";
		String mode = "";

		System.out.println(msg);
		System.out.println(rphone);
		System.out.println(sphone1);
		System.out.println(sphone2);
		System.out.println(sphone3);
		try {
			msg = SMS.base64Encode(msg);
			rphone = SMS.base64Encode(rphone);
			sphone1 = SMS.base64Encode(sphone1);
			sphone2 = SMS.base64Encode(sphone2);
			sphone3 = SMS.base64Encode(sphone3);
			rdate = SMS.base64Encode(rdate);
			rtime = SMS.base64Encode(rtime);
			mode = SMS.base64Encode("1");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String subject = "";
		String testflag = "";
		String destination = "";
		String repeatFlag = "";
		String repeatNum = "";
		String repeatTime = "";
		String returnurl = "";
		String nointeractive = "";
		String smsType = "";

		// 스플릿...
		String[] host_info = sms_url.split("/");// https:
		String host = host_info[2];// host=/sslsms.cafe24.com
		String path = "/" + host_info[3];// path=/sms_sender.php
		int port = 80;

		// 데이터 맵핑 변수 정의
		String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3",
				"rdate", "rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime",
				"smsType", "subject" };
		String valKey[] = new String[arrKey.length];
		valKey[0] = user_id;
		valKey[1] = secure;
		valKey[2] = msg;
		valKey[3] = rphone;
		valKey[4] = sphone1;
		valKey[5] = sphone2;
		valKey[6] = sphone3;//필수
		valKey[7] = rdate;//필수X
		valKey[8] = rtime;
		valKey[9] = mode;
		valKey[10] = testflag;
		valKey[11] = destination;
		valKey[12] = repeatFlag;
		valKey[13] = repeatNum;
		valKey[14] = repeatTime;
		valKey[15] = smsType;
		valKey[16] = subject;

		String boundary = "";
		Random rnd = new Random();
		String rndKey = Integer.toString(rnd.nextInt(32000));
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] bytData = rndKey.getBytes();
		md.update(bytData);
		byte[] digest = md.digest();
		for (int i = 0; i < digest.length; i++) {
			boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
		}
		boundary = "---------------------" + boundary.substring(0, 11);

		// 본문 생성
		String data = "";
		String index = "";
		String value = "";
		for (int i = 0; i < arrKey.length; i++) {
			index = arrKey[i];
			value = valKey[i];
			data += "--" + boundary + "\r\n";
			data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
			data += "\r\n" + value + "\r\n";
			data += "--" + boundary + "\r\n";
		}

		try {
			System.out.println("전송성공");
			InetAddress addr = InetAddress.getByName(host);
			Socket socket = new Socket(host, port); // host=/sslsms.cafe24.com
													// port 80
			// 헤더 전송
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
			wr.write("POST " + path + " HTTP/1.0\r\n"); // path=/sms_sender.php
			wr.write("Content-Length: " + data.length() + "\r\n");
			wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
			wr.write("\r\n");

			// 데이터 전송
			wr.write(data);
			wr.flush();

			// 결과값 얻기
			BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
			String line;
			String alert = "";
			ArrayList tmpArr = new ArrayList();
			while ((line = rd.readLine()) != null) {
				tmpArr.add(line);
			}
			wr.close();
			rd.close();
			String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
			String[] rMsg = tmpMsg.split(",");
			String Result = rMsg[0]; // 발송결과
			String Count = ""; // 잔여건수
			if (rMsg.length > 1) {
				Count = rMsg[1];
			}

			// 발송결과 알림
			if (Result.equals("success")) {
				alert = "성공적으로 발송하였습니다.";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("reserved")) {
				alert = "성공적으로 예약되었습니다";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("3205")) {
				alert = "잘못된 번호형식입니다.";
			} else {
				alert = "[Error]" + Result;
			}
			System.out.println(nointeractive);

			if (nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success"))
					&& !(Result.equals("reserved"))) {
				System.out.println("<script>alert('" + alert + "')</script>");
			} else if (!(nointeractive.equals("1"))) {
				System.out.println("<script>alert('" + alert + "')</script>");
			}

			System.out.println("<script>location.href='" + returnurl + "';</script>");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/sms/index.do?id="+id;
	}
	
	@RequestMapping(value="/sms/ginsert.do", method=RequestMethod.POST)
	public String ginsert(HttpServletRequest request, GroupVO group) {
		String id = request.getParameter("id");
		System.out.println(id);
		service.gInsert(group);
		
		return "redirect:/sms/index.do?id="+id;
	}
	
	@RequestMapping(value="/sms/pinsert.do", method=RequestMethod.POST)
	public String ginsert(HttpServletRequest request, PhoneVO phone) {
		String id = request.getParameter("id");
		
		System.out.println("title code : "+phone.getTitle_code());
		System.out.println("title code : "+request.getParameter("title_code"));
		
		service.pInsert(phone);
		
		return "redirect:/sms/index.do?id="+id;
	}
	
	@RequestMapping(value="/sms/gDelete.do", method=RequestMethod.GET)
	public String gDelete(@RequestParam String title_code, @RequestParam String id) {
		service.gDelete(title_code);
		
		return "redirect:/sms/index.do?id="+id;
	}
	
	@RequestMapping(value="/sms/pDelete.do", method=RequestMethod.GET)
	public String pDelete(@RequestParam String phone, @RequestParam String id) {
		service.pDelete(phone);
		
		return "redirect:/sms/index.do?id="+id;
	}
	
}
