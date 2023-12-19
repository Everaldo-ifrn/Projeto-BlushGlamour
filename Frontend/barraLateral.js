// No seu arquivo JavaScript (barraLateral.js)

// Obtém referência para o botão de alternância do menu e conteúdo principal
const toggleBtn = document.getElementById('toggle-btn');
const fecharBtn = document.getElementById('fechar-btn');
const barraLateral = document.getElementById('barra-lateral');

// Adiciona um evento de clique para abrir a barra lateral
toggleBtn.addEventListener('click', function() {
    barraLateral.style.left = '0';
});

// Adiciona um evento de clique para fechar a barra lateral
fecharBtn.addEventListener('click', function() {
    barraLateral.style.left = '-400px';
});