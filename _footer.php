</main>

<footer>

    <div class="info">

        <a href="/" title="Ir para a página inicial."><i class="fas fa-fw fa-home"></i></a>
        <div>
            <?php echo $_C['copyright'] ?>
            <small>Todos os direitos reservados</small>
        </div>
        <a href="#top" title="ir para o topo desta página."><i class="fas fa-fw fa-arrow-alt-circle-up"></i></a>

    </div>

    <div class="menu">

        <!-- Menu de redes sociais -->
        <div class="social">
            <?php
 
            // Links das redes sociais gerados dinamicamente
            $socials = array('facebook', 'youtube', 'twitter', 'instagram');
            $socialLinks = '';
            foreach($socials as $link) {
                if (isset($_C[$link])) {
                    $socialName = ucfirst($link); // facebook --> Facebook
                    $socialLinks .= <<<LINK
<a href="{$_C[$link]}" target="_blank" title="{$_C['siteName']} no {$socialName}.">
    <i class="fab fa-fw fa-{$link}-square"></i>
    <span>{$socialName}</span>
</a>

LINK;
                }
            }
            echo $socialLinks;
            ?>
        </div>

        <!-- Menu de acesso rápido -->
        <div class="tools">
            <a href="/sobre.php?id=1" title="Sobre o <?php echo $_C['siteName'] ?>."><i class="fas fa-fw fa-building"></i><span>Sobre agente</span></a>
            <a href="/sobre.php?id=2" title="Sobre este site."><i class="fas fa-fw fa-globe"></i><span>Sobre o Site</span></a>
            <a href="/contatos.php" title="Faça contato com a Empereza."><i class="fas fa-fw fa-mail-bulk"></i><span>Faça Contato</span></a>
            <a href="/sobre.php?id=3" title="Sobre sua privacidade."><i class="fas fa-fw fa-unlock-alt"></i><span>Sua Privacidade</span></a>
        </div>

    </div>

</footer>

</div>

<!-- Popup dos cookies atendendo a LGPD -->

<div id="cookie-wrap">

    <div id="cookie-msg">

        <div id="cookie-text">
            Usamos <strong>Cookies</strong> para que você tenha uma melhor experiência de navegação, mas,
            nenhuma informação sigilosa sobre você é armazenada.
        </div>
        <div id="cookie-buttons">
            <span id="countDown"></span>
            &rarr;
            <button id="cookie-acceps">Aceitar</button>
            <button id="cookie-more">Saber mais</button>
        </div>

    </div>

</div>

<!-- Carga dos JavaScripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/global.js"></script>
<script src="/js/js.cookie.min.js"></script>
<?php echo $page_js ?>

</body>

</html>