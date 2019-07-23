package Mail;
import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    public static boolean send(String to, String sub,
            String msg) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("sky.knight.dn97@gmail.com", "ngovandon");
            }

        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain;charset=UTF-8");
            message.setFrom(new InternetAddress("sky.knight.dn97@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);
            Transport.send(message);

        } catch (MessagingException e) {
            return false;
        }
        return true;
    }
}
