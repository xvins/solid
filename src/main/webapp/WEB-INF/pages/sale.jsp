<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Sales</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <h3>Sales</h3>
        </div>
    </div>
    <form:form action="sale.do" method="POST" commandName="sale">
        <table>
            <tr>
                <td>ID</td>
                <td><form:input path="id" /></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><form:input path="price" /></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><form:input path="quantity" /></td>
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
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Date</th>
        </tr>
        <c:forEach items="${saleList}" var="sale"  >
            <tr>
                <td>${sale.id}</td>
                <td><c:out value="${sale.productList[product.id]}">product</c:out></td>
                <td>${sale.price}</td>
                <td>${sale.quantity}</td>
                <td><fmt:formatDate value="${sale.date}" pattern="MM/d/yyyy" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="<spring:url value="/createsale" /> ">Add a new sale</a><br>
    <a href="<spring:url value="/" /> ">Product List</a><br>
   </div>
</div>
</div>
</body>
</html>
