<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Configurações Pessoais - La Cuisine Brasil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="bg-login">
    <nav class="navbar">
        <a href="index.jsp"><div class="logo">La Cuisine Brasil</div></a>
        <form action="pesquisa" method="post" class="search-container">
            <input type="text" name="receita_busca" placeholder="Pesquisar receitas..." required>
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

    <div class="container-auth">
        <div class="auth-card" style="width: 600px;"> <h2>Minha Conta</h2>

            <c:if test="${not empty msgErro}">
                <div class="message-error">
                    ${msgErro}
                </div>
            </c:if>

            <div style="display: flex; gap: 30px; text-align: left;">

                <div style="flex: 2;">
                    <form action="logado" method="post">
                        <div class="input-group">
                            <label>Nome</label>
                            <input type="text" name="nome_editavel" value="${usuarioEditavel.getNome()}">
                        </div>
                        <div class="input-group">
                            <label>E-mail</label>
                            <input type="email" name="email_editavel" value="${usuarioEditavel.getEmail()}">
                        </div>
                        <div class="input-group">
                            <label>Nova Senha</label>
                            <input type="password" name="senha_editavel" placeholder="Deixe em branco para não alterar">
                        </div>

                        <div style="display: flex; gap: 10px;">
                            <button type="submit" class="btn-primary">Salvar Alterações</button>
                            <button type="button" class="btn-primary" style="background: #c0392b;" onclick="window.location.href='excluir?idExcluir=${usuarioEditavel.getId()}'">Excluir Conta</button>
                        </div><br>
                        <a href="index.jsp" class="btn-voltar">
                             <span class="icon-seta">←</span>
                             <span>Voltar para a Home</span>
                        </a>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>
