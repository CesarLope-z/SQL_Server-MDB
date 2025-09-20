CREATE DATABASE TransporteDB;
GO

USE TransporteDB;
GO

-- Tabla de Choferes
CREATE TABLE Choferes (
    IdChofer INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Licencia NVARCHAR(50) NOT NULL,
    FechaContratacion DATE NOT NULL
);
GO

-- Tabla de Buses
CREATE TABLE Buses (
    IdBus INT PRIMARY KEY IDENTITY(1,1),
    Placa NVARCHAR(20) NOT NULL UNIQUE,
    Modelo NVARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL,
    IdChofer INT NOT NULL,
    FOREIGN KEY (IdChofer) REFERENCES Choferes(IdChofer)
);
GO

-- Tabla de Rutas
CREATE TABLE Rutas (
    IdRuta INT PRIMARY KEY IDENTITY(1,1),
    NombreRuta NVARCHAR(100) NOT NULL,
    PuntoInicio NVARCHAR(100) NOT NULL,
    PuntoFin NVARCHAR(100) NOT NULL
);
GO

-- Tabla de Boletos
CREATE TABLE Boletos (
    IdBoleto INT PRIMARY KEY IDENTITY(1,1),
    IdBus INT NOT NULL,
    IdRuta INT NOT NULL,
    FechaVenta DATE NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IdBus) REFERENCES Buses(IdBus),
    FOREIGN KEY (IdRuta) REFERENCES Rutas(IdRuta)
);
GO
-- =========================================
-- INSERTS DE PRUEBA PARA Choferes
-- =========================================
INSERT INTO Choferes (Nombre, Licencia, FechaContratacion) VALUES
('Carlos Méndez', 'LIC-12345', '2020-03-15'),
('Luis Ramírez', 'LIC-67890', '2019-07-22'),
('José Hernández', 'LIC-54321', '2021-01-10'),
('Mario López', 'LIC-98765', '2018-11-05'),
('Ricardo Pérez', 'LIC-11223', '2022-06-30');

-- =========================================
-- INSERTS DE PRUEBA PARA Buses
-- =========================================
INSERT INTO Buses (Placa, Modelo, Capacidad, IdChofer) VALUES
('AB123CD', 'Mercedes 2020', 45, 1),
('BC234DE', 'Volvo 2019', 50, 2),
('CD345EF', 'Scania 2021', 40, 3),
('DE456FG', 'Mercedes 2018', 55, 4),
('EF567GH', 'Volvo 2022', 42, 5);

-- =========================================
-- INSERTS DE PRUEBA PARA Rutas
-- =========================================
INSERT INTO Rutas (NombreRuta, PuntoInicio, PuntoFin) VALUES
('Ruta 101', 'San Salvador', 'Santa Tecla'),
('Ruta 202', 'Soyapango', 'Mejicanos'),
('Ruta 303', 'Santa Ana', 'Ahuachapán'),
('Ruta 404', 'San Miguel', 'Usulután'),
('Ruta 505', 'La Libertad', 'Sonsonate');

-- =========================================
-- INSERTS DE PRUEBA PARA Boletos
-- =========================================
INSERT INTO Boletos (IdBus, IdRuta, FechaVenta, Precio) VALUES
(1, 1, '2023-10-01', 0.75),
(2, 2, '2023-10-02', 0.85),
(3, 3, '2023-10-03', 1.00),
(4, 4, '2023-10-04', 0.95),
(5, 5, '2023-10-05', 1.10);

