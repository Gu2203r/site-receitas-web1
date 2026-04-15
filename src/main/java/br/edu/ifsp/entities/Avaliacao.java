package br.edu.ifsp.entities;

import br.edu.ifsp.Usuario;

import java.io.Serializable;

public class Avaliacao implements Serializable {
    private static final long serialVersionUID = 1L;

    private Usuario avaliador;
    private double nota;
    private String comentario;

    public Avaliacao() {
    }

    public Avaliacao(double nota, String comentario) {
        this.nota = nota;
        this.comentario = comentario;
    }

    public Avaliacao(Usuario avaliador, double nota, String comentario) {
        this.avaliador = avaliador;
        this.nota = nota;
        this.comentario = comentario;
    }

    public Usuario getAvaliador() {
        return avaliador;
    }

    public void setAvaliador(Usuario avaliador) {
        this.avaliador = avaliador;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
