package br.edu.ifsp.servlet.receita;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.enums.Categoria;
import br.edu.ifsp.exceptions.AcessoNegadoException;
import br.edu.ifsp.utils.GerenciadorArquivo;
import br.edu.ifsp.utils.GerenciadorReceita;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "RegistroReceita", value = "/salvarReceita")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,    // Tamanho máximo do arquivo: 5MB
        maxRequestSize = 1024 * 1024 * 10 // Tamanho máximo da requisição: 10MB
)
public class CadastroReceita extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        GerenciadorArquivo<Object> gerenciadorArquivo = new GerenciadorArquivo<>();
        GerenciadorReceita gerenciadorReceita = new GerenciadorReceita();

        String nome = request.getParameter("nome");
        Usuario autor = (Usuario) request.getSession().getAttribute("usuarioLogado");
        String categoria = request.getParameter("categoria");
        String tempoPreparo = request.getParameter("tempo_preparo");
        String rendimento = request.getParameter("rendimento");
        String ingredientes = request.getParameter("ingredientes");
        String modoPreparo = request.getParameter("modo_preparo");

        try {
            if (autor == null){
                throw new AcessoNegadoException("Usuario precisa estar logado para cadastrar a tarefa");
            }
        }catch (AcessoNegadoException e){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        Part fotoPart = request.getPart("foto");
        String nomeArquivoSalvo = null;

        if (fotoPart != null && fotoPart.getSize() > 0) {
            // descobre qual é o tipo do arquivo (.jpg, .png etc)
            String nomeFotoOriginal = fotoPart.getSubmittedFileName();
            int indicePonto = nomeFotoOriginal.lastIndexOf(".");

            if (indicePonto > -1) {
                String extensao = nomeFotoOriginal.substring(indicePonto);
                // gera um id unico para o nome do arquivo nao ficar duplicado
                nomeArquivoSalvo = UUID.randomUUID() + extensao;

                //  pega a pasta de imagens
                String pastaImagens = gerenciadorArquivo.getCaminhoPasta() + "imagens" + File.separator;
                File diretorio = new File(pastaImagens);
                // cria a pasta caso nao exista
                if (!diretorio.exists()) diretorio.mkdirs();

                // salva o arquivo
                fotoPart.write(pastaImagens + nomeArquivoSalvo);
            }
        }

        // pega a categoria pelo enum
        Categoria categoriaEnum = Categoria.valueOf(categoria.toUpperCase());

        // cria a receita
        Receita receita = new Receita(nome, autor, tempoPreparo, ingredientes, modoPreparo, categoriaEnum, rendimento, nomeArquivoSalvo);

        Map<Integer, Receita> listaReceitas = (Map<Integer, Receita>) getServletContext().getAttribute("listaReceitas");

        gerenciadorReceita.cadastrar(listaReceitas, receita);
        getServletContext().setAttribute("listaReceitas", listaReceitas);

        request.setAttribute("receita", receita);
        request.getRequestDispatcher("/receita.jsp").forward(request, response);
    }

}