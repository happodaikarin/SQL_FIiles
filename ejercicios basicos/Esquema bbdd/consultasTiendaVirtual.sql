-- Encuentra otros productos en las mismas categorías que el usuario ha comprado antes.
SELECT DISTINCT p.ProductoID, p.Nombre, p.Precio
FROM Productos p
INNER JOIN DetallesPedido dp ON p.ProductoID = dp.ProductoID
INNER JOIN (
    SELECT DISTINCT ProductoID
    FROM DetallesPedido dp
    INNER JOIN Pedidos pe ON dp.PedidoID = pe.PedidoID
    WHERE pe.UsuarioID = ? -- ID del usuario para las recomendaciones
) AS ComprasPrevias ON p.ProductoID != ComprasPrevias.ProductoID
WHERE p.Categoria IN (
    SELECT DISTINCT Categoria
    FROM Productos
    WHERE ProductoID IN (SELECT ProductoID FROM ComprasPrevias)
)
AND p.Stock > 0
ORDER BY p.Nombre;

