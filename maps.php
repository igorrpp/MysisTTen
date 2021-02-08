<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = 'Nossa Localização';

// CSS desta página
$_C['pageCSS'] = 'maps.css';

// JavaScript desta página
$_C['pageJS'] = '';

/***** Aqui entra o código PHP desta página *****/

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <h2><?php echo $_C['pageTitle'] ?></h2>
    <p>Venha conhecer nossa empresa, estamos com vagas abertar!<span id="keyword"></span>'.</p>
    <div id="news"></div>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29410.659203767824!2d-43.80066053425262!3d-22.86417619843005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9bf88e6376b9cf%3A0xec04d61331675b88!2sItagua%C3%AD%20Shopping%20Center!5e0!3m2!1spt-BR!2sbr!4v1612796534690!5m2!1spt-BR!2sbr"
         width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
</article>

<?php

require('./_footer.php');

?>