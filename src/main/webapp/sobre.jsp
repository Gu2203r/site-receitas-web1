
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Sobre Nós - La Cuisine Brasil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="logo">La Cuisine <span>Brasil</span></div>
        <ul class="nav-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="receitasCadastradas.jsp">Receitas</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
        </ul>
    </nav>

    <main class="container">
        <div class="sobre-wrapper">
            <section class="sobre-texto">
                <h2 class="section-title" style="text-align: left;">Nossa Paixão por Inovar</h2>
                <p>O <strong>La Cuisine Brasil</strong> nasceu para ser mais do que um simples repositório de pratos. Somos uma comunidade vibrante feita por e para pessoas que enxergam a cozinha como um laboratório de arte e inovação.</p>

                <div class="sobre-cards-info">
                    <div class="info-item">
                        <span class="info-icon">💡</span>
                        <h4>Criatividade</h4>
                        <p>Incentivamos você a adaptar, trocar ingredientes e criar sua própria versão de clássicos.</p>
                    </div>
                    <div class="info-item">
                        <span class="info-icon">🌍</span>
                        <h4>Comunidade</h4>
                        <p>Compartilhe suas descobertas com outros apaixonados pela gastronomia brasileira e mundial.</p>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>