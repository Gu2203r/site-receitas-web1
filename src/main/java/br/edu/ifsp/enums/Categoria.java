package br.edu.ifsp.enums;

public enum Categoria {
    ENTRADA("Entrada"),
    PRATO_PRINCIPAL("Prato Principal"),
    SOBREMESA("Sobremesa");

    private final String categoria;

    Categoria(String categoria){
        this.categoria = categoria;
    }

    public String getCategoria() {
        return categoria;
    }
}
