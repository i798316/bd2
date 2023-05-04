#!/usr/bin/env python

# Columna last_update no necesaria porque se pone por defecto la hora actual
# Preguntar por la sesion y el bucle, crear sesion con cada llamada a cada función

from sqlalchemy import create_engine, Column, Integer, String, inspect
from sqlalchemy.orm import sessionmaker, declarative_base
	
engine = create_engine('mysql+pymysql://uSakila:sakila@localhost/sakila')
Session = sessionmaker(bind=engine)
Base = declarative_base()

class Country(Base):
	__tablename__ = 'country'
	country_id = Column(Integer, primary_key=True)
	country = Column(String, nullable=False)
	
class City(Base):
	__tablename__ = 'city'
	city_id = Column(Integer, primary_key=True)
	city = Column(String, nullable=False)
	country_id = Column(Integer, nullable=False)
	
class User(Base):
	__tablename__ = 'user'
	
	id = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
	nombre = Column(String(50))
	edad = Column(Integer)
	email = Column(String(50), nullable=False, unique=True)
	
	
def crear_pais(nombre):
	sesion = Session()
	
	pais = Country(country=nombre)
	
	sesion.add(pais)
	sesion.commit()
	
	sesion.close()
	
def listar_paises():
	sesion = Session()
	
	paises = sesion.query(Country).all()
	
	for pais in paises:
		print(f"{pais.country_id}: {pais.country}")

	sesion.close()
	
def eliminar_pais(id_pais):
	sesion = Session()
		
	pais = sesion.query(Country).filter(Country.country_id == id_pais).one()
	
	sesion.delete(pais)
	sesion.commit()
	
	sesion.close()
	
def crear_ciudad(nombre, id_pais):
	sesion = Session()
	
	ciudad = City(city=nombre, country_id=id_pais)
	
	sesion.add(ciudad)
	sesion.commit()
	
	sesion.close()
	
def listar_ciudades():
	sesion = Session()
	
	ciudades = sesion.query(City).all()
	
	for ciudad in ciudades:
		print(f"{ciudad.city_id}: {ciudad.city} - {ciudad.country_id}")
	
	sesion.close()
	
def eliminar_ciudad(id_ciudad):
	sesion = Session()
	
	ciudad = sesion.query(City).filter(City.city_id == id_ciudad).one()
	
	sesion.delete(ciudad)
	sesion.commit()
	
	sesion.close()
	
def crear_tabla_usuarios():
	if not inspect(engine).has_table('user'):
		Base.metadata.tables['user'].create(bind=engine)
		
def eliminar_tabla_usuarios():
	Base.metadata.tables['user'].drop(bind=engine)
	
def mostrar_estructura_tabla():
	print("")
	
	for column in User.__table__.columns:
		print(f"{column.name} {column.type}")
		
		
	
menu = """Menú principal:
	1. Crear país
	2. Listar países
	3. Eliminar país
	4. Crear ciudad
	5. Listar ciudades
	6. Eliminar ciudad
	7. Crear tabla usuarios
	8. Borrar tabla usuarios
	9. Mostrar estructura tabla
	0. Salir

Elige una opción: """
	
opcion = 1

while opcion != 0:
	opcion = int(input(menu))

	if opcion != 0:
		if opcion == 1:
			nombre_pais = input("Introduce nombre del país: ")
			crear_pais(nombre_pais)
			
		elif opcion == 2:
			listar_paises()
		
		elif opcion == 3:
			id_pais = input("Introduce id del país: ")
			eliminar_pais(id_pais)
		
		elif opcion == 4:
			nombre_ciudad = input("Introduce nombre de la ciudad: ")
			id_pais = input("Introduce id del país: ")
			crear_ciudad(nombre_ciudad, id_pais)
		
		elif opcion == 5:
			listar_ciudades()
		
		elif opcion == 6:
			id_ciudad = input("Introduce el id de la ciudad: ")
			eliminar_ciudad(id_ciudad)
		
		elif opcion == 7:
			crear_tabla_usuarios()
			
		elif opcion == 8:
			eliminar_tabla_usuarios()
			
		elif opcion == 9:
			mostrar_estructura_tabla()
		
		else:
			print("Error")
	
		print("")
		
print("Programa terminado")
