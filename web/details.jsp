<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Records</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${cookie.uid.value==null or cookie.uid.value==''}">
            <c:redirect url="index.html" />
        </c:if>
        <sql:setDataSource var="db" driver="${initParam.Driver}" url="jdbc:mysql://localhost/new" user="root"
                           password="" scope="session" />
        <sql:query dataSource="${db}" var="rs">
            select date,item_name,type,type_cost from records where user_id='${cookie.uid.value}' and type_user_id='${param.other_user}' order by date,type
        </sql:query>

        <div class="container-fluid">
            <br>
            <p class="h3 text-center"> 
                Your transactions with ${fn:toUpperCase(param.other_user)}
            </p>
            <table class="table table-striped border">
                <thead class="table-dark ">
                    <tr>
                        <th>Date</th>
                        <th>Iteam name</th>
                        <th>Type</th>
                        <th>Cost</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${rs.rows}" var="row">
                        <tr>
                            <td>${row.date}</td>
                            <td>${row.item_name}</td>
                            <td>${row.type}</td>
                            <td>${row.type_cost}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>            
            <a href="calculateCost.jsp" class="btn btn-primary">Back</a>
        </div>    
    </body>
</html>
