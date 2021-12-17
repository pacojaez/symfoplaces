<?php

  $host_name = 'db5006046034.hosting-data.io';
  $database = 'dbs5063716';
  $user_name = 'dbu2522778';
  $password = 'SymfoPlaces01_$';

  $link = new mysqli($host_name, $user_name, $password, $database);

  if ($link->connect_error) {
    die('<p>Error al conectar con servidor MySQL: '. $link->connect_error .'</p>');
  } else {
    echo (($password));
    echo '<p>Se ha establecido la conexión al servidor MySQL con éxito.</p>';
  }


// phpinfo();
