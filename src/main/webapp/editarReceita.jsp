<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Receita - ReceitaMaster</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="bg-login">

<c:set var="receitaEdicao" value="${requestScope.receitaEditavel}" />
<c:if test="${empty receitaEdicao}">
    <c:set var="receitaEdicao" value="${applicationScope.receitaEditavel}" />
</c:if>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="adicionar.jsp">Adicionar receitas</a></li>
        <li><a href="perfil.jsp">Configurações pessoais</a></li>
        <li><a href="visualizar.jsp">Visualizar receitas</a></li>
    </ul>

    <div class="search-container">
        <input type="text" placeholder="Pesquisar">
        <span class="search-icon">🔍</span>
    </div>

    <ul class="nav-links">
        <li><a href="#">Sobre o sistema</a></li>
        <c:if test="${usuarioLogado != null}">
            <li><a href="logado?id_usuario=${usuarioLogado.getId()}" class="btn-nav-login">${usuarioLogado.getNome()}</a></li>
            <li><a href="logout" class="btn-nav-logout">Sair</a></li>
        </c:if>
        <c:if test="${usuarioLogado == null}">
            <li><a href="login.jsp" class="btn-nav-login">Entrar</a></li>
        </c:if>
    </ul>
</nav>

<div class="container-auth">
    <div class="auth-card" style="width: 700px; margin-top: 50px;">
        <h2>Editar Receita</h2>
        <form action="${pageContext.request.contextPath}/editada" method="POST" enctype="multipart/form-data">

            <div class="input-group">
                <label>Título da Receita</label>
                <input type="text" name="nome" placeholder="Ex: Bolo de chocolate" value="${receitaEdicao.nome}" required>
            </div>

            <div class="row-group">
                <div class="input-group" style="flex: 1;">
                    <label>Categoria</label>
                    <select class="custom-field" name="categoria" required>
                        <option value="ENTRADA" ${receitaEdicao.categoria == 'ENTRADA' ? 'selected' : ''}>Entrada</option>
                        <option value="PRATO_PRINCIPAL" ${receitaEdicao.categoria == 'PRATO_PRINCIPAL' ? 'selected' : ''}>Prato Principal</option>
                        <option value="SOBREMESA" ${receitaEdicao.categoria == 'SOBREMESA' ? 'selected' : ''}>Sobremesa</option>
                    </select>
                </div>
                <div class="input-group" style="flex: 1;">
                    <label>Tempo de Preparo (min)</label>
                    <input type="number" name="tempo_preparo" placeholder="Ex: 45" min="1" value="${receitaEdicao.tempoPreparo}" required>
                </div>
                <div class="input-group" style="flex: 1;">
                    <label>Rendimento</label>
                    <input type="text" name="rendimento" placeholder="Ex: 8 porcoes" value="${receitaEdicao.rendimento}" required>
                </div>
            </div>

            <div class="input-group">
                <label>Ingredientes</label>
                <textarea class="custom-field textarea" name="ingredientes" rows="5" placeholder="Liste os ingredientes um por linha..." required>${receitaEdicao.ingredientes}</textarea>
            </div>

            <div class="input-group">
                <label>Modo de Preparo</label>
                <textarea class="custom-field textarea" name="modo_preparo" rows="5" placeholder="Passo 1, Passo 2..." required>${receitaEdicao.modoPreparo}</textarea>
            </div>

            <div class="input-group">
                <label>Foto da Receita (opcional para atualizar)</label>
                <c:if test="${not empty receitaEdicao.foto}">
                    <p style="margin-bottom: 10px; font-size: 12px; color: #bbb;">Foto atual: ${receitaEdicao.foto}</p>
                </c:if>
                <input type="file" name="foto" accept="image/*" class="custom-field">
            </div>

            <button type="submit" class="btn-primary">Salvar Alteracoes</button>
        </form>
    </div>
</div>

<footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
    <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
    <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
</footer>

</body>
</html>