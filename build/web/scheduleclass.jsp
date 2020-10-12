<%-- 
    Document   : scheduleclass
    Created on : 10 Sep, 2020, 7:23:08 PM
    Author     : haris
--%>

<%@page import="dto.CourseDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dao.TeacherDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("t_id") != null){
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <title>Schedule a class</title>
  <script>
      function validateCourseField(){
          var course = document.getElementById("course");
          if(course.value==0){
              course.style.border="2px solid red";
              return false;
          }
          return true;
      }
      
  </script>
</head>
<body>
  
  <div id="container">
    <nav>
      <span class="nav-heading">Class On Click</span>
      <ul style="display:contents">
        <li><a href="scheduleclass.jsp"><span class="glyphicon glyphicon-home" style="font-size: 24px;"></span> Home</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="font-size: 24px;"></span> Logout</a></li>
      </ul>
    </nav>
      <%
        String name = TeacherDao.teacherName((String)session.getAttribute("t_id"));  
      %>
      
      <h3><i>Hello, <%=name%></i></h3>
    <hr style="margin-top: 0;" >
    <div class="row">
      <div class="sidebar col-4">
      <h3 style="text-align: center;margin-top: 0">Schedule a Class</h3>
      <form method="get" action="scheduleclass.jsp">
          <table class="table">
            <tr>
              <td><span style="margin: 2px 5px 5px 5px;">Select Date :</span></td>
              <td><input type="date" name="date" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" required style="height: 25px; width: 160px;"></td>
            </tr>
            <tr>
              <td><span style="margin: 2px 5px 5px 5px;">Select Course :</span></td>
              <td>
                  <select name="course" id="course" style="height: 25px; width: 160px;">
                  <option selected disabled value="0">Select Course</option>
                  <%
                      ArrayList<CourseDto> courseDtoList = TeacherDao.courses((String)session.getAttribute("t_id"));
                      for(CourseDto cd : courseDtoList){
                  %>
                  <option value="<%=cd.getCourseCode()%>"><%=cd.getCourseCode()+"-"+cd.getCourseName()%></option>
                  <%
                      }
                  %>
                </select> 
              </td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" value="Go" onclick=" return validateCourseField()" style="width:70px;argin-left: 150px;"></td>
            </tr>
          </table>
        </form>
    </div>
                <script>
                    function validateLinkField(){
                        var link1 = document.getElementById("link1").value;
                        var link2 = document.getElementById("link2").value;
                        var link3 = document.getElementById("link3").value;
                        var link4 = document.getElementById("link4").value;
                        var link5 = document.getElementById("link5").value;
                        var link6 = document.getElementById("link6").value;
                        if(link1 == "" && link2 == "" && link3 == "" && link4 == "" && link5 == "" && link6 == ""){
                            alert("All fields are empty. Please paste atleast 1 link");
                            return false;
                        }else{
                           return true;
                        }
                    }
                    
                </script>
    <div class="col-8">
        <%
            if(request.getParameter("course") != null){
        %>
        
        <h3 style="text-align: center;margin-top: 0">Schedule a Class of <%=request.getParameter("course")%></h3>
        <hr style="margin:0">
        <form method="post" action="savelink.jsp">
            <input hidden type="text" name="date" value="<%=request.getParameter("date")%>">
            <input hidden type="text" name="course" value="<%=request.getParameter("course")%>">
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-1</h4>  
        <p>08:30 AM to 09:30 AM</p>
      </div>  
        <div class="inner-box-schedule">
            <textarea placeholder="paste link here" class="link-text" name="link1" id="link1"></textarea>
      </div>
    </div>
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-2</h4>  
        <p>09:30 AM to 10:30 AM</p>
      </div>  
        <div class="inner-box-schedule">
        <textarea placeholder="paste link here" class="link-text" name="link2" id="link2" value="2"></textarea>
      </div>
    </div>
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-3</h4>  
        <p>10:30 AM to 11:30 AM</p>
      </div>  
        <div class="inner-box-schedule">
        <textarea placeholder="paste link here" class="link-text" name="link3" id="link3"></textarea>
      </div>
    </div>
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-4</h4>  
        <p>11:30 AM to 12:30 PM</p>
      </div>  
        <div class="inner-box-scheduleox">
        <textarea placeholder="paste link here" class="link-text" name="link4" id="link4"></textarea>
      </div>
    </div>
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-5</h4>  
        <p>01:00 PM to 02:00M</p>
      </div>  
        <div class="inner-box-schedule">
        <textarea placeholder="paste link here" class="link-text" name="link5" id="link5"></textarea>
      </div>
    </div>
    <div class="box-schedule">
      <div class="inner-box-schedule">
        <h4 style="text-align: center">Lecture-6</h4>  
        <p>02:00 PM to 03:00 PM</p>
      </div>  
        <div class="inner-box-schedule-box">
        <textarea placeholder="paste link here" class="link-text"  name="link6" id="link6"></textarea>
      </div>
    </div>
    
    <div>
        <button type="submit" class="save-button" name="save-links" onclick="return validateLinkField()">Save</button>
    </div>
        </form>
    <%
    }
    %>
    </div>
  </div>  
  </div>
  
</body>
</html>


<%
}
else{
   session.setAttribute("message", "Please login first");
   response.sendRedirect("login.jsp");
}
%>