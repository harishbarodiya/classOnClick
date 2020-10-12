<%@page import="dao.TeacherDao"%>
<jsp:useBean id="objSLD" class="dto.SaveLinkDto"></jsp:useBean>
<jsp:setProperty name="objSLD" property="*"></jsp:setProperty>

<%
    String t_id = (String)session.getAttribute("t_id");
//    out.print(objLD.getLink1());
    TeacherDao objTD = new TeacherDao();
    boolean isStored = objTD.saveLinks(t_id, objSLD);
    if(isStored){  %>
    <script>alert("Class(es) saved successfully..!!!")</script>
    <% }
    else{ %>
    <script>alert("Error while saving data..")</script>
    <% }%>
    <jsp:include page="scheduleclass.jsp"></jsp:include>
    
    
    
    