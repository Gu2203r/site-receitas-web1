package br.edu.ifsp.servlet.inicializador;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.entities.Receita;
import br.edu.ifsp.utils.GerenciadorArquivo;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.util.Map;

@WebListener
public class Inicializador implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Carregando dados");

        String caminhoProjeto = sce.getServletContext().getRealPath("/");
        int posicao = caminhoProjeto.indexOf("src");

        String caminhoReal = caminhoProjeto.substring(0, posicao);
        GerenciadorArquivo.setCaminhoPasta(caminhoReal + "data" + File.separator);
        System.out.println();

        // listas e caminhos onde as informações estão/serão armazenadas
        Map<Integer, Usuario> listaUsuarios;
        String caminhoUsuarios = "usuarios.ser";
        Map<Integer, Receita> listaReceitas;
        String caminhoReceitas = "receitas.ser";

        GerenciadorArquivo gerenciador = new GerenciadorArquivo();

        // tenta pegar as informacoes do arquivo caso exista
        listaUsuarios = gerenciador.desserializar(caminhoUsuarios);

        // decobre onde parou a contagem de ids dos usuarios
        int maiorIdEncontrado = 0;
        for (Usuario u : listaUsuarios.values()) {
            if (u.getId() > maiorIdEncontrado) {
                maiorIdEncontrado = u.getId();
            }
        }
        Usuario.setIdAtual(maiorIdEncontrado);

        listaReceitas = gerenciador.desserializar(caminhoReceitas);

        // decobre onde parou a contagem de ids das receitas
        maiorIdEncontrado = 0;
        for (Receita r : listaReceitas.values()) {
            if (r.getId() > maiorIdEncontrado) {
                maiorIdEncontrado = r.getId();
            }
        }
        Receita.setIdAtual(maiorIdEncontrado);

        sce.getServletContext().setAttribute("listaUsuarios", listaUsuarios);
        sce.getServletContext().setAttribute("listaReceitas", listaReceitas);
    }

}