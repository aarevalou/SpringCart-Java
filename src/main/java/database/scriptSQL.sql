CREATE TABLE IF NOT EXISTS Cliente (
    id INTEGER PRIMARY KEY,
    rut VARCHAR(10),
    nombre VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(20),
    direccion VARCHAR(30),
    saldo INTEGER
);

CREATE TABLE IF NOT EXISTS Admin (
    id INTEGER PRIMARY KEY,
    rut VARCHAR(10),
    nombre VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(20),
    cargo VARCHAR(20),
    fecha_ingreso DATE
);

CREATE TABLE IF NOT EXISTS Marca (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Categoria (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    descripcion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Producto (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    marca_id INTEGER,
    detalle VARCHAR(100),
    precio INTEGER,
    stock INTEGER,
    categoria_id INTEGER,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (marca_id) REFERENCES Marca(id)
);

CREATE TABLE IF NOT EXISTS Carrito (
    cliente_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    precio_unitario INTEGER,
    PRIMARY KEY (cliente_id, producto_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

CREATE TABLE IF NOT EXISTS Pedido (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cliente_id INTEGER,
    fecha_creacion DATE,
    despacho_id INTEGER,
    metodo_pago VARCHAR(30),
    total INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE IF NOT EXISTS Pedido_Detalle (
    pedido_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);


INSERT INTO Marca (id, nombre) VALUES (2, 'Soprole');
INSERT INTO Marca (id, nombre) VALUES (1, 'Colun');
INSERT INTO Marca (id, nombre) VALUES (3, "Nescafé");
INSERT INTO Marca (id, nombre) VALUES (4, "Milo");
INSERT INTO Marca (id, nombre) VALUES (5, "Surlat");
INSERT INTO Marca (id, nombre) VALUES (6, "Cintazul");
INSERT INTO Marca (id, nombre) VALUES (7, "Carozzi");
INSERT INTO Marca (id, nombre) VALUES (8, "Lucchetti");
INSERT INTO Marca (id, nombre) VALUES (9, "Tucapel");
INSERT INTO Marca (id, nombre) VALUES (10, "Miraflores");
INSERT INTO Marca (id, nombre) VALUES (11, "Selecta");
INSERT INTO Marca (id, nombre) VALUES (12, "San José");
INSERT INTO Marca (id, nombre) VALUES (13, "Cuisine & Co");
INSERT INTO Marca (id, nombre) VALUES (14, "Wasil");
INSERT INTO Marca (id, nombre) VALUES (15, "Marco Polo");
INSERT INTO Marca (id, nombre) VALUES (16, "Evercrisp");
INSERT INTO Marca (id, nombre) VALUES (17, "Lays");
INSERT INTO Marca (id, nombre) VALUES (18, "Takis");
INSERT INTO Marca (id, nombre) VALUES (19, "Elite");
INSERT INTO Marca (id, nombre) VALUES (20, "Confort");
INSERT INTO Marca (id, nombre) VALUES (21, "Vanish");
INSERT INTO Marca (id, nombre) VALUES (22, "OMO");
INSERT INTO Marca (id, nombre) VALUES (23, "Clorox");
INSERT INTO Marca (id, nombre) VALUES (24, "Ariel");
INSERT INTO Marca (id, nombre) VALUES (25, "Quix");
INSERT INTO Marca (id, nombre) VALUES (26, "Poett");
INSERT INTO Marca (id, nombre) VALUES (27, "Sopraval");
INSERT INTO Marca (id, nombre) VALUES (28, "Super Pollo");
INSERT INTO Marca (id, nombre) VALUES (29, "Coca-Cola");
INSERT INTO Marca (id, nombre) VALUES (30, "Fanta");
INSERT INTO Marca (id, nombre) VALUES (31, "Pepsi");
INSERT INTO Marca (id, nombre) VALUES (32, "Sprite");
INSERT INTO Marca (id, nombre) VALUES (33, "Monster Energy");
INSERT INTO Marca (id, nombre) VALUES (34, "Red Bull");
INSERT INTO Marca (id, nombre) VALUES (35, "Score");
INSERT INTO Marca (id, nombre) VALUES (36, "Watt's");
INSERT INTO Marca (id, nombre) VALUES (37, "Andina");
INSERT INTO Marca (id, nombre) VALUES (38, "Kunstmann");
INSERT INTO Marca (id, nombre) VALUES (39, "Austral");
INSERT INTO Marca (id, nombre) VALUES (40, "Cristal");
INSERT INTO Marca (id, nombre) VALUES (41, "Propio");


INSERT INTO Categoria (id, nombre, descripcion) VALUES (1, "Lacteos", "leches, yogures, huevos, cremas y postres");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (2, "Despensa", "fideos, pastas, arroz, legumbres, aceites y aderezos");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (3, "Conservas", "frutas, atun, lomito, compotas, legumbres");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (4, "Frutas y verduras", "frutas, verduras y frutos secos");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (5, "Snacks", "frutas, verduras y frutos secos");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (6, "Limpieza", "papeles higienicos, baño y cocina, pisos y muebles");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (7, "Carnes", "vacuno, cerdo, paco y pollo");
INSERT INTO Categoria (id, nombre, descripcion) VALUES (8, "Botilleria", "bebidas, jugos, cervezas y energéticas");


INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (1, 1, "Leche natural 1 L", 1190, 5, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (2, 2, "Leche descremada 1 L", 1150, 5, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (3, 1, "Yogur natural 500g", 890, 10, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (4, 1, "Queso Gouda 200g", 2150, 8, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (5, 1, "Mantequilla sin sal 250g", 1390, 15, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (6, 2, "Yogur frutilla 1kg", 1890, 12, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (7, 2, "Queso Cheddar 300g", 2450, 6, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (8, 2, "Leche entera 2L", 2250, 10, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (9, 3, "Postre de chocolate 4 unidades", 1290, 8, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (10, 4, "Milo Instantáneo 400g", 2590, 10, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (11, 5, "Yogur griego natural 750g", 1690, 15, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (12, 6, "Huevos A 12 unidades", 1590, 20, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (13, 7, "Fideos Spaghetti 500g", 890, 25, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (14, 8, "Fideos Penne Rigate 400g", 950, 20, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (15, 9, "Arroz Grano Largo 1kg", 1050, 30, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (16, 10, "Aceite de Oliva Extra Virgen 500ml", 3590, 15, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (17, 11, "Harina de Trigo 2kg", 890, 25, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (18, 12, "Atún en Aceite 170g", 1890, 18, 3);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (19, 13, "Duraznos en Almíbar 820g", 2490, 12, 3);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (20, 14, "Palmitos en Conserva 400g", 3790, 10, 3);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (21, 15, "Papas Fritas 150g", 1090, 22, 3);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (22, 16, "Cheetos 100g", 1290, 20, 5);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (23, 17, "Lays Original 200g", 1490, 15, 5);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (24, 18, "Takis Fuego 90g", 990, 18, 5);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (25, 19, "Papel Higiénico Elite 12 rollos", 5690, 8, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (26, 20, "Servilletas Confort 200 unidades", 1290, 25, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (27, 21, "Detergente en Polvo Vanish 2kg", 4190, 12, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (28, 22, "Detergente Líquido OMO 1.5L", 3590, 15, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (29, 23, "Cloro Clorox 1L", 1590, 20, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (30, 24, "Ariel Pods 20 unidades", 4790, 10, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (31, 25, "Lavalozas Quix 500ml", 990, 18, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (32, 26, "Desinfectante Poett Lavanda 750ml", 2290, 15, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (33, 27, "Pollo Entero Sopraval 2kg", 4990, 8, 7);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (34, 28, "Pavo Super Pollo 4kg", 8990, 5, 7);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (35, 29, "Coca-Cola 2.5L", 1890, 15, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (36, 30, "Fanta Naranja 1.5L", 1390, 20, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (37, 31, "Pepsi Light 2L", 1490, 18, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (38, 32, "Sprite Zero 1L", 1290, 22, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (39, 33, "Monster Energy Original 500ml", 2590, 12, 8);


INSERT INTO Cliente (id, rut, nombre, email, password, direccion, saldo) VALUES (1, '11222333-4', 'Cliente1', 'cliente1@ejemplo.com', 'pwd123', 'Calle Ejemplo 123', 15000);
INSERT INTO Cliente (id, rut, nombre, email, password, direccion, saldo) VALUES (2, '22333444-K', 'Cliente2', 'cliente2@ejemplo.com', 'pwd456', 'Calle Ejemplo 123', 12000);

INSERT INTO Admin (id, rut, nombre, email, password, cargo, fecha_ingreso) VALUES (1, '33444555-1', 'Admin1', 'admin1@ejemplo.com', 'pwd123', 'Gerente', '2023-01-01');
INSERT INTO Admin (id, rut, nombre, email, password, cargo, fecha_ingreso) VALUES (2, '44555666-7', 'Admin2', 'admin2@ejemplo.com', 'pwd456', 'Reponedor', '2023-04-10');