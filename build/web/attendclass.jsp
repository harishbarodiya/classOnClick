<%-- 
    Document   : attendclass
    Created on : 10 Sep, 2020, 7:42:37 PM
    Author     : haris
--%>

<%@page import="dto.FetchLinkDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.StudentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("enrollment") != null){
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <title>Attend a class</title>
</head>
<body>
  
  <div id="container">
    <nav>
      <span class="nav-heading">Class On Click</span>
      <ul style="display:contents">
        <li><a href="attendclass.jsp"><span class="glyphicon glyphicon-home" style="font-size: 24px;"></span> Home</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" style="font-size: 24px;"></span> Logout</a></li>
      </ul>
    </nav>
      <%
        String name = StudentDao.studentName((String)session.getAttribute("enrollment"));  
      %>
      
      <h3 style="display: inline-block; margin: 15px 5px 15px 5px;"><i>Hello, <%=name%></i></h3>
      <span style="margin: 15px -200px 15px 5px; float: right">Date : <%=new SimpleDateFormat("dd-MM-yyyy").format(new Date()) %></span>
    <hr style="margin-top: 0;" >
      <h3 style="text-align: center;margin-top: 0">Attend a Class</h3>
    
    <div class="row">
      <div class="col-1"></div>
    <div class="col-10">
        <!--fetch stored data-->  
      <%
          StudentDao studentDao = new StudentDao();
          ArrayList<FetchLinkDto> linkDtoList = studentDao.fetchLinks((String)session.getAttribute("enrollment"));
            if(linkDtoList.size() == 0){  %>
            <br><br><br>
            <p style="color: green; text-align: center; font-size: 1.2em;  "><i>Voilla... There is no class today<br> enjoy your day...!!!</i>&#128525&#128525&#128525 </p>
            <% }else{
            int i=1;
            for(FetchLinkDto objFetchLink : linkDtoList){ %>
        
         <div class="box-attend">
                <div class="inner-box-attend">
                    <h4 style="text-align: center"><%= "Lecture - "+i++ %></h4>  
                <h4 style="text-align: center"><%= objFetchLink.getPeriod() %></h4> 
                <h4 style="text-align: center; width : 240px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%= objFetchLink.getCourse() %></h4> 
                <h4 style="text-align: center; width:inherit;"><%= objFetchLink.getTeacher() %></h4>     
                </div>
                
                <a href='<%=objFetchLink.getLink() %>' target='_blank'><button class="attend-button" >Attend Class</button></a>
    </div>
                 
        <% } } %>
    
    </div>
      <div class="col-1"></div>
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