/**
 * JavaScript de index.js
 */

// Detecta cliques em um artigo
$(document).on('click', '.artigo', loadArt);


function loadArt() {

    // Se existe 'data-href'
    if ($(this).attr('data-href')) {

        // Acessa o endereço em 'data-href'
        location.href = $(this).attr('data-href');

    }

}