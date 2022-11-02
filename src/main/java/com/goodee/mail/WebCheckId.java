package com.goodee.mail;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

@WebServlet("/WebCheckId")
public class WebCheckId extends HttpServlet {
	
	String to = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getContentType().startsWith("multipart/form-data")) {
			try {
				HashMap data = getMailData(request, response);
				System.out.println("1111111");
				RequestDispatcher rd;
				if(sendMail(data, request, response)) {
//					rd = request.getRequestDispatcher("/loginOK");
					response.sendRedirect(request.getContextPath()+"/loginOK");
				}
				else {
//					rd = request.getRequestDispatcher("/WEB-INF/views/message/failPage.jsp");
					response.sendRedirect(request.getContextPath()+"/loginFail");
				}
//				rd.forward(request, response);
				

//				ServletContext sc = getServletContext();
//				RequestDispatcher rd = sc.getRequestDispatcher(request.getContextPath()+"/WEB-INF/views/message/sendEmail.jsp");
			} catch (MessagingException ex) {
				throw new ServletException(ex);
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}

	private HashMap getMailData(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, MessagingException {
		System.out.println("2222222222");
		String boundary = request.getHeader("Content-Type");
		int pos = boundary.indexOf('=');
		boundary = boundary.substring(pos + 1);
		boundary = "--" + boundary;
		ServletInputStream in = request.getInputStream();
		byte[] bytes = new byte[512];
		int state = 0;
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		String name = null, value = null, filename = null, contentType = null;
		HashMap mailData = new HashMap();

		int i = in.readLine(bytes, 0, 512);
		while (-1 != i) {
			String st = new String(bytes, 0, i);
			if (st.startsWith(boundary)) {
				state = 0;
				if (null != name) {
					if (value != null)
						// -2 to remove CR/LF
						mailData.put(name, value.substring(0, value.length() - 2));
					else if (buffer.size() > 2) {
						MimeBodyPart bodyPart = new MimeBodyPart();
						DataSource ds = new ByteArrayDataSource(buffer.toByteArray(), contentType, filename);
						bodyPart.setDataHandler(new DataHandler(ds));
						bodyPart.setDisposition("attachment; filename=\"" + filename + "\"");
						bodyPart.setFileName(filename);
						mailData.put(name, bodyPart);
					}
					name = null;
					value = null;
					filename = null;
					contentType = null;
					buffer = new ByteArrayOutputStream();
				}
			} else if (st.startsWith("Content-Disposition: form-data") && state == 0) {
				StringTokenizer tokenizer = new StringTokenizer(st, ";=\"");
				while (tokenizer.hasMoreTokens()) {
					String token = tokenizer.nextToken();
					if (token.startsWith(" name")) {
						name = tokenizer.nextToken();
						state = 2;
					} else if (token.startsWith(" filename")) {
						filename = tokenizer.nextToken();
						StringTokenizer ftokenizer = new StringTokenizer(filename, "\\/:");
						filename = ftokenizer.nextToken();
						while (ftokenizer.hasMoreTokens())
							filename = ftokenizer.nextToken();
						state = 1;
						break;
					}
				}
			} else if (st.startsWith("Content-Type") && state == 1) {
				pos = st.indexOf(":");
				// + 2 to remove the space
				// - 2 to remove CR/LF
				contentType = st.substring(pos + 2, st.length() - 2);
			} else if (st.equals("\r\n") && state == 1)
				state = 3;
			else if (st.equals("\r\n") && state == 2)
				state = 4;
			else if (state == 4)
				value = value == null ? st : value + st;
			else if (state == 3)
				buffer.write(bytes, 0, i);
			i = in.readLine(bytes, 0, 512);
		}
		return mailData;
	}

	private boolean sendMail(HashMap mailData, HttpServletRequest request, HttpServletResponse response){
		System.out.println("33333333333333");
		  	System.setProperty("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
	        System.setProperty("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
	        System.setProperty("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
	        System.setProperty("mail.smtp.port", "587"); // gmail 포트

	        String keyPassword = (String)mailData.get("keyPassword");
	        String from = (String)mailData.get("from");
	        
	        //구글 인증
	        Authenticator auth = new MyAuthentication(keyPassword, from);
	        Message msg = new MimeMessage(Session.getDefaultInstance(System.getProperties(), auth));
	        
	        to = "error@error.com";
	        
	        try {
				
			
	        //받는사람
	        InternetAddress[] tos = InternetAddress.parse(to);
	        msg.setRecipients(Message.RecipientType.TO, tos);
	        //한글을 위한 인코딩
	        msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
	        //제목
	        msg.setSubject("");
	        msg.setSentDate(new Date());
//	        System.out.println(mailData.get("attachment")+"첨부파일");
	        //첨부파일이 없으면 내용만 전송
//	        if(null == mailData.get("attachment")){
	                 msg.setText("");
//	          } else {
//	            //첨부파일이 있으면
//	        	  BodyPart body = new MimeBodyPart();
//	              BodyPart attachment = (BodyPart)mailData.get("attachment");
//	              body.setText((String)mailData.get("body"));
//	              MimeMultipart multipart = new MimeMultipart();
//	              multipart.addBodyPart(body);
//	              multipart.addBodyPart(attachment);
//	              msg.setContent(multipart, "text/plain; charset=UTF-8");
//	           }
	        //전송
	        	
	            Transport.send(msg);	
	            System.out.println("여기는 성공");
				return true;
	        } catch (Exception e) {
	        	System.out.println("여기로 오니?");
				e.printStackTrace();
				return false;
			}        		
	        
			
	}

	class MyAuthentication extends Authenticator {
		private PasswordAuthentication pa;
		private String id;
		private String pw;

		private MyAuthentication(String keyPassword, String from) {
			System.out.println("44444444444444");
			
			System.out.println(keyPassword);
			System.out.println(from);
			id = from; 
			pw = keyPassword; 
			pa = new PasswordAuthentication(id, pw);
		}

		// �떆�뒪�뀥�뿉�꽌 �궗�슜�븯�뒗 �씤利앹젙蹂�
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}

}
