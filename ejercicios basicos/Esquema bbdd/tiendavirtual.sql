-- Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    CorreoElectronico VARCHAR(255) UNIQUE,
    Contraseña VARCHAR(255),
    Direccion TEXT
);

-- Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock INT,
    Categoria VARCHAR(255)
);

-- Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    FechaPedido DATETIME,
    EstadoPedido VARCHAR(255),
    TOTAL DECIMAL(10, 2),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Detalles del Pedido
CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Reseñas
CREATE TABLE Reseñas (
    ReseñaID INT PRIMARY KEY AUTO_INCREMENT,
    ProductoID INT,
    UsuarioID INT,
    Calificacion INT,
    Comentario TEXT,
    FechaReseña DATETIME,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

