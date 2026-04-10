package br.edu.ifsp.servlet.usuario;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Administrador;
import br.edu.ifsp.entities.Visitante;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "registroUsuario", value = "/cadastrar")
public class CadastroUsuario extends HttpServlet {
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
        for (Usuario user : listaUsuarios.values()){
            if (email.equals(user.getEmail())) {
                msgRegistro = "Email ja cadastrado";
                url = "/cadastro.jsp";
                break;
            }
        }

        // verifica o tipo do usuario (administrador ou visitante)
        if (tipoUsuario == null || tipoUsuario.equals("COMUM")){
            tipoUsuario = "COMUN";
            usuarioCriado = new Administrador(nome, senha, email, tipoUsuario);
        }else {

            usuarioCriado = new Visitante(nome, senha, email, tipoUsuario);
        }

        listaUsuarios.put(usuarioCriado.getId(), usuarioCriado);

        getServletContext().setAttribute("listaUsuarios", listaUsuarios);

        // mensagem caso o usuario já exista
        request.setAttribute("msgRegistro", msgRegistro);

        getServletContext().getRequestDispatcher(url).forward(request, response);

    }

    @Override
    public void init() throws ServletException {
        super.init();

        Object o = getServletContext().getAttribute("listaUsuarios");

        if ( !(o instanceof ArrayList)) {
            Map<Integer, Usuario> listaUsuarios = new HashMap<>();
            getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        }
    }
}