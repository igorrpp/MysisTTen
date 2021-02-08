<?php

/**
 * Configuração do aplicativo
 * 
 * By Luferat - www.luferat.net
 */

// PHP em UTF-8
header('Content-type: text/html; charset=utf-8;');

/***** Conexão com MySQL *****/

// Se estou no XAMPP
if ($_SERVER['SERVER_NAME'] == 'intranet.localhost') {

    // Conexão com o MySQL do XAMPP
    // (servidor do mysql, usuário, senha, nome do db)
    $conn = new mysqli('localhost', 'root', '', 'intranet');

    // Se não estou no XAMPP estou no provedor de hospedagem
} else {

    // Conexão com o MySQL do provedor
    // (servidor do mysql, usuário, senha, nome do db)
    // Obtidos do painel de controles do provedor de hospedagem
    $conn = new mysqli('server', 'user', 'password', 'database');
}

// Checa conexão
if ($conn->connect_error) {
    die("Falha de conexão com o Database: " . $conn->connect_error);
}

/**** Ajustes na conexão *****/

// MySQL em UTF-8
$conn->query('SET NAMES utf8');
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');

// Datas em pt-BR
$conn->query('SET GLOBAL lc_time_names=pt_BR');
$conn->query('SET lc_time_names=pt_BR');

/***** Define variáveis do aplicativo (virão do DB) *****/
/* As configurações devem ser feitas diretamente na tabela 'config' */

// Variável com as configurações da página
$_C = array();

// Obtém variável de configurações do database
$res = $conn->query("SELECT * FROM config");
while ($data = $res->fetch_assoc()) {

    // Armazena cada configuração em '$_C[]'
    $_C[$data['variable']] = $data['value'];
}
