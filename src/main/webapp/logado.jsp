<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Configurações Pessoais - La Cuisine Brasil</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body class="bg-login"> <nav class="navbar">
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="#">Adicionar receitas</a></li>
            <li><a href="perfil.jsp">Configurações pessoais</a></li>
            <li><a href="#">Visualizar receitas</a></li>
        </ul>
        <div class="search-container">
            <input type="text" placeholder="Pesquisar">
            <span class="search-icon">🔍</span>
        </div>
        <ul class="nav-links">
            <li><a href="#">Sobre o sistema</a></li>
        </ul>
    </nav>

    <div class="container-auth">
        <div class="auth-card" style="width: 600px;"> <h2>Minha Conta</h2>
            <div style="display: flex; gap: 30px; text-align: left;">

                <div style="flex: 1; text-align: center;">
                    <div style="width: 120px; height: 120px; background: #E67E22; border-radius: 50%; margin: 0 auto 15px; display: flex; align-items: center; justify-content: center; font-size: 3rem;">
                        👤
                    </div>
                    <button class="btn-link" style="color: #E67E22; cursor: pointer;">Alterar Foto</button>
                </div>

                <div style="flex: 2;">
                    <div class="input-group">
                        <label>Nome</label>
                        <input type="text" value="Laura Silva">
                    </div>
                    <div class="input-group">
                        <label>E-mail</label>
                        <input type="email" value="laura@gmail.com">
                    </div>
                    <div class="input-group">
                        <label>Nova Senha</label>
                        <input type="password" placeholder="Deixe em branco para não alterar">
                    </div>

                    <div style="display: flex; gap: 10px;">
                        <button class="btn-primary">Salvar Alterações</button>
                        <button class="btn-primary" style="background: #c0392b;">Excluir Conta</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer style="background: #2b1506; color: white; text-align: center; padding: 40px 0; margin-top: 50px;">
        <p>&copy; 2026 La Cuisine Brasi - Todos os direitos reservados.</p>
        <p style="font-size: 12px; color: #888; margin-top: 10px;">Feito por Gustavo e Laura</p>
    </footer>

</body>
</html>
