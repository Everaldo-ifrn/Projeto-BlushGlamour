JavaScript (carrossel.js)

$(document).ready(function() {
    const slide = $('.carousel-slide');
    const cards = $('.carousel-slide .card');
    const prevBtn = $('#prev');
    const nextBtn = $('#next');

    let currentIndex = 0;

    nextBtn.click(function() {
        currentIndex++;
        if (currentIndex >= cards.length - 2) { // -2 porque estamos mostrando 3 cards de cada vez
            currentIndex = cards.length - 3;
        }
        slide.css('transform', `translateX(-${currentIndex * (100 / 3)}%)`);
    });

    prevBtn.click(function() {
        currentIndex--;
        if (currentIndex < 0) {
            currentIndex = 0;
        }
        slide.css('transform', `translateX(-${currentIndex * (100 / 3)}%)`);
    });
});
