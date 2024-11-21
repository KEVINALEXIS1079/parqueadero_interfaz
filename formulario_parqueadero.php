<?php
require_once("autoload.php");


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['registrar'])) {
    $nombre = trim($_POST["nombre"]);
    $telefono = trim($_POST["telefono"]);
    $placa = trim($_POST["placa"]);
    $marca = trim($_POST["marca"]);
    $color = trim($_POST["color"]);
    $hora_entrada = $_POST["hora_entrada"];

    if (empty($nombre) || empty($telefono) || empty($placa) || empty($marca) || empty($color) || empty($hora_entrada)) {
        echo "<p>Por favor, complete todos los campos.</p>";
    } else {
        $conexion = new conexion();
        $cliente = new Cliente($telefono, $nombre);
        $idCliente = $cliente->guardarCliente();

        if ($idCliente) {
            $vehiculo = new Vehiculo($idCliente, $placa, $marca, $color);
            $idVehiculo = $vehiculo->guardarVehiculo();

            if ($idVehiculo) {
                $puesto = new Puesto();
                $asignado = $puesto->asignarPuesto($idVehiculo, $hora_entrada);
                if ($asignado) {
                    echo "Vehículo registrado y puesto asignado exitosamente.<br>";
                } else {
                    echo "No hay puestos disponibles.<br>";
                }
            } else {
                echo "Error al registrar el vehículo.<br>";
            }
        } else {
            echo "Error al registrar el cliente.<br>";
        }
    }
}


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['salida'])) {
    $placa = trim($_POST["placa_salida"]);

    if (empty($placa)) {
        echo "<p>Por favor, ingrese el espacio  del vehículo.</p>";
    } else {
        $conexion = new conexion();
        $puesto = new Puesto();
        $costo = $puesto->calcularCostoEstacionamiento($placa);

        if ($costo !== false) {
            echo "Puesto liberado correctamente. Costo de estacionamiento: $" . $costo . "<br>";
        } else {
            echo "Error al liberar el puesto.<br>";
        }
    }
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Parqueadero</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>

<div class="formulario">
    
    <form action="" method="post">
        <h3>Registro de Vehículo</h3>
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" required><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" required><br>

        <label for="placa">Placa:</label>
        <input type="text" name="placa" required><br>

        <label for="marca">Marca:</label>
        <input type="text" name="marca" required><br>

        <label for="color">Color:</label>
        <input type="text" name="color" required><br>

        <label for="hora_entrada">Fecha de ingreso:</label>
        <input type="datetime-local" name="hora_entrada" required><br>

        <button type="submit" name="registrar">Registrar Vehículo</button>
    </form>
</div>

<div class="puestos">
    <h1>Puestos Libres</h1>
    <?php
    require_once("clases/Puesto.php");
    
    $puesto = new Puesto();
    $puestosLibres = $puesto->obtenerPuestosLibres(); 

    if (!empty($puestosLibres)) {
        echo "<ul>";
        foreach ($puestosLibres as $p) {
            $estadoColor = ($p['estado'] == 'libre') ? 'green' : 'red';
            echo "<li style='color: $estadoColor;'>Puesto ID: " . htmlspecialchars($p['id_puesto']) . " - Estado: " . htmlspecialchars($p['estado']) . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>No hay puestos disponibles.</p>";
    }
    ?>

<h1>Puestos ocupados</h1>
    <?php
    require_once("clases/Puesto.php");
    
    $puesto = new Puesto();
    $puestosOcupados = $puesto->obtenerPuestosOcupados(); 

    if (!empty($puestosOcupados)) {
        echo "<ul>";
        foreach ($puestosOcupados as $p) {
            $estadoColor = ($p['estado'] == 'libre') ? 'green' : 'red';
            echo "<li style='color: $estadoColor;'>Puesto ID: " . htmlspecialchars($p['id_puesto'] ?? '') . " - Estado: " . htmlspecialchars($p['estado'] ?? '') . " - Cliente: " . htmlspecialchars($p['nombre'] ?? 'Desconocido'). "</li>";
    }
    
        echo "</ul>";
    } else {
        echo "<p>No hay puestos ocupados.</p>";
    }
    ?>

<form action="" method="post">
        <h3>Salida de Vehículo</h3>
        <label for="hora_salida">Fecha de salida:</label>
        <input type="datetime-local" name="hora_salida" required><br>
        <label for="placa_salida">ingrese el puesto:</label>
        <input type="text" name="placa_salida" required><br>

        <button type="submit" name="salida">Registrar Salida</button>
    </form>
</div>


</body>
</html>
