
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class validate extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        try ( PrintWriter out = response.getWriter())
        {
            String uid = request.getParameter("uid");
            String password = request.getParameter("password");

            ServletContext application = getServletContext();
            String driver = application.getInitParameter("Driver");

            try
            {
                Class.forName(driver);
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select password from users where id='" + uid + "'");

                String actualPass = null;
                if (rs.next())
                {
                    actualPass = rs.getString(1);
                }

                if (password.equals(actualPass))
                {
                    HttpSession session = request.getSession();
                    Cookie c=new Cookie("uid",uid);
                    response.addCookie(c);                    
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    out.println("Invalid password");
                    out.println("<br>");
                    out.println("<a href='index.html'>Please try again</a>");
                }
            }
            catch (ClassNotFoundException | SQLException e)
            {
                out.println("Something wrong with connection" + e.toString());
            }
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }
}
