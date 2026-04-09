// 1. Mostrar um alerta de "Sucesso" ao "cadastrar"
function confirmarCadastro(event) {
    // Impede o erro 404 por um momento para mostrar a mensagem
    event.preventDefault();
    alert("Conta criada com sucesso! Redirecionando para o Login...");
    window.location.href = "login.jsp";
}

// 2. Filtro de Pesquisa em Tempo Real (Simulado)
document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.querySelector('.search-container input');

    if(searchInput) {
        searchInput.addEventListener('keyup', (e) => {
            console.log("Pesquisando por: " + e.target.value);
            // Aqui você poderia esconder os cards que não batem com o nome
        });
    }
});

// 3. Efeito de mudar a cor da Navbar ao rolar a página
window.onscroll = function() {
    const nav = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        nav.style.backgroundColor = "rgba(43, 21, 6, 0.95)"; // Fica levemente transparente
    } else {
        nav.style.backgroundColor = "#2b1506";
    }
};