package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PesquisarReceita", value = "/pesquisa")
public class PesquisarReceita extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receitaBusca = request.getParameter("receita_busca");
        Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

        if (receitaBusca != null && !receitaBusca.trim().isEmpty()) {
            GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();
            List<Receita> receitasFiltradas = gerenciadorReceita.buscarPeloNome(listaReceitas, receitaBusca);
            request.setAttribute("listaBusca", receitasFiltradas);
            request.setAttribute("termoBusca", receitaBusca.trim());
        }

        request.getRequestDispatcher("/receitasCadastradas.jsp").forward(request, response);
    }
}