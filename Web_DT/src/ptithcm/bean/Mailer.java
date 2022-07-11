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
			helper.setSubject("HTT Store - Mật khẩu mới cho tài khoản");
			helper.setText("<p>Đây là mật khẩu mới cho tài khoản của bạn: <b>" + newPass + "</b></p><p>Bạn có thể đổi mật khẩu sau khi đăng nhập. Thân gửi!</p>", true);
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
			helper.setSubject("HTT Store - Chúc mừng bạn đã đăng kí tài khoản tại DTT thành công");
			helper.setText("<p>Bạn đã đăng kí tài khoản thành công. Tên đăng nhập của bạn là:  "+userName+". Thân gửi!</p>", true);
			mailer.send(mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}