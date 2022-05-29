package custom_tags;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.lang.reflect.*;

public class CustomTag extends TagSupport
{
    public Class ex;

    public void setEx(Class ex)
    {
        this.ex = ex;
    }

    @Override
    public int doStartTag() throws JspException
    {
        try
        {
            JspWriter out = pageContext.getOut();
            out.println("<h3>Exception should be of following ..</h3>");

            Constructor[] c = ex.getConstructors();
            out.println("<ul>");
            for (Constructor cs : c)
            {
                out.println("<li>");
                out.println("<h4>" + cs.toGenericString() + "</h4>");
                out.println("</li>");
            }
            out.println("</ul>");
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
