<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>La Cuisine Brasil- Home</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <nav class="navbar">
        <div class="logo">La Cuisine Brasil</div>
        <ul class="nav-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="receitas.jsp">Receitas</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <c:if test="${usuarioLogado != null}">
                <li><a href="logado?id_usuario=${usuarioLogado.getId()}" class="btn-nav-login">${usuarioLogado.getNome()}</a></li>
            </c:if>
            <c:if test="${usuarioLogado == null}">
                <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
            </c:if>
        </ul>
    </nav>

    <header class="hero">
        <div class="hero-text">
            <h1>Cozinhar é uma arte que se compartilha.</h1>
            <p>Descubra as melhores receitas selecionadas por especialistas.</p>
            <a href="cadastro.jsp" class="btn-primary" style="width: auto; padding: 15px 40px;">Criar minha conta</a>
        </div>
    </header>
    <section class="container">
            <h2 class="section-title">Receitas em Destaque</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <div class="card-image" style="background-image: url('resources/images/fundochurrasco.png');"></div>
                    <div class="card-info">
                        <h3>Churrasco Premium</h3>
                        <p>O segredo do ponto perfeito para o seu final de semana.</p>
                        <a href="#" class="btn-link">Ver Receita</a>
                    </div>
                </div>
                <div class="recipe-card">
                    <div class="card-image" style="background-image: url('resources/images/fundopizza.png');"></div>
                    <div class="card-info">
                        <h3>Pizza Artesanal</h3>
                        <p>Massa leve e crocante feita direto na sua pedra ou forno.</p>
                        <a href="#" class="btn-link">Ver Receita</a>
                    </div>
                </div>
                <div class="recipe-card">
                    <div class="card-image" style="background-image: url('resources/images/fundobolo.png');"></div>
                    <div class="card-info">
                        <h3>Bolo de Chocolate</h3>
                        <p>Fofinho e com uma cobertura de dar água na boca.</p>
                        <a href="#" class="btn-link">Ver Receita</a>
                    </div>
                </div>
            </div>
        </section>


            <section class="container bg-light">
                    <h2 class="section-title">Novidades da Semana</h2>
                    <div class="novidades-row">
                        <div class="novidade-banner">
                            <img src="resources/images/fundopizza.png" alt="Pizza">
                            <div class="novidade-tag">NOVO</div>
                        </div>
                        <div class="novidade-texto">
                            <h3>Pizza Artesanal de Fermentação Natural</h3>
                            <p>Descubra como fazer a massa perfeita que descansa por 24 horas. O resultado é uma leveza incomparável e bordas crocantes.</p><br>
                            <a href="receitas.jsp" class="btn-primary" style="width: auto;">Ler Passo a Passo</a>
                        </div>
                    </div>
                </section>

                <section class="container">
                    <h2 class="section-title">As Mais Amadas</h2>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <div class="card-image" style="background-image: url('resources/images/fundochurrasco.png');">
                                <span class="badge-popular">🔥 Popular</span>
                            </div>
                            <div class="card-info">
                                <h3>Churrasco de Domingo</h3>
                                <p>Mais de 5.000 pessoas favoritaram essa receita este mês.</p>
                                <a href="#" class="btn-link">Ver mais</a>
                            </div>
                        </div>

                        <div class="recipe-card">
                            <div class="card-image" style="background-image: url('resources/images/fundobolo.png');">
                                <span class="badge-popular">🔥 Popular</span>
                            </div>
                            <div class="card-info">
                                <h3>Bolo Vulcão</h3>
                                <p>A receita que viralizou nas redes sociais pelo seu recheio cremoso.</p>
                                <a href="#" class="btn-link">Ver mais</a>
                            </div>
                        </div>
                    </div>
                </section>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

    <script src="/resources/javascript/script.js"></script>
</body>
</html>