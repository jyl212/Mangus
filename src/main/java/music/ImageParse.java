package music;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.Tag;
import org.jaudiotagger.tag.TagException;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

@Service
public class ImageParse {
	public String image(String file_name, HttpServletRequest req) throws IOException{
		
		String path=WebUtils.getRealPath(req.getSession().getServletContext(),"/resources/mp3file");
		System.out.println(path);
		
		File file = new File(path+"\\"+file_name);
		MP3File mp3 = null;
		try {
			mp3 = (MP3File) AudioFileIO.read(file);
			} 
		catch (CannotReadException | IOException | TagException | ReadOnlyFileException | InvalidAudioFrameException e) {
			e.printStackTrace();
			}
		Tag tag = mp3.getTag();
		  
		byte[] image = tag.getFirstArtwork().getBinaryData();

		BufferedImage bImage = ImageIO.read(ImageIO.createImageInputStream(new ByteArrayInputStream(image)));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bImage, "jpg", baos);
		baos.flush();
		byte[] imageInByteArray = baos.toByteArray();
		baos.close();
		String base64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
		
		return base64;
	}

}
