<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cost Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <style>
            body {
                background-image: url("imgs/bg.jpg");
                background-size: cover;
            }
        </style>
    </head>

    <body>
        <c:if test="${cookie.uid.value==null or cookie.uid.value==''}">
            <c:redirect url="index.html" />
        </c:if>
        <div class="container-fluid body">
            <br>

            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand text-light" href="home.jsp">Cost Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item" hidden>
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                        </ul>
                        <form action="update.jsp" class="d-flex">
                            <button type="submit" class="btn btn-light btn-lg">Profile</button>
                        </form>
                        <form action="logout" class="d-flex">
                            <button type="submit" class="btn btn-primary btn-lg">Logout</button>
                        </form>
                    </div>
                </div>
            </nav>
            <br>
            <p class="h1 text-center">Welcome, ${fn:toUpperCase(cookie.uid.value)}</p>
            <br><br><br><br><br>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="text-center col align-self-start">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title text-center">Self</h5>
                                <h6 class="card-subtitle mb-2 text-center text-muted">When you spend own
                                </h6>
                                <hr class="hr">
                                <p class="text-center card-text">Add how many rupees you have spend your own..</p>
                                <a class="text-center btn btn-primary btn-lg" href='addNewRecord.jsp'>Add</a>
                            </div>
                        </div>
                    </div>
                    <div class="text-center col align-self-center">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title text-center">Lend</h5>
                                <h6 class="card-subtitle mb-2 text-center text-muted">When you lend to someone</h6>
                                <hr class="hr">
                                <p class="text-center card-text">Add how many rupees you have lended to whom..</p>
                                <a class="text-center btn btn-primary btn-lg" href='addNewRecord.jsp'>Add</a>
                            </div>
                        </div>
                    </div>
                    <div class="text-center col align-self-end">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title text-center">Records</h5>
                                <h6 class="card-subtitle mb-2 text-center text-muted">Your transcations</h6>
                                <hr class="hr">
                                <p class="text-center card-text">View your transactions with your friends..</p>
                                <a class="text-center btn btn-primary btn-lg" href='calculateCost.jsp'>Show</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </body>
</html>