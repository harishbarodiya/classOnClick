package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" integrity=\"sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z\" crossorigin=\"anonymous\">\n");
      out.write("   <link rel = \"stylesheet\" href = \"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css\">\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/util.css\">\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\n");
      out.write("  <title>Login</title>\n");
      out.write("  <script>\n");
      out.write("    \n");
      out.write("        function student(){\n");
      out.write("          var btn = document.getElementById(\"btn\");\n");
      out.write("            btn.style.left=\"110px\";\n");
      out.write("            var user = document.getElementById(\"user\");\n");
      out.write("            user.value=\"student\";\n");
      out.write("          }\n");
      out.write("        function teacher(){\n");
      out.write("          var btn = document.getElementById(\"btn\");\n");
      out.write("            btn.style.left=\"0\";\n");
      out.write("            var user = document.getElementById(\"user\");\n");
      out.write("            user.value=\"teacher\";\n");
      out.write("        }\n");
      out.write("    \n");
      out.write("    </script> \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("  \n");
      out.write("  <div id=\"container\">\n");
      out.write("    <nav>\n");
      out.write("      <span class=\"nav-heading\">Class On Click</span>\n");
      out.write("      <ul style=\"display:contents\">\n");
      out.write("        <li><a href=\"#\"><span class=\"glyphicon glyphicon-home\" style=\"font-size: 24px;\"></span> Home</a></li>\n");
      out.write("      <li><a href=\"#\"><span class=\"glyphicon glyphicon-log-out\" style=\"font-size: 24px;\"></span> Login</a></li>\n");
      out.write("      </ul>\n");
      out.write("    </nav>\n");
      out.write("      <div align=\"center\">\n");
      out.write("    <div class=\"wrap-login100\" >\n");
      out.write("        <form class=\"login100-form validate-form\" method=\"post\" action=\"UserVerify.jsp\">\n");
      out.write("\t\t\t\t\t<span class=\"login100-form-title p-b-26\">\n");
      out.write("\t\t\t\t\t\tWelcome\n");
      out.write("\t\t\t\t\t</span>\n");
      out.write("                  \n");
      out.write("  <div class=\"button-box\">\n");
      out.write("      <div id=\"btn\"></div>\n");
      out.write("    <div  style=\"white-space:nowrap\">\n");
      out.write("    <button type=\"button\" class=\"toggle-btn\" value=\"teacher\" onclick=teacher()>Teacher</button>\n");
      out.write("    <button type=\"button\" class=\"toggle-btn\" onclick=student()>Student</button>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("  <span style=\"color:red\">\n");
      out.write("      ");

      String message = (String)session.getAttribute("message");
      if(message != null){
        out.print(message);
        session.removeAttribute("message");
      }
      
      out.write("\n");
      out.write("  </span>\n");
      out.write("            <div class=\"wrap-input100 validate-input\" data-validate = \"Valid email is: a@b.c\">\n");
      out.write("                <input class=\"input100\" type=\"text\" name=\"userid\" autofocus>\n");
      out.write("                    <span class=\"focus-input100\" data-placeholder=\"UserId\"></span>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"wrap-input100 validate-input\" data-validate=\"Enter password\">\n");
      out.write("                    <span class=\"btn-show-pass\">\n");
      out.write("                            <i class=\"zmdi zmdi-eye\"></i>\n");
      out.write("                    </span>\n");
      out.write("                    <input class=\"input100\" type=\"password\" name=\"password\">\n");
      out.write("                    <span class=\"focus-input100\" data-placeholder=\"Password\"></span>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"container-login100-form-btn\">\n");
      out.write("                    <div class=\"wrap-login100-form-btn\">\n");
      out.write("                            <div class=\"login100-form-bgbtn\"></div>\n");
      out.write("                            <button type=\"submit\" name=\"user\" value=\"teacher\" id=\"user\" class=\"login100-form-btn\">\n");
      out.write("                                    Login\n");
      out.write("                            </button>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t</div>\n");
      out.write("    \n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
