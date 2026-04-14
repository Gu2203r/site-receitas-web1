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


@WebServlet(name = "EditarUsuario", value = "/logado")
public class EditarUsuario extends HttpServlet {

    GerenciadorUsuario gerenciadorUsuario = new GerenciadorUsuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuarioEditavel;
        String url = "/logado.jsp";

        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));

            HashMap<Integer, Usuario> listaUsuario = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");

            // pega o usuario pelo ‘id’
            usuarioEditavel = listaUsuario.get(idUsuario);

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }

        // verifica se o usuario existe ou se esta tentando editar informações de outro
        if (usuarioEditavel == null || usuarioEditavel.getId() != usuarioLogado.getId()){
            url = "/index.jsp";
        }

        getServletContext().setAttribute("usuarioEditavel", usuarioEditavel);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuarioEditavel = (Usuario) getServletContext().getAttribute("usuarioEditavel");
        HashMap<Integer, Usuario> listaUsuarios = (HashMap<Integer, Usuario>) getServletContext().getAttribute("listaUsuarios");
        GerenciadorArquivo gerenciador = new GerenciadorArquivo();

        String url = "/index.jsp";
        String msgErro = null;

        String novoNome = request.getParameter("nome_editavel");
        String novoEmail = request.getParameter("email_editavel");
        String novaSenha = request.getParameter("senha_editavel");

        boolean existe = false;

        // procura se o email sendo trocado já existe
        if (!novoEmail.equals(usuarioEditavel.getEmail())){
            if (gerenciadorUsuario.verificarEmail(listaUsuarios, novoEmail)) {
                existe = true;
                url = "/logado.jsp";
                msgErro = "Já existe um usuário com esse email";
                System.out.println("Já existe um usuário com esse email");
            }
        }

        // verifica se existe e muda as informações
        if (!existe){
           gerenciadorUsuario.editar(listaUsuarios, usuarioEditavel.getId(), novoNome, novoEmail, novaSenha);
        }
        request.setAttribute("msgErro",msgErro);
        getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}