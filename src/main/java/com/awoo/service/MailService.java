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

	@Autowired
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
			map.put("empno", (int)model.getAttribute("empno"));
			map.put("name", sortingName);
			map.put("year", sortingYear);
			map.put("month", sortingMonth);
		
		
			model.addAttribute("mailDataList", dao.getmailList(map));
			model.addAttribute("distinctYear", dao.getMailDistinctYear(map));
			model.addAttribute("distinctSender", dao.getMailDistinctSender(map));
		}
	}
	
	
	
	
	
	
	public void sendEmail(List<MailVO> mailList) {
		
//		String toAddress, String fromAddress,
//		String subject, String msgBody, MultipartFile[] attachment
		
	    
//		String[] sendToArr = mvo.getSendTo();
	    MimeMessagePreparator[] preparators = new MimeMessagePreparator[mailList.size()];
//
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
//	             			// 파일 깨지지 말라고 encodeText 넣어줌
	             			String title = multipartFile.getOriginalFilename();
	             			helper.addAttachment(MimeUtility.encodeText(title,"EUC-KR","B"), multipartFile);
	             		}
	 	            }
	             	mvo.setCountFiles(filecnt);
	    		 }
	    		};
	    		dao.insertMail(mvo);
	    	}
	    	mailSender.send(preparators);
	    }
	    
//	        preparators[i++] =  new MimeMessagePreparator() {
	       

	    
 
//	    MimeMessagePreparator[] preparators = new MimeMessagePreparator[mails.size()];
//
//	    int i = 0;
//	    for(final MailVO vo: mails) {
//	        preparators[i++] =  new MimeMessagePreparator() {
//	            @Override
//	            public void prepare(MimeMessage mimeMessage) throws Exception {
//	                final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//	                helper.setFrom(vo.getFrom());
//	                helper.setTo(vo.getTo());
//	                helper.setSubject(vo.getSubject());
//	                helper.setText(vo.getContents(), true);
//	            }
//	        };
//	    }
//
//	    mailSender.send(preparators);
	
//	
//	public void saveEmail(List<MailVO> mailvo) {
//		
//		for (MailVO mail : mailvo) {
//				
//				dao.insertMail(mail);
//			}
//		}
	}


	










//package com.awoo.service;
//
//import java.io.File;
//
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeUtility;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.FileSystemResource;
//import org.springframework.mail.MailSender;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//import org.springframework.web.multipart.MultipartFile;
//
//
//@Service
//public class MailService {
//
//	@Autowired
//	private JavaMailSenderImpl mailSender;
//	
//	public void sendEmail(String toAddress, String fromAddress,
//					String subject, String msgBody, MultipartFile[] attachment) {
//		
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//	        @Override
//	        public void prepare(MimeMessage mimeMessage) throws Exception {
//	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//	            helper.setFrom(fromAddress);
//	            helper.setTo(toAddress);
//	            helper.setSubject(subject);
//	            helper.setText(msgBody, true);
//            	for (int i = 0; i < attachment.length; i++) {
//            		MultipartFile multipartFile = attachment[i];            		
//            		if(multipartFile.getOriginalFilename() != "") {
//            			// 파일 깨지지 말라고 encodeText 넣어줌
//            			String title = multipartFile.getOriginalFilename();
//            			helper.addAttachment(MimeUtility.encodeText(title,"EUC-KR","B"), multipartFile);
//            		}
//	            }
//	        }
//	    };
//
//	    mailSender.send(preparator);
//	}
//	
//	public void saveEmail(String email, 
//						  String title, 
//						  String content,
//						  MultipartFile[] attachment,
//						  Model model) {
//		int empno = (int)model.getAttribute("empno");
//		map.
//		model.addAttribute("");
//	}
//}
