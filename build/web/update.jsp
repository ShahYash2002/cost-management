<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
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
            select * from users where id=?;
            <sql:param value="${cookie.uid.value}" />
        </sql:query>
        <div class="container-fluid">
            <br>
            <h3>
                <p class="text-center">Update Profile</p>
            </h3>
            <c:forEach items="${rs.rows}" var="row">
                <form action="reflectUpdate" method="POST">

                    <div class="input-group mb-3">
                        <span class="input-group-text w-25 p-3" id="basic-addon1">User ID</span>

                        <input type="text" name="uid" value="${row.id}" readonly class="form-control"
                               placeholder="User ID" aria-label="User ID" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text w-25 p-3" id="basic-addon1">Username</span>

                        <input type="text" name="uname" value="${row.name}" required class="form-control"
                               placeholder="User ID" aria-label="User ID" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text w-25 p-3" id="basic-addon1">Password</span>

                        <input type="password" name="password" value="${row.password}" required
                               class="form-control" placeholder="User ID" aria-label="User ID"
                               aria-describedby="basic-addon1">
                    </div>
                    <button class="btn btn-primary" type="submit">Update</button>

                </form>
            </c:forEach>
        </div>
    </body>
</html>