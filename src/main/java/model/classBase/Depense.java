package src.main.java.model.classBase;

public class Depense {
    public Depense(int id, int montant) {
        this.id = id;
        this.montant = montant;
    }
    int id;
    int montant;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getMontant() {
        return montant;
    }
    public void setMontant(int montant) {
        this.montant = montant;
    }

}