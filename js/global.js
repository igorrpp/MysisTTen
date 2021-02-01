/**
 * Esta é a aplicação JavaScript principal.
 * 
 * Dependências:
 *      'jQuery' --> https://jquery.com/
 *      'JS.Cookie' --> https://github.com/Luferat/js-cookie
 * 
 * By Luferat <contato@luferat.net>
 */

// Inicializa aplicação
$(document).ready(mainApp);

// Aplicativo principal
function mainApp() {

    /***** Código JS do site *****/

    // Popup dos cookies com o tempo em segundos
    popupCookie(30);

    // Botão para aceitar cookies
    $(document).on('click', '#cookie-acceps', acceptCookies);

    // Botão para saber mais sobre os cookies
    $(document).on('click', '#cookie-more', aboutCookies);

}

// Popup dos cookies
function popupCookie(seconds) {

    // Se já aceitou cookies antes
    if (Cookies.get('accept-cookies') == 'accept') {

        // Sai sem fazer nada
        return false;

        // Se não aceitou cookies antes
    } else {

        // Exibe popup dos cookies
        $('#cookie-wrap').show('fast', () => {

            // Inicializa timer
            seg = seconds;

            // Timer
            timer = setInterval(() => {

                // Se expirou o timer
                if (seg == 0) {

                    // Aceita os cookies automaticamente
                    acceptCookies();

                    // Ainda não expirou o timer
                } else {

                    // Exibe o contador
                    $('#countDown').text(seg);

                    // Decrementa o contador
                    seg--;

                }

                // Executa o timer a cada 1 segundo
            }, 1000);
        });
    }
}

// Aceita cookies
function acceptCookies() {

    // interrompe o timer
    clearInterval(timer);

    // Oculta popup
    $('#cookie-wrap').hide('fast', () => {

        // Grava cookie de aceite
        Cookies.set('accept-cookies', 'accept', { expires: 365, path: '/' })
    });
}

// Saber mais sobre os cookies
function aboutCookies() {
    location.href = '/cookies.php';
}