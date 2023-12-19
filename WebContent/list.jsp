<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2>User List</h2>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="user : ${users}">
                <td th:text="${user.id}"></td>
                <td th:text="${user.firstName}"></td>
                <td th:text="${user.lastName}"></td>
                <td>
                    <a th:href="@{/users/edit/{id}(id=${user.id})}" class="btn btn-warning btn-sm">Edit</a>
                    <a th:href="@{/users/delete/{id}(id=${user.id})}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </tbody>
    </table>
    <a th:href="@{/users/new}" class="btn btn-primary">New User</a>
</div>

</body>
</html>
