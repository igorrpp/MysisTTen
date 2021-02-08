<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = 'Artigo Completo';

// CSS desta página
$_C['pageCSS'] = 'ler.css';

// JavaScript desta página
$_C['pageJS'] = '';

/***** Aqui entra o código PHP desta página *****/

// Variável que exibe o artigo completo
$artHTML = '';

// Obtendo o ID do artigo da URL
$id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;

// Caso artigo não exista, retorna para a listagem
if ($id == 0) {
    header('Location: /index.php');
}

// Obter o artigo do database
$sql = "SELECT *, DATE_FORMAT(cont_date, '%d/%m/%Y às %H:%i') AS datebr 
        FROM `content` 
        INNER JOIN authors ON aut_id = cont_author 
        WHERE `cont_id` = '{$id}' AND `cont_status` = 'ativo'";
$res = $conn->query($sql);

// Caso artigo não exista, retorna para a listagem
if ($res->num_rows != 1) {
    header('Location: /index.php');
}

// Se encontrou o artigo gera a view
$art = $res->fetch_assoc();

$artHTML .= <<<HTML

    <h2>{$art['cont_title']}</h2>
 <!-- Banner noticia -->
    <img class="banner" src="{$art['cont_imgBanner']}">
    <small class="autordata">
        Por <a href="{$art['aut_link']}" target="_blank">{$art['aut_name']}</a> em {$art['datebr']}.
    </small>
    {$art['cont_text']}
    <hr>
    <p class="center">
        <a href="/">Lista de Artigos</a>
    </p>

HTML;

$_C['pageTitle'] = $art['cont_title'];

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <?php echo $artHTML ?>

</article>

<!--
<aside>

    <h3>Sidebar</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident necessitatibus atque.</p>

</aside>
-->
<?php

require('./_footer.php');

?>