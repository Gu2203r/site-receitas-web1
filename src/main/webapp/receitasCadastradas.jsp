<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Receitas Cadastradas - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="page-shell" style="background: #f4f4f4;">
    <nav class="navbar">
     <a href="index.jsp"><div class="logo">La Cuisine Brasil</div></a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="receitasCadastradas.jsp">Receitas cadastradas</a></li>

        </ul>

        <form class="search-container" action="${pageContext.request.contextPath}/pesquisa" method="post">
            <input type="text" name="receita_busca" placeholder="Pesquisar" aria-label="Pesquisar receitas">
            <button type="submit" class="search-icon" style="background: none; border: none; cursor: pointer;">Buscar</button>
        </form>

        <ul class="nav-links">
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

    <main class="page-content">
        <section class="container" style="margin-top: 40px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
                <h2 style="color: #2b1506;">Receitas Cadastradas</h2>
                <a href="AdicionarReceita.jsp" class="btn-primary" style="width: auto; padding: 10px 25px;">+ Nova Receita</a>
            </div>

            <div class="recipe-grid">
                <c:if test="${not empty requestScope.listaBusca}">
                    <c:forEach var="item" items="${requestScope.listaBusca}">
                        <div class="recipe-card">
                            <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/imagem?nome=${item.foto}');"></div>
                            <div class="card-info">
                                <h3>${item.nome}</h3>
                                <p>${item.categoria.categoria} - ${item.tempoPreparo} min</p>
                                <a href="receita?id=${item.id}" class="btn-link">Ver receita</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty listaBusca}">
                    <c:forEach var="item" items="${listaReceitas}">
                        <div class="recipe-card">
                            <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/imagem?nome=${item.value.foto}');"></div>
                            <div class="card-info">
                                <h3>${item.value.nome}</h3>
                                <p>${item.value.categoria.categoria} - ${item.value.tempoPreparo} min</p>
                                <a href="receita?id=${item.value.id}" class="btn-link">Ver receita</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>


                <c:if test="${empty param.receita_busca and empty applicationScope.listaReceitas}">
                    <div class="recipe-card">
                        <div class="card-image" style="background-image: url('${pageContext.request.contextPath}/resources/images/fundoinicial.png');"></div>
                        <div class="card-info">
                            <h3>Nenhuma receita cadastrada</h3>
                            <p>Cadastre uma receita para ela aparecer aqui.</p>
                            <a href="AdicionarReceita.jsp" class="btn-link">Cadastrar receita</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>
</body>
</html>

