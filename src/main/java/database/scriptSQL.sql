
CREATE TABLE IF NOT EXISTS Cliente (
    rut VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(20),
    direccion VARCHAR(30),
    saldo INTEGER
);

CREATE TABLE IF NOT EXISTS Admin (
    rut VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(20)
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

CREATE TABLE IF NOT EXISTS Producto (|
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    marca_id INTEGER,
    detalle VARCHAR(100),
    precio INTEGER,
    stock INTEGER,
    categoria_id INTEGER,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (marca_id) REFERENCES Marca(id)
);

CREATE TABLE IF NOT EXISTS Atributo (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Atributo_Producto (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    producto_id INTEGER,
    atributo_id INTEGER,
    valor VARCHAR(30),
    FOREIGN KEY (producto_id) REFERENCES Producto(id),
    FOREIGN KEY (atributo_id) REFERENCES Atributo(id)
);

CREATE TABLE IF NOT EXISTS Carrito (
    cliente_id VARCHAR(10),
    producto_id INTEGER,
    cantidad INTEGER,
    precio_unitario INTEGER,
    PRIMARY KEY (cliente_id, producto_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(rut),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

CREATE TABLE IF NOT EXISTS Despacho (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    metodo VARCHAR(30),
    costo INTEGER,
    direccion VARCHAR(50),
    comuna VARCHAR(30),
    region VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Pedido (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cliente_id VARCHAR(10),
    fecha_creacion DATE,
    despacho_id INTEGER,
    metodo_pago VARCHAR(30),
    total INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(rut),
    FOREIGN KEY (despacho_id) REFERENCES Despacho(id)
);

CREATE TABLE IF NOT EXISTS Pedido_Detalle (
    pedido_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

INSERT INTO Marca (id, nombre) VALUES (2, "Soprole");
INSERT INTO Marca (id, nombre) VALUES (1, "Colun");
INSERT INTO Marca (id, nombre) VALUES (3, "Nescafé");
INSERT INTO Marca (id, nombre) VALUES (4, "Milo");
INSERT INTO Marca (id, nombre) VALUES (5, "Surlat");
-- Huevos
INSERT INTO Marca (id, nombre) VALUES (6, "Cintazul");

-- Fideos
INSERT INTO Marca (id, nombre) VALUES (7, "Carozzi");

INSERT INTO Marca (id, nombre) VALUES (8, "Lucchetti");
-- arroz, aceites, harina
INSERT INTO Marca (id, nombre) VALUES (9, "Tucapel");

INSERT INTO Marca (id, nombre) VALUES (10, "Miraflores");
INSERT INTO Marca (id, nombre) VALUES (11, "Selecta");
-- atun, jurel
INSERT INTO Marca (id, nombre) VALUES (12, "San José");

-- frutas en conserva, palmitos
INSERT INTO Marca (id, nombre) VALUES (13, "Cuisine & Co");

INSERT INTO Marca (id, nombre) VALUES (14, "Wasil");
-- Snacks
INSERT INTO Marca (id, nombre) VALUES (15, "Marco Polo");

INSERT INTO Marca (id, nombre) VALUES (16, "Evercrisp");
INSERT INTO Marca (id, nombre) VALUES (17, "Lays");
INSERT INTO Marca (id, nombre) VALUES (18, "Takis");
-- conforts, servilletas
INSERT INTO Marca (id, nombre) VALUES (19, "Elite");

INSERT INTO Marca (id, nombre) VALUES (20, "Confort");
-- detergentes, cloro, lavalozas, pisos
INSERT INTO Marca (id, nombre) VALUES (21, "Vanish");

INSERT INTO Marca (id, nombre) VALUES (22, "OMO");
INSERT INTO Marca (id, nombre) VALUES (23, "Clorox");
INSERT INTO Marca (id, nombre) VALUES (24, "Ariel");
INSERT INTO Marca (id, nombre) VALUES (25, "Quix");
INSERT INTO Marca (id, nombre) VALUES (26, "Poett");
-- pollos, pavo
INSERT INTO Marca (id, nombre) VALUES (27, "Sopraval");

INSERT INTO Marca (id, nombre) VALUES (28, "Super Pollo");
-- bebidas
INSERT INTO Marca (id, nombre) VALUES (29, "Coca-Cola");

INSERT INTO Marca (id, nombre) VALUES (30, "Fanta");
INSERT INTO Marca (id, nombre) VALUES (31, "Pepsi");
INSERT INTO Marca (id, nombre) VALUES (32, "Sprite");
-- energeticas
INSERT INTO Marca (id, nombre) VALUES (33, "Monster Energy");

INSERT INTO Marca (id, nombre) VALUES (34, "Red Bull");
INSERT INTO Marca (id, nombre) VALUES (35, "Score");
-- jugos
INSERT INTO Marca (id, nombre) VALUES (36, "Watt's");

INSERT INTO Marca (id, nombre) VALUES (37, "Andina");
-- cervezas
INSERT INTO Marca (id, nombre) VALUES (38, "Kunstmann");

INSERT INTO Marca (id, nombre) VALUES (39, "Austral");
INSERT INTO Marca (id, nombre) VALUES (40, "Cristal");
-- Sin marca
INSERT INTO Marca (id, nombre) VALUES (41, "Propio");


INSERT INTO Atributo (id, nombre) VALUES (1, "Litros");
INSERT INTO Atributo (id, nombre) VALUES (2, "Kilos");

INSERT INTO Atributo (id, nombre) VALUES (3, "Gramos");
INSERT INTO Atributo (id, nombre) VALUES (4, "Envase");
INSERT INTO Atributo (id, nombre) VALUES (5, "Ingredientes");
INSERT INTO Atributo (id, nombre) VALUES (6, "Fecha caducidad");
INSERT INTO Atributo (id, nombre) VALUES (7, "Cantidad");
INSERT INTO Atributo (id, nombre) VALUES (8, "Calorías");

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

-- Para Marca 1 (Colun)
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (3, 1, "Yogur natural 500g", 890, 10, 1);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (4, 1, "Queso Gouda 200g", 2150, 8, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (5, 1, "Mantequilla sin sal 250g", 1390, 15, 2);
-- Para Marca 2 (Soprole)
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (6, 2, "Yogur frutilla 1kg", 1890, 12, 1);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (7, 2, "Queso Cheddar 300g", 2450, 6, 1);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (8, 2, "Leche entera 2L", 2250, 10, 1);

-- lacteos, mantequillas y postres
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (9, 3, "Postre de chocolate 4 unidades", 1290, 8, 1);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (10, 4, "Milo Instantáneo 400g", 2590, 10, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (11, 5, "Yogur griego natural 750g", 1690, 15, 1);
-- Huevos
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (12, 6, "Huevos A 12 unidades", 1590, 20, 1);

-- Fideos
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (13, 7, "Fideos Spaghetti 500g", 890, 25, 2);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (14, 8, "Fideos Penne Rigate 400g", 950, 20, 2);
-- arroz, aceites, harina
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (15, 9, "Arroz Grano Largo 1kg", 1050, 30, 2);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (16, 10, "Aceite de Oliva Extra Virgen 500ml", 3590, 15, 2);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (17, 11, "Harina de Trigo 2kg", 890, 25, 2);
-- atun, jurel
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (18, 12, "Atún en Aceite 170g", 1890, 18, 3);

-- frutas en conserva, palmitos
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (19, 13, "Duraznos en Almíbar 820g", 2490, 12, 3);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (20, 14, "Palmitos en Conserva 400g", 3790, 10, 3);
-- Snacks
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (21, 15, "Papas Fritas 150g", 1090, 22, 3);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (22, 16, "Cheetos 100g", 1290, 20, 5);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (23, 17, "Lays Original 200g", 1490, 15, 5);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (24, 18, "Takis Fuego 90g", 990, 18, 5);
-- conforts, servilletas
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (25, 19, "Papel Higiénico Elite 12 rollos", 5690, 8, 6);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (26, 20, "Servilletas Confort 200 unidades", 1290, 25, 6);
-- detergentes, cloro, lavalozas, pisos
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (27, 21, "Detergente en Polvo Vanish 2kg", 4190, 12, 6);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (28, 22, "Detergente Líquido OMO 1.5L", 3590, 15, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (29, 23, "Cloro Clorox 1L", 1590, 20, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (30, 24, "Ariel Pods 20 unidades", 4790, 10, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (31, 25, "Lavalozas Quix 500ml", 990, 18, 6);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (32, 26, "Desinfectante Poett Lavanda 750ml", 2290, 15, 6);
-- pollos, pavo
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (33, 27, "Pollo Entero Sopraval 2kg", 4990, 8, 7);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (34, 28, "Pavo Super Pollo 4kg", 8990, 5, 7);
-- bebidas
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (35, 29, "Coca-Cola 2.5L", 1890, 15, 8);

INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (36, 30, "Fanta Naranja 1.5L", 1390, 20, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (37, 31, "Pepsi Light 2L", 1490, 18, 8);
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (38, 32, "Sprite Zero 1L", 1290, 22, 8);
-- energeticas
INSERT INTO Producto (id, marca_id, detalle, precio, stock, categoria_id) VALUES (39, 33, "Monster Energy Original 500ml", 2590, 12, 8);







-- Asignación de atributos a productos

-- Leche natural 1 L
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 1, '1L'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 8, '120'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 4, 'Envase Tetra Pack'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 5, 'Leche de vaca, sin aditivos'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (3, 6, '2023-12-31'); -- Fecha caducidad
-- Leche descremada 500g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 1, '500g'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 8, '80'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 4, 'Envase Tetra Pack'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 5, 'Leche descremada, sin aditivos'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (4, 6, '2023-12-31'); -- Fecha caducidad
-- Yogur frutilla 1kg
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 1, '1kg'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 8, '150'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 4, 'Envase Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 5, 'Yogur con sabor a frutilla'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (6, 6, '2023-12-31'); -- Fecha caducidad
-- Queso Gouda 200g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 2, '200g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 8, '800'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 4, 'Envase Sellado al Vacío'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 5, 'Queso Gouda de alta calidad'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (9, 6, '2023-12-31'); -- Fecha caducidad
-- Arroz Grano Largo 1kg
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 2, '1kg'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 8, '3500'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 4, 'Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 5, 'Arroz de grano largo, 100% natural'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (15, 6, '2023-12-31'); -- Fecha caducidad
-- Aceite de Oliva Extra Virgen 500ml
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 1, '500ml'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 8, '4400'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 4, 'Botella de Vidrio Oscuro'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 5, 'Aceite de Oliva Extra Virgen prensado en frío'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (16, 6, '2023-12-31'); -- Fecha caducidad
-- Atún en Aceite 170g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 2, '170g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 8, '230'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 4, 'Lata de Metal'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 5, 'Atún en aceite de oliva'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (18, 6, '2023-12-31'); -- Fecha caducidad
-- Asignación de atributos a productos (Continuación)

-- Marca 1 (Colun)
-- Mantequilla 200g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 2, '200g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 8, '720'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 4, 'Envase Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 5, 'Mantequilla de vaca, sin sal'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (1, 6, '2023-12-31'); -- Fecha caducidad
-- Leche con Chocolate 500ml
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 1, '500ml'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 8, '250'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 4, 'Botella de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 5, 'Leche con chocolate, lista para consumir'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (2, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 2 (Soprole)
-- Leche Deslactosada 1L

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 1, '1L'); -- Litros
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 8, '90'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 4, 'Envase Tetra Pack'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 5, 'Leche deslactosada, 0% grasa'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (5, 6, '2023-12-31'); -- Fecha caducidad
-- Leche en Polvo 400g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (7, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (7, 8, '440'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (7, 4, 'Envase Lata'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (7, 5, 'Leche en polvo descremada'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (7, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 3 (Nescafé)
-- Café Instantáneo 200g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (11, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (11, 8, '0'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (11, 4, 'Envase Frasco de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (11, 5, 'Café instantáneo de grano 100% puro'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (11, 6, '2023-12-31'); -- Fecha caducidad
-- Chocolate en Polvo 250g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (12, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (12, 8, '180'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (12, 4, 'Envase Lata'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (12, 5, 'Chocolate en polvo sin azúcar añadida'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (12, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 4 (Milo)
-- Avena Instantánea 500g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (13, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (13, 8, '350'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (13, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (13, 5, 'Avena instantánea de grano entero'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (13, 6, '2023-12-31'); -- Fecha caducidad
-- Galletas de Avena 300g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (14, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (14, 8, '200'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (14, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (14, 5, 'Galletas de avena con trozos de chocolate'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (14, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 5 (Surlat)
-- Helado de Vainilla 1L

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 1, '1L'); -- Litros
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 8, '400'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 4, 'Envase Tarro de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 5, 'Helado de vainilla cremoso'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (19, 6, '2023-12-31'); -- Fecha caducidad
-- Queso Crema 200g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 2, '200g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 8, '300'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 4, 'Envase Frasco de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 5, 'Queso crema para untar'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (20, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 6 (Cintazul)
-- Huevos Blancos 12 unidades

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (21, 7, '12'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (21, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 7 (Carozzi)
-- Fideos Spaghetti 500g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (22, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (22, 8, '1600'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (22, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (22, 5, 'Fideos de trigo duro'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (22, 6, '2023-12-31'); -- Fecha caducidad
-- Fideos Penne Rigate 500g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (23, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (23, 8, '1700'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (23, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (23, 5, 'Fideos de trigo duro tipo penne'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (23, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 8 (Lucchetti)


-- Tallarines 500g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (24, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (24, 8, '1500'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (24, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (24, 5, 'Tallarines de trigo duro'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (24, 6, '2023-12-31'); -- Fecha caducidad
-- Sopa Instantánea de Pollo 70g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (25, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (25, 8, '120'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (25, 4, 'Envase Bolsa de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (25, 5, 'Sopa instantánea con sabor a pollo'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (25, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 9 (Costa)
-- Agua Mineral 1.5L

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (26, 1, '1.5L'); -- Litros
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (26, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (26, 4, 'Botella de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (26, 6, '2023-12-31'); -- Fecha caducidad
-- Bebida Energética 250ml
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (27, 1, '250ml'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (27, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (27, 8, '80'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (27, 4, 'Lata de Aluminio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (27, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 10 (Quillayes)
-- Queso Parmesano 100g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (28, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (28, 8, '400'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (28, 4, 'Envase Frasco de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (28, 5, 'Queso parmesano de alta calidad'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (28, 6, '2023-12-31'); -- Fecha caducidad
-- Queso Cheddar 200g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 2, '200g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 8, '600'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 4, 'Envase Frasco de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 5, 'Queso cheddar de textura suave'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (29, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 11 (La Preferida)
-- Aceitunas Verdes 250g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 2, '250g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 8, '120'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 4, 'Frascos de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 5, 'Aceitunas verdes de calidad premium'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (30, 6, '2023-12-31'); -- Fecha caducidad
-- Aceitunas Negras 200g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 2, '200g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 8, '100'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 4, 'Frascos de Vidrio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 5, 'Aceitunas negras de variedad premium'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (31, 6, '2023-12-31'); -- Fecha caducidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 2, '150g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 8, '120'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 4, 'Lata de Metal'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 5, 'Atún al natural, sin aceites añadidos'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (32, 6, '2023-12-31'); -- Fecha caducidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 2, '397g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 7, '1'); -- Cantidad

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 8, '110'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 4, 'Lata de Aluminio'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 5, 'Leche condensada de alta calidad'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (33, 6, '2023-12-31'); -- Fecha caducidad
-- Yogur Natural 150g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 2, '150g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 8, '80'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 4, 'Envase de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 5, 'Yogur natural sin azúcar añadido'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (34, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 14 (Knorr)
-- Sopa de Verduras 80g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 2, '80g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 8, '90'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 4, 'Sobre de Papel'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 5, 'Sopa de verduras deshidratada'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (35, 6, '2023-12-31'); -- Fecha caducidad
-- Caldo de Pollo 1L
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 1, '1L'); -- Litros

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 8, '50'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 4, 'Envase Tetra Pak'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 5, 'Caldo de pollo concentrado'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (36, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 15 (La Serenísima)
-- Manteca 200g

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 2, '200g'); -- Kilos
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 8, '720'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 4, 'Envase Tableta'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 5, 'Manteca de vaca de primera calidad'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (37, 6, '2023-12-31'); -- Fecha caducidad
-- Queso Crema 150g
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 2, '150g'); -- Kilos

INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 7, '1'); -- Cantidad
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 8, '250'); -- Calorías
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 4, 'Envase de Plástico'); -- Envase
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 5, 'Queso crema untable'); -- Ingredientes
INSERT INTO Atributo_Producto (producto_id, atributo_id, valor) VALUES (38, 6, '2023-12-31'); -- Fecha caducidad
-- Marca 16 (Arcor)
