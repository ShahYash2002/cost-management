
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class addNewUser extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter())
        {
            try
            {
                String password = request.getParameter("password");
                String confirm_password = request.getParameter("confirm_password");

                if (confirm_password.equals(password))
                {
                    String uid = request.getParameter("uid");
                    String uname = request.getParameter("uname");

                    ServletContext application = getServletContext();
                    String driver = application.getInitParameter("Driver");

                    Class.forName(driver);
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "");
                    PreparedStatement ps = con.prepareStatement("insert into users values (?,?,?)");
                    ps.setString(1, uid);
                    ps.setString(2, uname);
                    ps.setString(3, password);
                    int c = ps.executeUpdate();
                    out.println("<p> hello</p>");
                    if (c > 0)
                    {
                        response.sendRedirect("index.html");
                    }
                }
                else
                {
                    out.println("<p> Password and Confirm password must be same.. </p>");
                    out.println("<a href='register.html'> Please try again </a> ");
                }
            }
            catch (SQLIntegrityConstraintViolationException e)
            {
                out.println("<p> User already exists</p>");
                out.println("Please <a href='register.html'>try again</a> with other ID");
            }
            catch (ClassNotFoundException | SQLException e)
            {
                out.println("Something went wrong" + e.toString());
            }
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }

}
