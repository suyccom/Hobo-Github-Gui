Bienvenido a Hobo-Github-Gui
============================

Esta aplicación tiene como objetivo ofrecer una interfaz sencilla de las tareas de GitHUb (Issues) a potenciales clientes.

* Los administradores podrán:
  * Crear nuevos usuarios para cada cliente
  * Crear proyectos enlazados a Github
  * Asignar proyectos a los clientes

* Los clientes podrán:
  * Ver los proyectos en los que están trabajando
  * Ver las tareas pendientes de ese proyecto
  * Añadir una nueva tarea

Sistema de feedback y alertas
=============================
  
* Cuando el cliente añada una nueva tarea:
  * El cliente recibirá un email confirmando que la tarea se ha añadido correctamente
  * Todos los técnicos recibirán un email informando de que se ha añadido una nueva tarea
 
* Cuando una tarea se asigne a un técnico
  * El cliente recibirá un email informando de que la tarea se ha asignado al un técnico y que la fecha estimada de completado es X.
  
* Cuando una tarea se complete
  * El cliente recibirá un email informando de que la tarea se ha completado.

Instalación
===========
* Crea tu propio fichero config/application.rb a partir del fichero config/application.rb.sample
