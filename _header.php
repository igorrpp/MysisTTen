<?php

// Processa título da página
if ($_C['pageTitle'] == '') {
    $page_title = "{$_C['siteName']} .:. {$_C['siteSlogan']}";
} else {
    $page_title = "{$_C['siteName']} .:. {$_C['pageTitle']}";
}

// Processa o link CSS da página
if ($_C['pageCSS'] == '') {
    $page_css = '';
} else {
    $page_css = "<link rel=\"stylesheet\" href=\"/css/{$_C['pageCSS']}\">\n\t";
}

// Processa o link JavaScript da página
if ($_C['pageJS'] == '') {
    $page_js = '';
} else {
    $page_js = "<script src=\"/js/{$_C['pageJS']}\"></script>\n";
}

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="./img/logo03.png">
    <?php echo $page_css ?><title><?php echo $page_title ?></title>
</head>

<body>

    <!-- Âncora para início da página -->
    <a id="top" name="top"></a>

    <!-- Enquadramento da página -->
    <div class="wrap">

        <header>
            <a href="/" title="Empereza - Página inicial"><img src="./img/logo03.png" alt="Empereza - Mysisten"></a>
            <h1>MysisTTen <?php echo $_C['siteName'] ?><small><?php echo $_C['siteSlogan'] ?></small></h1>
        </header>

        <nav>
            <a href="/" title="Página inicial"><i class="fas fa-fw fa-home"></i><span>Início</span></a>
            <a href="/noticias.php" title="Notícias atualizadas"><i class="fas fa-fw fa-newspaper"></i><span>Notícias</span></a>
            <a href="/contatos.php" title="Faça contato conosco"><i class="fas fa-fw fa-mail-bulk"></i><span>Contatos</span></a>
            <a href="/sugestao.php" title="Faça contato conosco"><i class="fas fa-fw fa-mail-bulk"></i><span>Sugestões</span></a>
            <a href="/sobre.php" title="Sobre a Empereza"><i class="fas fa-fw fa-info-circle"></i><span>Sobre</span></a>
        </nav>

        <main>