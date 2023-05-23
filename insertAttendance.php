<?php 
session_start();
$alert='';
if($_SERVER['REQUEST_METHOD']=='GET'){
    try {
        $id_sv = $_GET['id_sv'];
        $classname = $_GET['classname'];

        $conn = new PDO("mysql:host=localhost;dbname=btth02", 'root', '');
        $sql = "select id_class from classes where classname = :classname";
    
        echo $class;
    } 
    catch(PDOException $e) {
        echo 'Error: ' .$e->getMessage();
    }
}
?>