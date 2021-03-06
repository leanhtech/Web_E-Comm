package ptithcm.bean;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("mailer")
public class Mailer {

	@Autowired
	JavaMailSender mailer;
	
	@Autowired
	@Qualifier("attachfile")
	UploadFile baseAttachFile;
	
	public void send(String from, String to, String subject, String body, MultipartFile attachments) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("quangtuong64@gmail.com", from);
			helper.setTo(to);
			helper.setReplyTo("quangtuong64@gmail.com");
			helper.setSubject(subject);
			helper.setText(body, true);
			
			if(!attachments.isEmpty())
			{
				String baseUploadFile = baseAttachFile.getBasePath() + File.separator + attachments.getOriginalFilename();
				attachments.transferTo(new File(baseUploadFile));
				
				FileSystemResource file1 = new FileSystemResource(new File(baseUploadFile));
				helper.addAttachment(attachments.getOriginalFilename(), file1);
			}
			
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public void send(String from, String to, String subject, String body) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("quangtuong64@gmail.com", from);
			helper.setTo(to);
			helper.setReplyTo("quangtuong64@gmail.com");
			helper.setSubject(subject);
			helper.setText(body, true);}
			catch (Exception e) {
				throw new RuntimeException(e);
			}
	}
	
	public void sendPassword(String newPass, String email) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("quangtuong64@gmail.com", "HTT Store");
			helper.setTo(email);
			helper.setReplyTo("quangtuong64@gmail.com");
			helper.setSubject("HTT Store - M???t kh???u m???i cho t??i kho???n");
			helper.setText("<p>????y l?? m???t kh???u m???i cho t??i kho???n c???a b???n: <b>" + newPass + "</b></p><p>B???n c?? th??? ?????i m???t kh???u sau khi ????ng nh???p. Th??n g???i!</p>", true);
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void sendCREATEsuccessfully(String to,String userName) {
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setFrom("quangtuong64@gmail.com");
			helper.setTo(to);
			helper.setReplyTo("quangtuong64@gmail.com");
			helper.setSubject("HTT Store - Ch??c m???ng b???n ???? ????ng k?? t??i kho???n t???i DTT th??nh c??ng");
			helper.setText("<p>B???n ???? ????ng k?? t??i kho???n th??nh c??ng. T??n ????ng nh???p c???a b???n l??:  "+userName+". Th??n g???i!</p>", true);
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}