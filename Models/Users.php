<?php
class Users
{
    private $db;
    private $tabla = 'users';

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
        $email = $this->db->real_escape_string($datos['email']);
        $permissions = $this->db->real_escape_string($datos['permissions']);
        $state = $this->db->real_escape_string($datos['state']);
        $query = "INSERT INTO $this->tabla (email, permissions, state) 
        VALUES ('$email', '$permissions', '$state')";
        $result = $this->db->query($query);
        if ($result === false) {
            die('Error en la consulta: ' . $this->db->error);
        }

        return $result;
    }

    public function update($id, $datos)
    {
        $email = $datos['email'];
        $permissions = $datos['permissions'];
        $state = $datos['state'];
        $query = "UPDATE $this->tabla SET email='$email', permissions='$permissions', state='$state' WHERE id=$id";
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
