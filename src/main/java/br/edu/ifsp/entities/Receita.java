package br.edu.ifsp.entities;

import br.edu.ifsp.Usuario;
import br.edu.ifsp.enums.Categoria;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Receita implements Serializable {

    private static int idAtual = 0;

    private int id;
    private String nome;
    private Usuario autor;
    private String tempoPreparo;
    private String ingredientes;
    private String modoPreparo;
    private Categoria categoria;
    private String rendimento;
    private String foto;
    private List<Avaliacao> avaliacoes;
    private int visualizacoes;

    public Receita(String nome, Usuario autor, String tempoPreparo, String ingredientes, String modoPreparo, Categoria categoria, String rendimento, String foto){
        this.id = ++idAtual;

        this.nome = nome;
        this.autor = autor;
        this.tempoPreparo = tempoPreparo;
        this.ingredientes = ingredientes;
        this.modoPreparo = modoPreparo;
        this.categoria = categoria;
        this.rendimento = rendimento;
        this.foto = foto;
        this.avaliacoes = new ArrayList<>();
        this.visualizacoes = 0;
    }

    public static void setIdAtual(int idAtual) {
        Receita.idAtual = idAtual;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public Usuario getAutor() {
        return autor;
    }

    public String getTempoPreparo() {
        return tempoPreparo;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public String getModoPreparo() {
        return modoPreparo;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public String getRendimento() {
        return rendimento;
    }

    public String getFoto() {
        return foto;
    }

    public List<Avaliacao> getAvaliacoes() {
        return avaliacoes;
    }

    public int getVisualizacoes() {
        return visualizacoes;
    }
}
