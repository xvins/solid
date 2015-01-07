<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <h3>Products</h3>
        </div>
    </div>
    <form:form action="product.do" method="POST" modelAttribute="product">
        <table>
            <tr>
                <td>ID</td>
                <td><form:input path="id" /></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><form:input path="price" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="action" value="Edit" />
                </td>
            </tr>
        </table>
    </form:form>

    <table border="1" cellpadding="2" cellspacing="2" width="500">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Sales</th>
        </tr>
        <c:forEach items="${productList}" var="product"  >
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${fn:length(sales)}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="<spring:url value="/createproduct" /> ">Add a new product</a><br>
    <a href="<spring:url value="sale" /> ">Sale list</a>
</div>
</div>
</div>
</body>
</html>
