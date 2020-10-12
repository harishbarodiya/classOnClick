<%@page import="dao.StudentDao" %>
<%@page import="dao.TeacherDao" %>
<%
String userType = request.getParameter("user");
String userId = request.getParameter("userid");
String password = request.getParameter("password");
//out.print(userType+" \n"+userId+"\n"+password);

if(userType.equals("teacher")){
    TeacherDao objTD = new TeacherDao();
    boolean isExist = objTD.verifyTeacher(userId,password);
    if(isExist){
        session.setAttribute("t_id",userId);
        response.sendRedirect("scheduleclass.jsp");
    }
    else{   
        session.setAttribute("message","Incorrect UserId or Password");
            response.sendRedirect("login.jsp");
    }
}

if(userType.equals("student")){
    StudentDao objSD = new StudentDao();
    boolean isExist = objSD.verifyStudent(userId,password);
    if(isExist){
        session.setAttribute("enrollment",userId);
        response.sendRedirect("attendclass.jsp");
    }
    else{   
        session.setAttribute("message","Incorrect UserId or Password");
            response.sendRedirect("login.jsp");
    }
}


%>