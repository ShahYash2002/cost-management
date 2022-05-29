<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Payment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body>
        <%
            String msg = "Hey " + request.getParameter("other_user_id") + ",I have landed you " + request.getParameter("cost") + " rupees,So I request you to give me back within a 3 days";
        %>
        <div class="container-fluid">
            <br>
            <div class="alert alert-primary" role="alert">

                <h4 class="alert-heading">To be added very soon</h4>

            </div>
            <p>You can request a payment from your friend by sending him below message</p>
            <hr>
            <br>
            <c:forTokens var="m" items="<%= msg%>" delims=",">
                <p class="h4">${m}</p>
            </c:forTokens>            
            <br>

            <fmt:formatDate var="date" value="<%= new java.util.Date()%>" dateStyle="long" type="date" />
            <p class="h6">Date : ${date} </p>
            <p class="h6">~ by ${fn:toUpperCase(cookie.uid.value)}</p>  
            <br><br><br>
            <div class="row">
                <div class="col text-start">
                    <a href="markClear.jsp?other_id=${param.other_user}" class="btn btn-primary">Mark as clear</a></div>
                <div class="col text-end">
                    <a class="btn btn-primary" href="calculateCost.jsp">Back</a>
                </div>
            </div>        
        </div>
    </body>
</html>
