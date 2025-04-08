

create table
    prevision (
        id INT AUTO_INCREMENT PRIMARY KEY,
        libele VARCHAR(50),
        montant INT
    );

create table depense (
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_prevision INT,
        realisation INT
    );