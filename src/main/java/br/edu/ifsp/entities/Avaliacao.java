package br.edu.ifsp.entities;

public class Avaliacao {
    private double nota;
    private String comentario;

    public Avaliacao() {
    }

    public Avaliacao(double nota, String comentario) {
        this.nota = nota;
        this.comentario = comentario;
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
