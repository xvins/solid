<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Create Product</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
</head>
<body>
<div class="container">


    <div class="row">
        <div class="span8 offset2">

            <h1>Create Product</h1>

            <form:form method="post" action="createproduct" commandName="product" class="form-horizontal productForm">
            <div class="control-group">
                <form:label cssClass="control-label" path="name">Name:</form:label>
                <div class="controls">
                    <form:input path="name"/>
                </div>
            </div>
            <div class="control-group">
                <form:label cssClass="control-label" path="price">Price:</form:label>
                <div class="controls">
                    <form:input path="price"/>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Add Product" class="btn"/>
                    </form:form>
                </div>
            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".issueForm").validate(
                            {
                                rules: {
                                    name: {
                                        required : true,
                                        minlength : 1
                                    },
                                    author: {
                                        required : true,
                                        minlength : 3
                                    }
                                },
                                highlight: function(element) {
                                    $(element).closest('.control-group').removeClass('has-success').addClass('has-error');
                                },
                                unhighlight: function(element) {
                                    $(element).closest('.control-group').removeClass('has-error').addClass('has-success');
                                }
                            }
                    );
                })
            </script>

        </div>
    </div>
</div>

</body>
</html>