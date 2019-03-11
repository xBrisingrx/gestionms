# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ClientType.create(name: "Empresa")
ClientType.create(name: "Particular")
IvaCondition.create(condition: "Ninguna", porcent: 0)
IvaCondition.create(condition: "Responsable inscripto", porcent: 21)
IvaCondition.create(condition: "Exento", porcent: 10)
PersonType.create(name: "Empleado")
PersonType.create(name: "Dueño")
TicketPriority.create(priority: "Baja")
TicketPriority.create(priority: "Media")
TicketPriority.create(priority: "Alta")
TicketStatus.create(status: "Sin asignar")
TicketStatus.create(status: "En proceso")
TicketStatus.create(status: "Finalizado")
TicketType.create(name: "Soporte tecnico")
TicketType.create(name: "Asistencia remota", comment: "Asistencia por teamviewer ")
TicketType.create(name: "Servicio electronico" , comment: "Trabajos para Oscar.")
TicketType.create(name: "Soporte de camaras")
TicketType.create(name: "Varios")
FleetType.create(name: "PC Escritorio")
FleetType.create(name: "Notebook")
FleetType.create(name: "Impresora")
FleetType.create(name: "Red")
Rol.create(name: "Administrador")
Rol.create(name: "Cliente")


