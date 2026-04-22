package br.edu.ifsp.utils;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class GerenciadorArquivo<T> {

    private static String caminhoPasta = "";

    public void serializar(Map<Integer, T> lista, String path){
        try (FileOutputStream fos = new FileOutputStream(caminhoPasta + path);
             ObjectOutputStream oos = new ObjectOutputStream(fos)){

            // Verifica se a pasta existe, se não, cria
            File diretorio = new File(caminhoPasta);
            if (!diretorio.exists()) {
                diretorio.mkdirs();
            }

            oos.writeObject(lista);

        } catch (IOException e){
            System.out.println("Erro ao serializar: " + e.getMessage());
        }
    }

    public Map<Integer, T> desserializar(String path){
        Map<Integer, T> lista = new HashMap<>();

        try (FileInputStream fis = new FileInputStream(caminhoPasta + path);
             ObjectInputStream ois = new ObjectInputStream(fis)) {

            lista = (HashMap<Integer, T>) ois.readObject();

        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Erro ao desserializar: " + e.getMessage());
        }

        return lista;
    }

    public static void setCaminhoPasta(String caminhoPasta) {
        GerenciadorArquivo.caminhoPasta = caminhoPasta;
    }

    public String getCaminhoPasta() {
        return caminhoPasta;
    }
}
