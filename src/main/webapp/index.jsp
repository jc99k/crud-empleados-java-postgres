<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD de Empleados</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/devicon@2.15.1/devicon.min.css">
</head>
<body>
    <section class="section">
        <div class="container">
            <h1 class="title">Empleados <i class="devicon-java-plain"></i> <i class="devicon-postgresql-plain"></i></h1>
            <div class="columns">
                <div class="column is-one-third">
                    <form action="insert" method="POST">
                        <h2 class="subtitle">Agregar Empleado</h2>
                        <div class="field">
                            <label class="label">Nombre</label>
                            <div class="control">
                                <input class="input" type="text" name="name" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Correo Electrónico</label>
                            <div class="control">
                                <input class="input" type="email" name="email" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Teléfono</label>
                            <div class="control">
                                <input class="input" type="text" name="phone" required>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Fecha de Nacimiento</label>
                            <div class="control">
                                <input class="input" type="date" name="birthday" required>
                            </div>
                        </div>
                        <div class="field">
                            <div class="control">
                                <button class="button is-primary" type="submit">Agregar Empleado</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="column">
                    <table class="table is-striped is-fullwidth">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo Electrónico</th>
                                <th>Teléfono</th>
                                <th>Fecha de Nacimiento</th>
                                <th>Acción</th>
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
                                        <button class="button is-warning is-small edit-button" 
                                                data-id="${employee.id}" 
                                                data-name="${employee.name}" 
                                                data-email="${employee.email}" 
                                                data-phone="${employee.phone}" 
                                                data-birthday="${employee.birthday}">Editar</button>
                                        <a href="delete?id=<c:out value='${employee.id}' />" class="button is-danger is-small" onclick="return confirm('¿Estás seguro de que quieres eliminar?')">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <div id="edit-modal" class="modal">
        <div class="modal-background"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Editar Empleado</p>
                <button class="delete" aria-label="close"></button>
            </header>
            <section class="modal-card-body">
                <form id="edit-form" action="update" method="POST">
                    <input type="hidden" name="id" id="edit-id">
                    <div class="field">
                        <label class="label">Nombre</label>
                        <div class="control">
                            <input class="input" type="text" name="name" id="edit-name" required>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Correo Electrónico</label>
                        <div class="control">
                            <input class="input" type="email" name="email" id="edit-email" required>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Teléfono</label>
                        <div class="control">
                            <input class="input" type="text" name="phone" id="edit-phone" required>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Fecha de Nacimiento</label>
                        <div class="control">
                            <input class="input" type="date" name="birthday" id="edit-birthday" required>
                        </div>
                    </div>
                </form>
            </section>
            <footer class="modal-card-foot">
                <button class="button is-success" type="submit" form="edit-form">Guardar cambios</button>
                <button class="button cancel-button">Cancelar</button>
            </footer>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const modal = document.getElementById('edit-modal');
            const modalCloseButtons = modal.querySelectorAll('.delete, .cancel-button');

            document.querySelectorAll('.edit-button').forEach(button => {
                button.addEventListener('click', () => {
                    const id = button.dataset.id;
                    const name = button.dataset.name;
                    const email = button.dataset.email;
                    const phone = button.dataset.phone;
                    const birthday = button.dataset.birthday;

                    document.getElementById('edit-id').value = id;
                    document.getElementById('edit-name').value = name;
                    document.getElementById('edit-email').value = email;
                    document.getElementById('edit-phone').value = phone;
                    document.getElementById('edit-birthday').value = birthday;

                    modal.classList.add('is-active');
                });
            });

            modalCloseButtons.forEach(button => {
                button.addEventListener('click', () => {
                    modal.classList.remove('is-active');
                });
            });
        });
    </script>

</body>
</html>