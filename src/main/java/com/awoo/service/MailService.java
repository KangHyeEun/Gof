package com.awoo.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.awoo.dao.MailDAO;
import com.awoo.dao.MessageDAO;
import com.awoo.vo.MailVO;


@Service
public class MailService {

	private JavaMailSenderImpl mailSender;
	private MailDAO dao;	
	
	public MailService(JavaMailSenderImpl mailSender, MailDAO dao) {
		super();
		this.mailSender = mailSender;
		this.dao = dao;
	}

	
	public void getMailList(Model model){
		String sortingName = (String) model.getAttribute("sortingname");
		String sortingMonth = (String) model.getAttribute("sortingMonth");
		String sortingYear = (String) model.getAttribute("sortingYear");
		int empno = (int)model.getAttribute("empno");

		if (sortingMonth != null && sortingYear != null && sortingName != null) {
//			String sortedDay = sortingYear + "-" + sortingMonth;
			if (sortingMonth.equals("0") || sortingMonth == "0") {
				sortingMonth = null;
			}
			if (sortingYear.equals("0") || sortingYear == "0") {
				sortingYear = null;
			}
			if (sortingMonth != null && sortingMonth.length() == 1) {
				sortingMonth = "0" + sortingMonth;
			}
			if (sortingName.equals("0") || sortingName == "0") {
				sortingName = null;
			}
			
	
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("empno", empno);
			map.put("name", sortingName);
			map.put("year", sortingYear);
			map.put("month", sortingMonth);
		
		
			model.addAttribute("mailDataList", dao.getmailList(map));
			model.addAttribute("distinctYear", dao.getMailDistinctYear(map));
			model.addAttribute("distinctSender", dao.getMailDistinctSender(map));
		}
	}
	
	
	
	
	
	
	public void sendEmail(List<MailVO> mailList) {
		
	    MimeMessagePreparator[] preparators = new MimeMessagePreparator[mailList.size()];

	    int i = 0;
	    for(final MailVO mvo : mailList) {
	    	preparators[i++] =  new MimeMessagePreparator() {
	    		 @Override
	 	        public void prepare(MimeMessage mimeMessage) throws Exception {
	 	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 	            helper.setFrom(mvo.getSendFrom());
	 	            helper.setTo(mvo.getSendTo());
	 	            helper.setSubject(mvo.getTitle());
	 	            helper.setText(mvo.getContent(), true);
	 	            int filecnt = 0;
	             	for (int i = 0; i < mvo.getAttachment().length; i++) {
	             		MultipartFile multipartFile = mvo.getAttachment()[i];            		
	             		if(multipartFile.getOriginalFilename() != "") {
	             			filecnt += 1;
	             			// 파일 깨지지 말라고 encodeText 넣어줌
	             			String title = multipartFile.getOriginalFilename();
	             			helper.addAttachment(MimeUtility.encodeText(title,"EUC-KR","B"), multipartFile);
	             		}
	 	            }
	             	mvo.setCountFiles(filecnt);
	    		 }
	    		};
	    		dao.insertMail(mvo);
	    	}
	    //메일 보내는 곳!
	    	mailSender.send(preparators);
	    }
	    
	
	
	public MailVO getDetailMail(Model model) {
		
		int id = (int)model.getAttribute("id");	
		return dao.getDetailMail(id);
	}
	
	
	// 로그인 인증 메일 보내는 곳
	public void sendAuthMail(Map<String, Object> map) { 
		 
	    MimeMessagePreparator[] preparators = new MimeMessagePreparator[1];
    	preparators[0] =  new MimeMessagePreparator() {
    		 @Override 
 	        public void prepare(MimeMessage mimeMessage) throws Exception {
 	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 	            helper.setFrom("awoogof@gmail.com");
 	            helper.setTo((String)map.get("mail"));
 	            helper.setSubject("[AWOO]인증번호입니다.");
 	            helper.setText(
 	            		"<p><span style=\"font-size:18px\"><u><strong>[AWOO 인증 메세지]</strong></u></span></p>\r\n"
 	            		+ "\r\n"
 	            		+ "<p>이메일 인증은 사원인증 <u><strong>최초 1회</strong></u> 진행됩니다</p>\r\n"
 	            		+ "\r\n"
 	            		+ "<p>아래의 번호를 입력하여 주시기 바랍니다.</p>\r\n"
 	            		+ "\r\n"
 	            		+ "<p><span style=\"color:#2980b9; font-size:15px\"><strong>"+map.get("random").toString()+"</strong></span></p>\r\n"
 	            		+ "\r\n"
 	            		+ "<p>&nbsp;</p>\r\n"
 	            		+ ""
 	            		, true);
 	            }
			};
		//메일 보내는 곳!
			mailSender.send(preparators);
		}
	    
	
}

