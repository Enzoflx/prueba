DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

-- 1
SELECT nombre, apellido1, apellido2 FROM empleado;

-- 2
SELECT DISTINCT apellido1 FROM empleado;

-- 3
SELECT * FROM empleado;

-- 4
SELECT id_departamento FROM empleado;

-- 5
SELECT DISTINCT id_departamento FROM empleado;

-- 6
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS nombre_completo FROM empleado;

-- 7
SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', apellido2)) AS nombre_completo FROM empleado;

-- 8
SELECT id, SUBSTRING(nif, 1, LENGTH(nif) - 1) AS digitos, RIGHT(nif, 1) AS letra FROM empleado;

-- 9
SELECT nombre, (presupuesto - gastos) AS presupuesto_actual FROM departamento;

-- 10
SELECT nombre, (presupuesto - gastos) AS presupuesto_actual FROM departamento ORDER BY presupuesto_actual ASC;

-- 11
SELECT nombre FROM departamento ORDER BY nombre DESC;

-- 12
SELECT apellido1, apellido2, nombre FROM empleado ORDER BY apellido1, apellido2, nombre;

-- 13
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 3;

-- 14
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 3;

-- 15
SELECT nombre, gastos FROM departamento ORDER BY gastos DESC LIMIT 2;

-- 16
SELECT nombre, gastos FROM departamento ORDER BY gastos ASC LIMIT 2;

-- 17
SELECT * FROM empleado LIMIT 2, 5;

-- 18
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000;

-- 19
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;

-- 20
SELECT nombre FROM departamento WHERE presupuesto NOT BETWEEN 100000 AND 200000;

-- 21. Devuelve los departamentos donde los gastos son mayores que el presupuesto
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos > presupuesto;

-- 22. Devuelve los departamentos donde los gastos son menores que el presupuesto
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos < presupuesto;

-- 23. Devuelve los departamentos donde los gastos son iguales al presupuesto
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos = presupuesto;

-- 24. Lista todos los datos de los empleados cuyo segundo apellido es NULL
SELECT * FROM empleado WHERE apellido2 IS NULL;

-- 25. Lista todos los datos de los empleados cuyo segundo apellido no es NULL
SELECT * FROM empleado WHERE apellido2 IS NOT NULL;

-- 26. Lista todos los datos de los empleados cuyo segundo apellido es López
SELECT * FROM empleado WHERE apellido2 = 'López';

-- 27. Lista todos los datos de los empleados cuyo segundo apellido es Díaz o Moreno (sin usar IN)
SELECT * FROM empleado WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- 28. Lista todos los datos de los empleados cuyo segundo apellido es Díaz o Moreno (usando IN)
SELECT * FROM empleado WHERE apellido2 IN ('Díaz', 'Moreno');

-- 29. Lista los empleados que trabajan en el departamento 3
SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento = 3;

-- 30. Lista los empleados que trabajan en los departamentos 2, 4 o 5
SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento IN (2, 4, 5);

-- 31. Calcula la suma del presupuesto de todos los departamentos
SELECT SUM(presupuesto) AS suma_presupuestos FROM departamento;

-- 32. Calcula la media del presupuesto de todos los departamentos
SELECT AVG(presupuesto) AS media_presupuestos FROM departamento;

-- 33. Calcula el valor mínimo del presupuesto de todos los departamentos
SELECT MIN(presupuesto) AS minimo_presupuesto FROM departamento;

-- 34. Devuelve el nombre y presupuesto del departamento con menor presupuesto
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 1;

-- 35. Calcula el valor máximo del presupuesto de todos los departamentos
SELECT MAX(presupuesto) AS maximo_presupuesto FROM departamento;

-- 36. Devuelve el nombre y presupuesto del departamento con mayor presupuesto
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 1;

-- 37. Calcula el total de empleados
SELECT COUNT(*) AS total_empleados FROM empleado;

-- 38. Calcula el número de empleados que no tienen NULL en su segundo apellido
SELECT COUNT(*) FROM empleado WHERE apellido2 IS NOT NULL;

-- 39. Calcula el número de empleados por departamento, incluyendo departamentos sin empleados
SELECT d.nombre, COUNT(e.id) AS total_empleados 
FROM departamento d 
LEFT JOIN empleado e ON d.id = e.id_departamento 
GROUP BY d.id;

-- 40. Calcula el número de empleados de departamentos con presupuesto > 200,000
SELECT COUNT(e.id) AS total_empleados 
FROM empleado e 
JOIN departamento d ON e.id_departamento = d.id 
WHERE d.presupuesto > 200000;
