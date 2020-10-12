package dao;
import dbconn.DBConnection;
import dto.CourseDto;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author haris
 */
public class TeacherDao {
    public boolean verifyTeacher(String userId, String password) throws SQLException{
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from teacher where t_id=? and password=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            conn.close();
           return true; // user exist
        }
        conn.close();
        return false;   // user does not exist
    }
    public static String teacherName(String t_id) throws SQLException{
        String name = "";
        Connection conn = DBConnection.getConnect();
        String query = "SELECT name from teacher where t_id=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, t_id);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            name = rs.getString(1);
            conn.close();
            return name;
        }
        conn.close();
        return name;
    }
    public static ArrayList<CourseDto> courses(String t_id) throws SQLException{
        ArrayList<CourseDto> courseDtoList = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT course.course_code, course.course_name FROM course INNER JOIN teaches1 ON teaches1.course_code = course.course_code where teaches1.t_id=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, t_id);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            CourseDto cd = new CourseDto(rs.getString(1), rs.getString(2));
            courseDtoList.add(cd);
        }
        conn.close();
        return courseDtoList;
    }
    public boolean saveLinks(String t_id, dto.SaveLinkDto objSLD){
        String query = "REPLACE INTO class_link(date, period, class_id, course_code, link) VALUES";
        if(objSLD.getLink1()!=null){
            query = query+"('"+objSLD.getDate()+"','08:30 AM to 09:30 AM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink1()+"'),";
        }
        if(objSLD.getLink2()!=null){
            query = query+"('"+objSLD.getDate()+"','09:30 AM to 10:30 AM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink2()+"'),";
        }
        if(objSLD.getLink3()!=null){
            query = query+"('"+objSLD.getDate()+"','10:30 AM to 11:30 AM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink3()+"'),";
        }
        if(objSLD.getLink4()!=null){
            query = query+"('"+objSLD.getDate()+"','11:30 AM to 12:30 PM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink4()+"'),";
        }
        if(objSLD.getLink5()!=null){
            query = query+"('"+objSLD.getDate()+"','01:00 PM to 02:00 PM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink5()+"'),";
        }
        if(objSLD.getLink6()!=null){
            query = query+"('"+objSLD.getDate()+"','02:00 PM to 03:00 PM', (SELECT class_id FROM teaches1 WHERE t_id="+t_id+" AND course_code='"+objSLD.getCourse()+"'),'"+objSLD.getCourse()+"','"+objSLD.getLink6()+"'),";
        }
        query = query.substring(0,(query.length()-1));
        PreparedStatement pstmt;
        try {
            Connection conn = DBConnection.getConnect();
            pstmt = conn.prepareStatement(query);
        
            int x = pstmt.executeUpdate();
            if(x != 0){
                conn.close();
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
        return false;
    }
   
}
