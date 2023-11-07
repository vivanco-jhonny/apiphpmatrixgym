<?php
require('./Controller/ProductController.php');
require('./Controller/UserController.php');
require('./vendor/autoload.php');

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Configura la conexión a la base de datos
$dominioPermitido = $_ENV['HOST_ENABLE'];
$name = $_ENV['ROUTE_NAME'];
$host = $_ENV['DDBB_HOST'];
$database = $_ENV['NAME_DATABASE'];
$user = $_ENV['DDBB_USERNAME'];
$password  = $_ENV['DDBB_PASSWORD'];
// Configura el CORS para aceptar consultas desde otro puerto
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
// Permitir encabezados personalizados
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
// Permitir credenciales si es necesario
header("Access-Control-Allow-Credentials: true");

$mysqli = new mysqli($host, $user, $password, $database);

if ($mysqli->connect_error) {
    die('Error de conexión a la base de datos: ' . $mysqli->connect_error);
}

$productId = isset($_GET['id']) ? $_GET['id'] : null;
$productController = new ProductController($mysqli);
$userId = isset($_GET['id']) ? $_GET['id'] : null;
$userController = new UserController($mysqli);

$rutas = [
    $name.'/products' => [
        'controller' => $productController,
        'methods' => [
            'GET' => 'obtenertodo', // Ruta para obtener todos los productos
            'POST' => 'crear', // Ruta para crear un nuevo producto
        ]
    ],
    $name.'/products?id='.$productId => [
        'controller' => $productController,
        'methods' => [
            'GET' => 'obtenerid', // Ruta para obtener un producto por ID
            'PUT' => 'actualizar', // Ruta para actualizar un producto por ID
            'DELETE' => 'eliminar', // Ruta para eliminar un producto por ID
        ]
    ],
    $name.'/users' => [
        'controller' => $userController,
        'methods' => [
            'GET' => 'obtenertodo', // Ruta para obtener todos los productos
            'POST' => 'crear', // Ruta para crear un nuevo producto
        ]
    ],
    $name.'/users?id='.$userId => [
        'controller' => $userController,
        'methods' => [
            'GET' => 'obtenerid', // Ruta para obtener un producto por ID
            'PUT' => 'actualizar', // Ruta para actualizar un producto por ID
            'DELETE' => 'eliminar', // Ruta para eliminar un producto por ID
        ]
    ]
];

$request_uri = $_SERVER['REQUEST_URI'];
$method = $_SERVER['REQUEST_METHOD'];

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
    header('Access-Control-Allow-Credentials: true');
    http_response_code(200);
    exit;
}

if (array_key_exists($request_uri, $rutas)) {
    $ruta = $rutas[$request_uri];
    
    if (array_key_exists($method, $ruta['methods'])) {
        $controlador = $ruta['controller'];
        $accion = $ruta['methods'][$method];
        $controlador->$accion();
    } else {
        http_response_code(405);
        echo json_encode(['error' => 'Método no permitido']);
    }
} else {
    http_response_code(404);
    echo $request_uri;
    echo json_encode(['error' => 'Ruta no encontrada']);
}
?>