<?php
class Products
{
    private $db;
    private $tabla = 'products';

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll()
    {
        $query = "SELECT * FROM $this->tabla";
        $result = $this->db->query($query);
        $products = array();
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
        return $products;
    }

    public function get($id) {
        // Utiliza tu objeto de conexión a la base de datos y consulta SQL para obtener el producto por su ID
        $query = "SELECT * FROM $this->tabla WHERE id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param('i', $id); // 'i' representa un entero
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            return $result->fetch_assoc();
        } else {
            return null; // Producto no encontrado
        }
    }

    public function create($datos)
    {
        $name = $this->db->real_escape_string($datos['name']);
        $price = $this->db->real_escape_string($datos['price']);
        $image = $this->db->real_escape_string($datos['image']);
        $stock = $this->db->real_escape_string($datos['stock']);
        $datein= $this->db->real_escape_string($datos['datein']);
        $dateregister = $this->db->real_escape_string($datos['dateregister']);
        $mark = $this->db->real_escape_string($datos['mark']);
        $state = $this->db->real_escape_string($datos['state']);
        $query = "INSERT INTO $this->tabla (name, price, image, stock, datein, dateregister, mark, state) 
        VALUES ('$name', '$price', '$image', '$stock', '$datein', '$dateregister', '$mark', '$state')";
        $result = $this->db->query($query);
        if ($result === false) {
            die('Error en la consulta: ' . $this->db->error);
        }

        return $result;
    }

    public function update($id, $datos)
    {
        $name = $datos['name'];
        $price = $datos['price'];
        $image = $datos['image'];
        $stock = $datos['stock'];
        $datein= $datos['datein'];
        $dateregister = $datos['dateregister'];
        $mark = $datos['mark'];
        $state = $datos['state'];

        $query = "UPDATE $this->tabla SET name='$name', price='$price', image='$image', stock='$stock', datein='$datein', dateregister='$dateregister', mark='$mark', state='$state' WHERE id=$id";
        return $this->db->query($query);
    }

    public function delete($id)
    {
        $id = $this->db->real_escape_string($id);
        $query = "DELETE FROM $this->tabla WHERE id = $id";
        $result = $this->db->query($query);

        if ($result === false) {
            die('Error en la consulta: ' . $this->db->error);
        }

        return $result;
    }
}
