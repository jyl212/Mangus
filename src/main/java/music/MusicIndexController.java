package music;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

@Controller
public class MusicIndexController {
	
	@Autowired
	music.MusicService service;
	@Autowired
	music.FileUploadLogic uploadservice;
	
	@RequestMapping("/music/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();

		mav.setViewName("music");
		return mav;
	}
	
	@RequestMapping(value="/music/insert.do", method=RequestMethod.GET)
	public String insert(MusicVO music, HttpServletRequest req) throws Exception{
		System.out.println(music);
		System.out.println(","+music.getFiles().length);
		
		MultipartFile[] files = music.getFiles();
		String path = WebUtils.getRealPath(req.getSession().getServletContext(), "/WEB-INF/mp3file");
		
		ArrayList<String> filelist = new ArrayList<String>();
		for(int i=0 ; i<files.length ; i++) {
			String fileName = files[i].getOriginalFilename();
			if(fileName.length()!=0) {
				filelist.add(fileName);
				System.out.println("file:"+fileName);
				uploadservice.upload(files[i], path, fileName);
			}
		}
		//service.insert(music, filelist);
		return "redirect:/music/index.do";
	}
	
	
}
