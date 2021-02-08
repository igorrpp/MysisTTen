<?php

// Configuração global do site
require('./_config.php');

/***** Configurações desta página *****/

// Título da página
$_C['pageTitle'] = 'Faça Contato';

// CSS desta página
$_C['pageCSS'] = 'contatos.css';

// JavaScript desta página
$_C['pageJS'] = '';

/***** Aqui entra o código PHP desta página *****/

// Variáveis
$feedback = false;

// Se o formulario foi enviado
if (isset($_POST['contact-send'])) {

    // Obtém campos do HTTP
    $name = trim(filter_input(INPUT_POST, 'contact-name', FILTER_SANITIZE_STRING));
    $email = trim(filter_input(INPUT_POST, 'contact-email', FILTER_SANITIZE_EMAIL));
    $subject = trim(filter_input(INPUT_POST, 'contact-subject', FILTER_SANITIZE_STRING));
    $message = trim(filter_input(INPUT_POST, 'contact-message', FILTER_SANITIZE_STRING));

    // Formata SQL e executa
    $sql = "
        INSERT INTO contacts (name, email, subject, message) VALUES
        ('{$name}', '{$email}', '{$subject}', '{$message}');
    ";
    $conn->query($sql);

    // Mostra feedback
    $feedback = true;
}

/***** Aqui termina o código PHP desta página *****/

require('./_header.php');

?>

<article>

    <h2>Faça Contato</h2>

    <?php if (!$feedback) : ?>

        <form method="POST" name="contact" id="contact">

            <p>Preencha os campos abaixo para entrar em contato com a equipe do <?php echo $_C['siteName'] ?>.</p>

            <p class="center small red">* Todos os campos são obrigatórios.</p>

            <input type="hidden" name="contact-send" id="contact-send" value="Ok">

            <p>
                <label for="name">Nome:</label>
                <input type="text" name="contact-name" id="contact-name" required minlength="3">
            </p>

            <p>
                <label for="email">E-mail:</label>
                <input type="email" name="contact-email" id="contact-email" required>
            </p>

            <p>
                <label for="subject">Assunto:</label>
                <input type="text" name="contact-subject" id="contact-subject" required minlength="3">
            </p>

            <p>
                <label for="message">Menssagem:</label>
                <textarea name="contact-message" id="contact-message" required minlength="5"></textarea>
            </p>

            <p>
                <label for="submit"></label>
                <button type="submit" name="contact-submit" id="contact-submit">Enviar</button>
            </p>

        </form>

    <?php else : ?>

        <p><strong>Olá <?php echo $name ?>!</strong></p>
        <p>Seu contato foi enviado com sucesso.</p>
        <p><em>Obrigado...</em></p>
        <p class="center">
            <a href="/"><i class="fas fa-fw fa-home"></i> Página inicial</a>
        </p>

    <?php endif ?>

</article>


<?php

require('./_footer.php');

?>