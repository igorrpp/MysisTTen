<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = 'Sobre';

// CSS desta página
$_C['pageCSS'] = 'index.css';

// JavaScript desta página
$_C['pageJS'] = 'index.js';

/***** Aqui entra o código PHP desta página *****/

$aboutHTML = '';
$sideBar = '';

$id = (isset($_GET['id'])) ? intval($_GET['id']) : 0;

if ($id == 0) {

    $aboutHTML = <<<HTML

<h2>Sobre</h2>
<p>Nesta seção você encontra diversas informações sobre agente:</p>


HTML;

    $sql = "SELECT `id`, `slug`, `image`, `title`, `preview` 
        FROM `about` 
        WHERE `status` = 'ativo' 
        ORDER BY `id`;";
    $res = $conn->query($sql);

    while ($about = $res->fetch_assoc()) {

        $preview = str_ireplace('{{siteName}}', $_C['siteName'], $about['preview']);

        $aboutHTML .= <<<HTML

<div class="artigo" data-href="sobre.php?id={$about['id']}">

    <a href="sobre.php?id={$about['id']}">
        <img src="{$about['image']}" alt="{$about['title']}">
    </a>
    <div>
        <h3><a href="sobre.php?id={$about['id']}">{$about['title']}</a></h3>
        {$preview}
    </div>

</div>

HTML;
    }
} else {

    $sql = "SELECT * FROM `about` WHERE id = '{$id}' AND status = 'ativo';";
    $res = $conn->query($sql);
    if ($res->num_rows != 1) {
        header('Location: /sobre.php');
        die('Erro de requisição!');
    }

    $about = $res->fetch_assoc();

    $aboutHTML .= <<<HTML

<h3>{$about['title']}</h3>
{$about['text']}

<hr class="dotted">
<p class="center"><a href="/sobre.php">- Mais Sobre -</a></p>

HTML;

    $_C['pageTitle'] = $about['title'];
}

$sideBar = '<h3>Mais Sobre</h3><ul class="linklist">';

$sql = "SELECT `id`, `title` FROM about WHERE status = 'ativo' ORDER BY `id`";
$res = $conn->query($sql);
while ($link = $res->fetch_assoc()) {

    $sideBar .= <<<HTML
    

    <li><a href="sobre.php?id={$link['id']}">{$link['title']}</a></li>

HTML;
}

$sideBar .= '</ul>';

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <?php echo $aboutHTML ?>

</article>

<aside>

    <?php echo $sideBar ?>

</aside>

<?php

require('./_footer.php');

?>