<?php
require_once('./Models/Products.php');

class ProductController
{
    private $model;

    public function __construct($db)
    {
        $this->model = new Products($db);
    }

    public function obtenertodo()
    {
        $productos = $this->model->getAll(); // Reemplaza 'obtenerTodos' con tu método real
        if ($productos) {
            header('Content-Type: application/json');
            echo json_encode($productos);
        } else {
            http_response_code(201);
        }
    }

    public function obtenerid()
    {
        $productId = isset($_GET['id']) ? $_GET['id'] : null;

        if ($productId !== null) {
            // Lógica para obtener un producto por ID
            $producto = $this->model->get($productId); // Reemplaza 'obtenerPorId' con tu método real
            if ($producto) {
                header('Content-Type: application/json');
                echo json_encode($producto);
            } else {
                http_response_code(404);
                echo json_encode(['error' => 'Producto no encontrado']);
            }
        } else {
            http_response_code(404);
            echo json_encode(['error' => 'No se encontraron productos']);
        }
    }

    public function crear()
    {
        // Obtiene datos del cuerpo de la solicitud POST
        $datos = json_decode(file_get_contents("php://input"), true);

        if ($datos && $this->model->create($datos)) {
            http_response_code(201);
            echo json_encode(['mensaje' => 'Producto creado con exito']);
        } else {
            http_response_code(400);
            echo json_encode(['error' => 'No se pudo crear el producto']);
        }
    }

    public function actualizar()
    {
        $productId = isset($_GET['id']) ? $_GET['id'] : null;
        if ($productId !== null) {
            // Obtiene datos del cuerpo de la solicitud PUT
            $datos = json_decode(file_get_contents("php://input"), true);

            if ($datos && $this->model->update($productId, $datos)) {
                echo json_encode(['mensaje' => 'Producto actualizado con exito']);
            } else {
                http_response_code(400);
                echo json_encode(['error' => 'No se pudo actualizar el producto']);
            }
        } else {
            http_response_code(400);
            echo json_encode(['error' => 'ID de producto no proporcionado']);
        }
    }

    public function eliminar()
    {
        $productId = isset($_GET['id']) ? $_GET['id'] : null;
        // Lógica para eliminar un producto por ID
        if ($productId) {
            if ($this->model->delete($productId)) {
                echo json_encode(['mensaje' => 'Producto eliminado con exito']);
            } else {
                return false;
            }
        } else {
            return false;
        }
        return true;
    }
}
