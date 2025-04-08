package src.main.java.model.classBase;

public class Prevision {
    public Prevision(String libele, int montant) {
        this.libele = libele;
        this.montant = montant;
    }

    int depense;

    public int getReste() {
        return this.getMontant() - this.getDepense();
    }

    public int getDepense() {
        return depense;
    }

    public void setDepense(int depense) {
        this.depense = depense;
    }

    String libele;
    int id;
    int montant;

    public int getMontant() {
        return montant;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }

    public String getLibele() {
        return libele;
    }

    public void setLibele(String libele) {
        this.libele = libele;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
