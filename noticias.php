<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = 'Notícias Atualizadas';

// CSS desta página
$_C['pageCSS'] = 'noticias.css';

// JavaScript desta página
$_C['pageJS'] = 'noticias.js';

/***** Aqui entra o código PHP desta página *****/

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <h2><?php echo $_C['pageTitle'] ?></h2>
    <p>Últimas notícias do Brasil e do mundo no Google News sobre '<span id="keyword"></span>'.</p>
    <div id="news"></div>

</article>


<?php

require('./_footer.php');

?>