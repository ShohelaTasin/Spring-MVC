<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2>Create New User</h2>
    <form th:action="@{/users/new}" th:object="${user}" method="post">
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" class="form-control" id="firstName" th:field="*{firstName}" required>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" class="form-control" id="lastName" th:field="*{lastName}" required>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a th:href="@{/users}" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
