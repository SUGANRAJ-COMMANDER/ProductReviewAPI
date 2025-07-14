<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Review Item - Admin</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 2rem;
        }

        .admin-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2980b9;
        }

        label {
            display: block;
            margin-top: 1rem;
            font-weight: 600;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 0.3rem;
        }

        .submit-btn {
            margin-top: 1.5rem;
            width: 100%;
            padding: 0.75rem;
            background-color: #2980b9;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #1c6ea4;
        }
    </style>
</head>
<body>

<div class="admin-container">
    <h2>Add New Review Item</h2>

    <form:form method="post" action="admin/add" modelAttribute="review">
        <label for="title">Title</label>
        <form:input path="title" id="title" required="true" />

        <label for="owner">Owner</label>
        <form:input path="owner" id="owner" required="true" />

        <label for="category">Category</label>
        <form:select path="category" id="category">
            <form:option value="smartphone">Smartphone</form:option>
            <form:option value="movies">Movies</form:option>
        </form:select>

        <label for="manufactureDate">Manufacture Date</label>
        <form:input path="manufactureDate" id="manufactureDate" type="date" required="true" />

        <label for="rating">Rating (1-5)</label>
        <form:select path="rating" id="rating">
            <form:option value="1">1 ★</form:option>
            <form:option value="2">2 ★</form:option>
            <form:option value="3">3 ★</form:option>
            <form:option value="4">4 ★</form:option>
            <form:option value="5">5 ★</form:option>
        </form:select>

        <input type="submit" class="submit-btn" value="Add Review">
    </form:form>
</div>

</body>
</html>
