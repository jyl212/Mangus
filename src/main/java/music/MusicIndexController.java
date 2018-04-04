package music;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.parser.mp3.Mp3Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import member.MemberVO;

@Controller
public class MusicIndexController {

	@Autowired
	music.MusicService service;
	@Autowired
	music.FileUploadLogic uploadservice;
	@Autowired
	music.ImageParse imageParse;

	@RequestMapping("/music/index.do")
	public ModelAndView index(@RequestParam String id, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		List<MusicVO> musicList_T = service.selectMusicList_T(id);
		List<MusicVO> musicList_F = service.selectMusicList_F(id);
		List<MusicVO> musicLike = service.selectLikeMusic(id);

		List<MusicVO> musicList_T_P = new ArrayList<>();
		List<MusicVO> musicList_F_P = new ArrayList<>();
		MusicVO musicdata = null;

		for (int i = 0; i < musicList_T.size(); i++) {
			try {
				String photo = imageParse.image(musicList_T.get(i).file_name, req);

				musicdata = new MusicVO(musicList_T.get(i).file_name, musicList_T.get(i).genre,
						musicList_T.get(i).artist, musicList_T.get(i).count, musicList_T.get(i).list,
						musicList_T.get(i).title, photo);
				musicList_T_P.add(musicdata);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for (int i = 0; i < musicList_F.size(); i++) {
			try {
				String photo = imageParse.image(musicList_F.get(i).file_name, req);

				musicdata = new MusicVO(musicList_F.get(i).file_name, musicList_F.get(i).genre,
						musicList_F.get(i).artist, musicList_F.get(i).count, musicList_F.get(i).list,
						musicList_F.get(i).title, photo);
				musicList_F_P.add(musicdata);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		mav.addObject("musicList_T_P", musicList_T_P);
		mav.addObject("musicList_F_P", musicList_F_P);
		mav.addObject("musicLike",musicLike);

		mav.setViewName("music");
		return mav;
	}

	@RequestMapping(value = "/music/insert.do", method = RequestMethod.POST)
	public String insert(MusicVO music, HttpServletRequest req, @RequestParam String id) throws Exception {

		MultipartFile[] filesrc = music.getFilesrc();
		String path = WebUtils.getRealPath(req.getSession().getServletContext(), "/resources/mp3file");

		ArrayList<String> filelist = new ArrayList<String>();

		for (int i = 0; i < filesrc.length; i++) {
			String fileName = filesrc[i].getOriginalFilename();
			if (fileName.length() != 0) {
				filelist.add(fileName);
				uploadservice.upload(filesrc[i], path, fileName);

				try {
					InputStream input = new FileInputStream(new File(path + "\\" + fileName));
					ContentHandler handler = new DefaultHandler();
					Metadata metadata = new Metadata();
					Parser parser = new Mp3Parser();
					ParseContext parseCtx = new ParseContext();
					parser.parse(input, handler, metadata, parseCtx);
					input.close();

					MusicVO insertMusic = new MusicVO(fileName, metadata.get("xmpDM:genre"),
							metadata.get("xmpDM:artist"), id, 0, "F", metadata.get("title"));
					service.insert(insertMusic);

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (SAXException e) {
					e.printStackTrace();
				} catch (TikaException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return "redirect:/music/index.do?id="+id;
	}
	
	@RequestMapping(value="/music/count.do",method=RequestMethod.GET)
	@ResponseBody
	public String count(@RequestParam String id, MusicVO music, HttpServletRequest req) {
		
		return service.updateCountMusic(music);
	}
	
	@RequestMapping(value="/music/update_T.do",method=RequestMethod.GET)
	@ResponseBody
	public String update_T(@RequestParam String id, MusicVO music, HttpServletRequest req) {
		service.updateMusicList_T(music);
		
		return "redirect:/music/index.do?id="+id; 
	}
	
	@RequestMapping(value="/music/update_F.do",method=RequestMethod.GET)
	@ResponseBody
	public String update_F(@RequestParam String id, MusicVO music, HttpServletRequest req) {
		service.updateMusicList_F(music);
		
		return "redirect:/music/index.do?id="+id;
	}
	
	
}
