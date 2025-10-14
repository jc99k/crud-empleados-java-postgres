# CRUD de Empleados con Java y PostgreSQL

Este es un proyecto de ejemplo de una aplicación web Java que implementa un CRUD (Crear, Leer, Actualizar, Eliminar) de empleados utilizando una base de datos PostgreSQL.

## Stack Tecnológico

* **Backend:**
    * Java
    * Servlets
    * JSP (JavaServer Pages)
    * JSTL (JavaServer Pages Standard Tag Library)
* **Base de Datos:**
    * PostgreSQL
* **Frontend:**
    * HTML
    * Bulma CSS
* **Build Tool:**
    * Maven
* **Contenedores:**
    * Docker
    * Docker Compose
* **Servidor de Aplicaciones:**
    * Apache Tomcat

## Cómo ejecutar el proyecto

Para ejecutar este proyecto, necesitas tener Docker y Docker Compose instalados en tu máquina.

1. Clona este repositorio o asegúrate de tener todos los archivos del proyecto en un directorio.

2. Abre una terminal en el directorio raíz del proyecto (donde se encuentra el archivo `docker-compose.yml`).

3. Ejecuta el siguiente comando para construir las imágenes y levantar los contenedores:

   ```bash
   docker-compose up --build
   ```

4. Una vez que los contenedores estén en funcionamiento, puedes acceder a la aplicación en tu navegador web en la siguiente URL:

   [http://localhost:8080/](http://localhost:8080/)
