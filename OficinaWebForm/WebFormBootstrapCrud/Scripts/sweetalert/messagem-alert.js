
function mensegemAlert(title, text, type = 'success') {

    Swal.fire(
        title,
        text,
        type
    )
}


function mensegemAlert2(title, text, type) {

    Swal.fire(
        'The Internet?',
        'That thing is still around?',
        'question'
    )
}