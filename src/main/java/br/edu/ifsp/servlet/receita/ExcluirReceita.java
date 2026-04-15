package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.exceptions.AcessoNegadoException;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "excluirReceita", value = "/excluirReceita")
public class ExcluirReceita extends HttpServlet {
    private final GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/index.jsp";

        Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");

        try {
            int idReceita = Integer.parseInt(request.getParameter("id"));
            Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

            Receita receitaExcluir = null;
            if (listaReceitas != null) {
                receitaExcluir = listaReceitas.get(idReceita);
            }

            if (receitaExcluir == null) {
                url = "/404.jsp";
            }

            if (receitaExcluir != null && (usuarioLogado == null || receitaExcluir.getAutor() == null || receitaExcluir.getAutor().getId() != usuarioLogado.getId())) {
                throw new AcessoNegadoException("Acesso negado, voce nao pode excluir a receita de outro usuario");
            }

            if (receitaExcluir != null) {
                gerenciadorReceita.excluir(listaReceitas, receitaExcluir);
                getServletContext().setAttribute("listaReceitas", listaReceitas);
            }

        } catch (NumberFormatException e) {
            url = "/404.jsp";
        } catch (AcessoNegadoException e) {
            url = "/index.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}