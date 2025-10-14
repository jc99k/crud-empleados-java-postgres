<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee CRUD</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="title">Employees</h1>
            <div class="columns">
                <div class="column is-one-third">
                    <form action="insert" method="POST">
                        <div class="field">
                            <label class="label">Name</label>
                            <div class="control">
                                <input class="input" type="text" name="name" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Email</label>
                            <div class="control">
                                <input class="input" type="email" name="email" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Phone</label>
                            <div class="control">
                                <input class="input" type="text" name="phone" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Birthday</label>
                            <div class="control">
                                <input class="input" type="date" name="birthday" required>
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <button class="button is-primary" type="submit">Add Employee</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="column">
                    <table class="table is-striped is-fullwidth">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Birthday</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="employee" items="${listEmployee}">
                                <tr>
                                    <td><c:out value="${employee.id}" /></td>
                                    <td><c:out value="${employee.name}" /></td>
                                    <td><c:out value="${employee.email}" /></td>
                                    <td><c:out value="${employee.phone}" /></td>
                                    <td><c:out value="${employee.birthday}" /></td>
                                    <td>
                                        <a href="edit?id=<c:out value='${employee.id}' />" class="button is-warning is-small">Edit</a>
                                        <a href="delete?id=<c:out value='${employee.id}' />" class="button is-danger is-small" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
