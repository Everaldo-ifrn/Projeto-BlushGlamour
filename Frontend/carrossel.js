
$(document).ready(function() {
    const slide = $('.carrossel');
    const cardWidth = $('.cardMaisVendido').outerWidth(true);
    let currentPosition = 0;

    $('#next').click(function() {
        if (currentPosition > -(cardWidth * 4)) { /* Exibir 5 cards de uma vez */
            currentPosition -= cardWidth;
            slide.css('transform', `translateX(${currentPosition}px)`);
        }
    });

    $('#prev').click(function() {
        if (currentPosition < 0) {
            currentPosition += cardWidth;
            slide.css('transform', `translateX(${currentPosition}px)`);
        }
    });
})
