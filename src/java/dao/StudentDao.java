package dao;

import dbconn.DBConnection;
import dto.FetchLinkDto;
import dto.SaveLinkDto;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author haris
 */
public class StudentDao {
    public boolean verifyStudent(String userId, String password) throws SQLException{
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from student where enrollment=? and password=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
           return true; // user exist
        }
        return false;   // user does not exist
    }
    public static String studentName(String enrollment) throws SQLException{
        String name = "";
        Connection conn = DBConnection.getConnect();
        String query = "SELECT name from student where enrollment=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enrollment);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            name = rs.getString(1);
            conn.close();
            return name;
        }
        conn.close();
        return name;
    }
    public ArrayList<FetchLinkDto> fetchLinks(String enrollment) throws SQLException{
        ArrayList<FetchLinkDto> linkDtoList = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT class_link.date, class_link.period, course.course_name, teacher.name, class_link.link from student INNER JOIN class_link ON class_link.class_id=student.class_id INNER JOIN study ON study.course_code=class_link.course_code AND study.enrollment=student.enrollment INNER JOIN course ON course.course_code=study.course_code INNER JOIN teaches1 ON teaches1.class_id=class_link.class_id AND teaches1.course_code=class_link.course_code INNER JOIN teacher ON teacher.t_id=teaches1.t_id WHERE date=? and student.enrollment=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        pstmt.setString(2, enrollment);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            linkDtoList.add(new FetchLinkDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        conn.close();
        return linkDtoList;
    }
    
    
    
    
    
    
    
    
//    public static void main(String[] args) throws SQLException {
//        TeacherDao td = new TeacherDao();
//        td.verifyTeacher("101", "teacher");
//            Date d = new Date();
//            System.out.println(d);
////            d.setMonth(0);
//            System.out.println(d);
//            System.out.println(d.getDate()+"/"+(d.getMonth()+1)+"/"+(1900+d.getYear()));
        
//    }
}

