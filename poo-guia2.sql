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
