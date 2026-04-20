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

    <nav class="navbar">
        <a href="index.jsp"><div class="logo">La Cuisine Brasil</div></a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="AdicionarReceita.jsp">Adicionar receitas</a></li>
            <li><a href="MinhasReceitas.jsp">Visualizar receitas</a></li>
        </ul>

        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
        </div>

        <ul class="nav-links">
            <li><a href="SobreNos.jsp">Sobre o sistema</a></li>
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
            <h2>Compartilhar Nova Receita</h2>
            <form action="${pageContext.request.contextPath}/salvarReceita" method="POST" enctype="multipart/form-data">

                <div class="input-group">
                    <label>Título da Receita</label>
                    <input type="text" name="nome" placeholder="Ex: Bolo de chocolate" required>
                </div>

                <div class="row-group">
                    <div class="input-group" style="flex: 1;">
                        <label>Categoria</label>
                        <select class="custom-field" name="categoria" required>
                            <option value="ENTRADA">Entrada</option>
                            <option value="PRATO_PRINCIPAL">Prato Principal</option>
                            <option value="SOBREMESA">Sobremesa</option>
                        </select>
                    </div>
                    <div class="input-group" style="flex: 1;">
                        <label>Tempo de Preparo (min)</label>
                        <input type="number" name="tempo_preparo" placeholder="Ex: 45" min="1" required>
                    </div>
                    <div class="input-group" style="flex: 1;">
                        <label>Rendimento</label>
                        <input type="text" name="rendimento" placeholder="Ex: 8 porcoes" required>
                    </div>
                </div>

                <div class="input-group">
                    <label>Ingredientes</label>
                    <textarea class="custom-field textarea" name="ingredientes" rows="5" placeholder="Liste os ingredientes um por linha..." required></textarea>
                </div>

                <div class="input-group">
                    <label>Modo de Preparo</label>
                    <textarea class="custom-field textarea" name="modo_preparo" rows="5" placeholder="Passo 1, Passo 2..." required></textarea>
                </div>

                <div class="input-group">
                    <label>Foto da Receita</label>
                    <input type="file" name="foto" accept="image/*" class="custom-field" required>
                </div>

                <button type="submit" class="btn-primary">Publicar Receita</button>
            </form>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasil - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>