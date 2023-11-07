<?php
require_once('./Models/Users.php');

class UserController
{
    private $model;

    public function __construct($db)
    {
        $this->model = new Users($db);
    }

    public function obtenertodo()
    {
        $users = $this->model->getAll(); // Reemplaza 'obtenerTodos' con tu método real
        if ($users) {
            header('Content-Type: application/json');
            echo json_encode($users);
        } else {
            http_response_code(201);
        }
    }

    public function obtenerid()
    {
        $userId = isset($_GET['id']) ? $_GET['id'] : null;

        if ($userId !== null) {
            // Lógica para obtener un producto por ID
            $user = $this->model->get($userId); // Reemplaza 'obtenerPorId' con tu método real
            if ($user) {
                header('Content-Type: application/json');
                echo json_encode($user);
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
        $userId = isset($_GET['id']) ? $_GET['id'] : null;
        if ($userId !== null) {
            // Obtiene datos del cuerpo de la solicitud PUT
            $datos = json_decode(file_get_contents("php://input"), true);

            if ($datos && $this->model->update($userId, $datos)) {
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
        $userId = isset($_GET['id']) ? $_GET['id'] : null;
        // Lógica para eliminar un producto por ID
        if ($userId) {
            if ($this->model->delete($userId)) {
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
