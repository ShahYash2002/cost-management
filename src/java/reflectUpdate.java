
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class reflectUpdate extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter())
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/new", "root", "");
            CallableStatement usr_update = cn.prepareCall("{call update_user(?,?,?)}");
            usr_update.setString(1, request.getParameter("uid"));
            usr_update.setString(2, request.getParameter("uname"));
            usr_update.setString(3, request.getParameter("password"));
            try
            {
                int c = usr_update.executeUpdate();
                if (c > 0)
                {
                    response.sendRedirect("home.jsp");
                }
            }
            catch (SQLException se)
            {
                response.sendRedirect("update.jsp");
            }
        }
        catch (Exception e)
        {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }

}
