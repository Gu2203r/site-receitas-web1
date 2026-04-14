package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Visitante;
import br.edu.ifsp.utils.GerenciadorArquivo;
import br.edu.ifsp.utils.GerenciadorUsuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "registroUsuario", value = "/cadastrar")
public class CadastroUsuario extends HttpServlet {

    GerenciadorUsuario gerenciadorUsuario = new GerenciadorUsuario();
    String userPath = "usuarios.ser";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("cadastro_nome");
        String senha = request.getParameter("cadastro_senha");
        String email = request.getParameter("cadastro_email");
        String tipoUsuario = request.getParameter("tipo_usuario");

        String msgRegistro = null;
        String url = "/login.jsp";

        Map<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");

        Usuario usuarioCriado;

        // procura se o usuario existe

        if (gerenciadorUsuario.verificarEmail(listaUsuarios, email)) {
            msgRegistro = "Email ja cadastrado";
            url = "/cadastro.jsp";
        }
        // cadastra o usuario caso ele nao exista
        if (msgRegistro == null){

            usuarioCriado = new Visitante(nome, senha, email, tipoUsuario);
            gerenciadorUsuario.cadastrar(listaUsuarios, usuarioCriado);

            getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        }

        // mensagem caso o usuario já exista
        request.setAttribute("msgRegistro", msgRegistro);

        getServletContext().getRequestDispatcher(url).forward(request, response);

    }

}