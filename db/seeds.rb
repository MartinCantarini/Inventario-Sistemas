# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#MARCAS
Brand.create(nombre: 'Hewlett-Packard')
Brand.create(nombre: 'Samsung')
#MODELOS DE CARTUCHO
Model.create(nombre: '05A (CE505A)')
Model.create(nombre: '12A (Q2612A)')
Model.create(nombre: '13A (Q2613A)')
Model.create(nombre: '49A (Q5949A)')
Model.create(nombre: '53A (Q7553A)')
Model.create(nombre: '55A (CE255A)')
Model.create(nombre: '64A (CC364A)')
Model.create(nombre: '83A (CF283A)')
Model.create(nombre: '85A (CB285A)')
Model.create(nombre: '88XL (C9391AE)')
Model.create(nombre: '920XL (CD975AL)')
Model.create(nombre: 'MLT-D205S')
Model.create(nombre: 'ML-D2850A')
Model.create(nombre: 'ML-D2850B')
Model.create(nombre: 'MLT-D104S')
Model.create(nombre: 'Y5045-CLT ; M5045; C5045; K5045')
#DIRECCIONES CIC
Direction.create(nombre: 'PRESIDENCIA')#1
Direction.create(nombre: 'VICE-PRESIDENCIA')#2
Direction.create(nombre: 'SECRETARÍA ADMINISTRATIVA')#3
Direction.create(nombre: 'DIRECCIÓN DE ADMINISTRACIÓN')#4
Direction.create(nombre: 'DIRECCIÓN DE CONTABILIDAD')#5
Direction.create(nombre: 'DIRECCIÓN DE SERVICIOS TÉCNICO ADMINISTRATIVOS')#6
Direction.create(nombre: 'DIRECCIÓN PROVINCIAL DE CIENCIA TECNOLOGÍA E INNOVACIÓN')#7
Direction.create(nombre: 'DIRECCIÓN DE RELACIONES INSTITUCIONALES Y COMUNICACIÓN')#8
Direction.create(nombre: 'DIRECCIÓN DE GESTIÓN CIENTÍFICA')#9
Direction.create(nombre: 'DIRECCIÓN DE GESTIÓN DE LA INNOVACIÓN Y PROGRAMAS ESPECIALES')#10
Direction.create(nombre: 'CENTRO DE SERVICIOS TECNOLÓGICOS')#11
Direction.create(nombre: 'UNIDAD DE COORDINACIÓN Y CONTROL DE GESTIÓN')#12
Direction.create(nombre: 'OTRA')#13
#DEPARTAMENTOS CIC
Department.create(nombre: 'Departamento DELEGACIÓN PROVINCIAL DE PERSONAL')#1
Department.create(nombre: 'Departamento INFRAESTRUCTURA Y SERVICIOS GENERALES')#2
Department.create(nombre: 'Departamento SISTEMAS')#3
Department.create(nombre: 'Departamento PRESUPUESTO CONTABLE')#4
Department.create(nombre: 'Departamento DE TESORERÍA Y RENDICIONES')#5
Department.create(nombre: 'Departamento LIQUIDACIONES')#6
Department.create(nombre: 'Departamento DE COMPRAS')#7
Department.create(nombre: 'Departamento LEGAL Y TÉCNICO')#8
Department.create(nombre: 'Departamento APOYO ADMINISTRATIVO')#9
Department.create(nombre: 'Departamento GESTIÓN DOCUMENTAL')#10
Department.create(nombre: 'Departamento COMUNICACIÓN Y DIFUSION CIENTÍFICA')#11
Department.create(nombre: 'Departamento SEGUIMIENTO DE LA ACTIVIDAD CIENTÍFICA')#12
Department.create(nombre: 'Departamento SUBSIDIOS')#13
Department.create(nombre: 'Departamento EVALUACIÓN DE LA ACTIVIDAD CIENTÍFICA')#14
Department.create(nombre: 'Departamento CRÉDITO FISCAL')#15
Department.create(nombre: 'Departamento CONVENIOS')#16
Department.create(nombre: 'Departamento PROGRAMAS ESPECIALES (CST)')#17
Department.create(nombre: 'Departamento DELEGACIÓN ADMINISTRATIVA')#18
Department.create(nombre: 'Departamento DIRECTOR')#19
Department.create(nombre: 'OTRO')#20
#OFICINAS
Office.create(department_id:19,direction_id:4,nombre_encargado:'Alejandro DESANTIS')
Office.create(department_id:1,direction_id:4,nombre_encargado:'Susana FAIJA')
Office.create(department_id:2,direction_id:4,nombre_encargado:'Pedro HUCK')
#Office.create(department_id:,direction_id:,nombre_encargado:'')#choferes?
Office.create(department_id:3,direction_id:4,nombre_encargado:'Javier VALLEJO')
Office.create(department_id:19,direction_id:5,nombre_encargado:'Brigida GIOCOBONI')
Office.create(department_id:4,direction_id:5,nombre_encargado:'Osvaldo PORCEL DE PERALTA')
Office.create(department_id:5,direction_id:5,nombre_encargado:'Edith GARCIA')
Office.create(department_id:6,direction_id:5,nombre_encargado:'Guillermina Desantis')
Office.create(department_id:19,direction_id:6,nombre_encargado:'Verónica PAGANI')
Office.create(department_id:8,direction_id:6,nombre_encargado:'Vivian Mc CLELLAND')
Office.create(department_id:9,direction_id:6,nombre_encargado:'Cristina CALVO')
Office.create(department_id:10,direction_id:6,nombre_encargado:'Liliana ALANIZ')
Office.create(department_id:19,direction_id:7,nombre_encargado:'Marcelo NAIOUF')
Office.create(department_id:19,direction_id:8,nombre_encargado:'Martín LOPEZ LASTRA')
Office.create(department_id:11,direction_id:8,nombre_encargado:'Antonio MASPOLI')
Office.create(department_id:19,direction_id:9,nombre_encargado:'Mónica LOMBARDI')
Office.create(department_id:12,direction_id:9,nombre_encargado:'Graciela PEREZ')
Office.create(department_id:13,direction_id:9,nombre_encargado:'Silvia CHANTRE')
Office.create(department_id:14,direction_id:9,nombre_encargado:'Alicia HUCK')
Office.create(department_id:19,direction_id:10,nombre_encargado:'Emilio JALO')
Office.create(department_id:15,direction_id:10,nombre_encargado:'Paula PEREZ')
Office.create(department_id:16,direction_id:10,nombre_encargado:'Laura DESANTIS')
Office.create(department_id:17,direction_id:10,nombre_encargado:'Rosana VALERA')
Office.create(department_id:19,direction_id:11,nombre_encargado:'Pablo ROMANAZZI')
Office.create(department_id:18,direction_id:11,nombre_encargado:'Graciela GRIZIA')
Office.create(department_id:19,direction_id:12,nombre_encargado:'Gustavo SENDRA')
#FUNCIONES DE IMPRESORAS
Function.create(funcion: 'Impresora')
Function.create(funcion: 'Escaner')
Function.create(funcion: 'Fotocopiadora')
#IMPRESORA POR DEFECTO PARA NINGUNA
Printer.create(:brand_id=>"1",:modelo=>"000000",:office_id=>"4", :function_ids=>["1","2", "3"], :red_disponible=>"0")