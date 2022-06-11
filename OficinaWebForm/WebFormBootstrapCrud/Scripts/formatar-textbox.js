
$(function ($) {
    $('.numero-moeda').autoNumeric('init',
        { aSign: 'R$ ', aSep: '.', aDec: ',', dGroup: '3' });
});
$(function ($) {
    $('.numero-decimal').autoNumeric('init',
        { aSign: '', aSep: '.', aDec: ',', dGroup: '3' });
});
$(function ($) {
    $('.numero-inteiro').autoNumeric('init', { aSep: '', mDec: '0', dGroup: '3' });
});

$(function ($) {
    $(".data-formato").mask("99/99/9999");
});

$(function ($) {
    $(".telefone-formato").mask("(99) 9.9999-9999");
});
$(function ($) {
    $(".cep-formato").mask("99999-999");
});

$(function ($) {
    $(".cpf-formato").mask("999.999.999-99");
});

$(function ($) {
    $(".cnpj-formato").mask("99.999.999/9999-99");
});

