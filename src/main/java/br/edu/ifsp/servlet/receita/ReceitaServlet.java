package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "receitaServlet", value = "/receita")
public class ReceitaServlet extends HttpServlet {

    private GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Receita receita;
        String url = "/receita.jsp";

        try {
            int idReceita = Integer.parseInt(request.getParameter("id"));
            Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

            receita = listaReceitas.get(idReceita);

            gerenciadorReceita.registrarVisualizacao(listaReceitas, idReceita);

            if (receita == null){
                url = "/404.jsp";
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("receita", receita);
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }
}