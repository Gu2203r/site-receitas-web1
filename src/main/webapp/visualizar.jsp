<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Minhas Receitas - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="page-shell" style="background: #f4f4f4;">
    <nav class="navbar">
    <jsp:useBean id="gerenciadorReceita" class="br.edu.ifsp.utils.GerenciadorReceita" scope="page" />
    <c:if test="${sessionScope.usuarioLogado != null}">
        <c:set var="listaReceitasUsuario" value="${gerenciadorReceita.buscarPorUsuario(applicationScope.listaReceitas, sessionScope.usuarioLogado.id)}"/>
    </c:if>

        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="adicionar.jsp">Adicionar receitas</a></li>
            <li><a href="receitasCadastradas.jsp">Visualizar receitas</a></li>
        </ul>

        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <span class="search-icon">🔍</span>
        </div>

        <ul class="nav-links">
            <li><a href="sobre.jsp">Sobre o sistema</a></li>
            <c:if test="${usuarioLogado != null}">
                <li><a href="adicionar.jsp">Cadastrar Receita</a></li>
                <li><a href="visualizar.jsp">Minhas Receitas</a></li>
                <li><a href="logado?id_usuario=${usuarioLogado.getId()}" class="btn-nav-login">${usuarioLogado.getNome()}</a></li>
                <li><a href="logout" class="btn-nav-logout">Sair</a></li>
            </c:if>
            <c:if test="${usuarioLogado == null}">
                <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
            </c:if>
        </ul>
    </nav>

    <main class="page-content">
        <div class="container" style="margin-top: 40px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
                <h2 style="color: #2b1506;">Minhas Receitas</h2>
                <a href="adicionar.jsp" class="btn-primary" style="width: auto; padding: 10px 25px;">+ Nova Receita</a>
            </div>

            <div class="table-container">
                <table class="recipe-table">
                    <thead>
                        <tr>
                            <th style="text-align: left;">Nome da Receita</th>
                            <th style="text-align: left;">Categoria</th>
                            <th style="text-align: left;">Tempo</th>
                            <th style="text-align: center;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="receita" items="${listaReceitasUsuario}">
                            <tr>
                                <td style="text-align: left;">${receita.nome}</td>
                                <td style="text-align: left;">${receita.categoria.categoria}</td>
                                <td style="text-align: left;">${receita.tempoPreparo} min</td>
                                <td style="text-align: center;">
                                    <div class="actions-cell">
                                        <a href="receita?id=${receita.id}" class="btn-link">Ver</a>
                                        <a href="editada?id=${receita.id}" class="btn-edit">Editar</a>
                                        <a href="excluirReceita?id=${receita.id}" class="btn-delete">Excluir</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty listaReceitasUsuario}">
                            <tr>
                                <td colspan="4" style="text-align: center;">Voce ainda nao cadastrou receitas.</td>
                            </tr>
                        </c:if>
                    </tbody>

                </table>
            </div>
        </div>
    </main>

    <footer class="main-footer">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>