<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errors.jsp"%>
<!DOCTYPE html>
<html>
    <body>
        <c:if test="${cookie.uid.value==null or cookie.uid.value==''}">
            <c:redirect url="index.html" />
        </c:if>
        <sql:setDataSource var="db" driver="${initParam.Driver}" url="jdbc:mysql://localhost/new" user="root"
                           password="" scope="session" />
        <c:set var="other_cost" value="${param.other_cost}" />

        <c:choose>            
            <c:when test="${param.cost_kind=='None' and other_cost==''}"> 
                <sql:update dataSource="${db}" var="count">
                    insert into records (user_id,item_name,cost,type) values (?,?,?,?);                    
                    <sql:param value="${cookie.uid.value}" />
                    <sql:param value="${param.item_name}" />
                    <sql:param value="<%= Integer.parseInt(request.getParameter("item_cost"))%>" />
                    <sql:param value="${param.cost_kind}" />
                </sql:update>
            </c:when>            
            <c:otherwise>
                <sql:transaction dataSource="${db}">
                    <sql:update  var="count">
                        insert into records (user_id,item_name,cost,type,type_user_id,type_cost) values (?,?,?,?,?,?);                    
                        <sql:param value="${cookie.uid.value}" />
                        <sql:param value="${param.item_name}" />
                        <sql:param value="<%= Integer.parseInt(request.getParameter("item_cost"))%>" />
                        <sql:param value="lend" />
                        <sql:param value="${param.other_id}" />
                        <sql:param value='<%= Integer.parseInt(pageContext.getAttribute("other_cost").toString())%>' />
                    </sql:update>
                    <sql:update>
                        insert into records (user_id,item_name,type,type_user_id,type_cost) values (?,?,?,?,?);                    
                        <sql:param value="${param.other_id}" />
                        <sql:param value="${param.item_name}" />
                        <sql:param value="borrow" />
                        <sql:param value="${cookie.uid.value}" />                        
                        <sql:param value='<%= Integer.parseInt(pageContext.getAttribute("other_cost").toString())%>' />
                    </sql:update>
                </sql:transaction>
            </c:otherwise>
        </c:choose>

        <%
            String c = pageContext.getAttribute("count").toString();
            boolean status = Integer.parseInt(c) > 0;
        %>
        <c:choose >
            <c:when test='<%= status%>'>
                <c:redirect url="home.jsp" />
            </c:when>
            <c:otherwise>
                <p>There was some problem in your last transaction</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
