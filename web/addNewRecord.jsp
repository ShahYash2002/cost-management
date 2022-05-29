<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Record</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
    </head>

    <body>
        <c:if test="${cookie.uid.value==null or cookie.uid.value==''}">
            <c:redirect url="index.html" />
        </c:if>
        <div class="container-fluid">
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
                            <button type="submit" class="mx-10 btn btn-light btn-lg">Profile</button>
                        </form>
                        <form action="logout" class="d-flex">
                            <button type="submit" class="mx-10 btn btn-primary btn-lg">Logout</button>
                        </form>
                    </div>
                </div>
            </nav>
            <br>        

            <p class="h3 text-left text-primary">Enter new record</p>
            <hr>
            <form action="saveRecord.jsp">                    
                <div class="input-group mb-3">
                    <span class="input-group-text w-25 p-2" id="basic-addon1">Iteam Name</span>
                    <input type="text" name="item_name" required placeholder="Tea,Coffee,etc." class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text w-25 p-2" id="basic-addon1">Iteam Cost</span>
                    <input type="number" step=5 name="item_cost" required placeholder="10,25,.." class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text w-25 p-2" id="basic-addon1">Cost Kind</span>
                    <select class="form-select" name="cost_kind" required>
                        <option value="Lend">Lend</option>
                        <option value="None" selected>None</option>
                    </select>                   
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text w-25 p-2" id="basic-addon1">To/From Whom?</span>
                    <input type="text" name="other_id" placeholder="Enter ID" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text w-25 p-2" id="basic-addon1">How much?</span>
                    <input type="number" step=5  name="other_cost" placeholder="Enter cost" class="form-control" aria-describedby="basic-addon1">
                </div>
                <div class="row">
                    <div class="col text-start"><button class="btn btn-primary w-25 p-2" type="submit">Add</button></div>
                    <div class="col text-end"><button class="btn btn-primary w-25 p-2" type="reset">Reset</button></div>                    
                </div>
            </form>
            <br>
        </div>
    </body>
</html>