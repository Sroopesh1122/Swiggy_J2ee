package com.app.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
 
	private static final String SMTP_HOST = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;

    public static void sendEmail(String toEmail, String subject, String messageBody) throws MessagingException {
        // Email credentials
        final String username = "foodieteam2025@gmail.com";
        final String password = "pxkf sfjp mkth nrvh";

        // SMTP properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Create a session with the SMTP server
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // Create the email message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setText(messageBody);

        // Send the email
        Transport.send(message);
        System.out.println("Email sent successfully to " + toEmail);
    }
	
}
