<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Acesso Negado - La Cuisine Brasil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="bg-login">
<main class="container-auth">
    <section class="auth-card" style="max-width: 420px;">
        <h2>Acesso Negado</h2>
        <p style="margin-bottom: 10px; color: #f5d7bf;">
            Voce nao tem permissao para realizar esta acao.
        </p>
        <p style="font-size: 14px; color: #d9c6b5;">
            Se precisar, faca login com outra conta ou volte para a pagina inicial.
        </p>

        <a href="${pageContext.request.contextPath}/index.jsp"
           class="btn-voltar"
           style="justify-content: center; width: 100%; margin-top: 22px;">
            <span class="icon-seta">&larr;</span>
            Voltar para o inicio
        </a>
    </section>
</main>
</body>
</html>