<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>La Cuisine Brasi- Home</title>
    <link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>

    <jsp:useBean id="gerenciadorReceita" class="br.edu.ifsp.utils.GerenciadorReceita" scope="page" />
    <c:set var="receitasOrdenadas" value="${gerenciadorReceita.buscarReceitasMelhorAvaliadas(applicationScope.listaReceitas)}" />
    <c:set var="ultimaReceita" value="${gerenciadorReceita.buscarUltimaReceitaAdicionada(applicationScope.listaReceitas)}" />
    <c:set var="receitasMaisVisualizadas" value="${gerenciadorReceita.buscarReceitasMaisVisualizadas(applicationScope.listaReceitas)}" />

    <nav class="navbar">
        <a href="index.jsp"><div class="logo">La Cuisine Brasil</div></a>
        <form action="pesquisa" method="post" class="search-container">
            <input type="text" name="query" placeholder="Pesquisar receitas..." required>
        </form>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="receitasCadastradas.jsp">Receitas</a>
            <li><a href="SobreNos.jsp">Sobre o sistema</a></li>
            <c:if test="${usuarioLogado != null}">
                <li><a href="AdicionarReceita.jsp">Cadastrar Receita</a></li>
                <li><a href="MinhasReceitas.jsp">Minhas Receitas</a></li>
                <li><a href="logado?id_usuario=${usuarioLogado.getId()}" class="btn-nav-login">${usuarioLogado.getNome()}</a></li>
                <li><a href="logout" class="btn-nav-logout">Sair</a></li>
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
            <c:if test="${usuarioLogado != null}">
                <a href="AdicionarReceita.jsp" class="btn-primary" style="width: auto; padding: 15px 40px;">Adicionar Receita</a>

            </c:if>
            <c:if test="${usuarioLogado == null}">
            <a href="CadastroCliente.jsp" class="btn-primary" style="width: auto; padding: 15px 40px;">Criar minha conta</a>

            </c:if>
        </div>
    </header>
    <section class="container">
            <h2 class="section-title">Receitas em Destaque</h2>
            <div class="recipe-grid">
                <c:forEach var="receita" items="${receitasOrdenadas}" begin="0" end="2" varStatus="status">
                    <div class="recipe-card">
                        <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/imagem?nome=${receita.getFoto()}');"></div>
                        <div class="card-info">
                            <h3>${receita.nome}</h3>
                            <p>${receita.categoria.categoria} - ${receita.tempoPreparo} min</p>
                            <a href="receita?id=${receita.id}" class="btn-link">Ver Receita</a>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty receitasOrdenadas}">
                    <div class="recipe-card">
                        <div class="card-image" style="background-image: url('resources/images/fundoinicial.png');"></div>
                        <div class="card-info">
                            <h3>Nenhuma receita cadastrada</h3>
                            <p>Assim que novas receitas forem cadastradas, elas aparecerao aqui.</p>
                            <a href="AdicionarReceita.jsp" class="btn-link">Cadastrar Receita</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>
            <section class="container bg-light">
                    <h2 class="section-title">Novidades da Semana</h2>
                    <c:if test="${not empty ultimaReceita}">
                        <div class="novidades-row">
                            <div class="novidade-banner">
                                <img src="${pageContext.request.contextPath}/imagem?nome=${ultimaReceita.foto}" alt="${ultimaReceita.nome}">
                                <div class="novidade-tag">NOVO</div>
                            </div>
                            <div class="novidade-texto">
                                <h3>${ultimaReceita.nome}</h3>
                                <p>${ultimaReceita.categoria.categoria} - ${ultimaReceita.tempoPreparo} min</p><br>
                                <a href="receita?id=${ultimaReceita.id}" class="btn-primary" style="width: auto;">Ler Passo a Passo</a>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${empty ultimaReceita}">
                        <div class="novidades-row">
                            <div class="novidade-banner">
                                <img src="resources/images/fundopizza.png" alt="Sem novidades">
                                <div class="novidade-tag">NOVO</div>
                            </div>
                            <div class="novidade-texto">
                                <h3>Nenhuma receita nova ainda</h3>
                                <p>Cadastre uma nova receita para ela aparecer nesta seção.</p><br>
                                <a href="AdicionarReceita.jsp" class="btn-primary" style="width: auto;">Cadastrar Receita</a>
                            </div>
                        </div>
                    </c:if>
                </section>

                <section class="container">
                    <h2 class="section-title">As Mais Amadas</h2>
                    <div class="recipe-grid">
                        <c:forEach var="receita" items="${receitasMaisVisualizadas}" begin="0" end="2">
                            <div class="recipe-card">
                                <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/imagem?nome=${receita.foto}');">
                                    <span class="badge-popular">🔥 Popular</span>
                                </div>
                                <div class="card-info">
                                    <h3>${receita.nome}</h3>
                                    <p>${receita.categoria.categoria} - ${receita.tempoPreparo} min</p>
                                    <p>${receita.visualizacoes} visualizacoes</p>
                                    <a href="receita?id=${receita.id}" class="btn-link">Ver mais</a>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty receitasMaisVisualizadas}">
                            <div class="recipe-card">
                                <div class="card-image" style="background-image: url('resources/images/fundoinicial.png');"></div>
                                <div class="card-info">
                                    <h3>Nenhuma receita visualizada ainda</h3>
                                    <p>As receitas mais acessadas aparecerao aqui.</p>
                                    <a href="receitasCadastradas.jsp" class="btn-link">Ver receitas</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </section>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasi - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

    <script src="/resources/javascript/script.js"></script>
</body>
</html>