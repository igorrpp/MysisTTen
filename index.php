<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = '';

// CSS desta página
$_C['pageCSS'] = 'index.css';

// JavaScript desta página
$_C['pageJS'] = 'index.js';

/***** Aqui entra o código PHP desta página *****/

// Variável com o HTML do conteúdo
$contHTML = '';

// Obtém os artigos do banco de dados
$sql = "SELECT `cont_id`, `cont_image`, `cont_title`, `cont_preview` 
        FROM `content` 
        WHERE `cont_status` = 'ativo' 
        ORDER BY `cont_date` DESC";
$res = $conn->query($sql);

// Obter cada tregisto que veio do DB
while ($cont = $res->fetch_assoc()) {

    $contHTML .= <<<HTML

<div class="artigo" data-href="/ler.php?id={$cont['cont_id']}">

    <a href="/ler.php?id={$cont['cont_id']}">
        <img src="{$cont['cont_image']}" alt="{$cont['cont_title']}">
    </a>
    <div>
        <h3><a href="/ler.php?id={$cont['cont_id']}">{$cont['cont_title']}</a></h3>
        {$cont['cont_preview']}
    </div>

</div>

HTML;
}

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <h2>Artigos Recentes</h2>

    <?php echo $contHTML ?>

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