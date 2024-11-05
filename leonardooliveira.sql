CREATE DATABASE quartos_reservas;

\c quartos_reserva;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
email VARCHAR(180) UNIQUE NOT NULL
);

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
numero_quarto INT,
suite_presencial BOOLEAN,
valor INT
);

CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
data_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
id_quarto INT NOT NULL,
id_hospede INT NOT NULL,
horario_entrada DATE NOT NULL,
horario_saida DATE NOT NULL,
servico BOOLEAN,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, email)
VALUES
('Jose', 'jose@gmail.com'),
('Leonardo', 'leonardo@gmail.com'),
('Carlos', 'carlos@gmail.com'),
('Joao', 'joao@gmail.com'),
('Viviane', 'viviane@gmail.com'),
('Sophia', 'sophia@gmail.com');

INSERT INTO quartos (numero_quarto, suite_presencial, valor)
VALUES
('11', TRUE, '450'),
('12', FALSE, '120'),
('21', FALSE, '120'),
('22', TRUE, '450'),
('29', FALSE, '120'),
('27', TRUE, '450');

INSERT INTO reservas (id_hospede, id_quarto, horario_entrada,
horario_saida, servico)
VALUES
('6', '4', '2024-11-05', '2024-11-15', FALSE),
('2', '1', '2024-11-07', '2024-11-19', FALSE),
('3', '3', '2024-11-11', '2024-11-25', TRUE),
('4', '6', '2024-11-01', '2024-11-15', FALSE),
('5', '5', '2025-01-11', '2025-01-18', TRUE),
('1', '2', '2024-12-25', '2024-12-31', FALSE);

SELECT 
    r.id_reserva,
    r.horario_entrada,
    r.horario_saida,
    r.servico,
    q.numero_quarto,
    h.nome AS hospedes,
    h.email
FROM
    reservas r
JOIN
    hospedes h ON r.id_hospede = h.id_hospede
JOIN
    quartos q ON r.id_quarto = q.id_quarto;
  
SELECT 
    r.id_reserva,
    r.horario_entrada,
    r.horario_saida,
    r.servico,
    q.numero_quarto,
    h.nome AS hospedes,
    h.email
FROM
    reservas r
RIGHT JOIN
    hospedes h ON r.id_hospede = h.id_hospede
LEFT JOIN
    quartos q ON r.id_quarto = q.id_quarto;

SELECT 
    r.id_reserva,
    r.horario_entrada,
    r.horario_saida,
    r.servico,
    q.numero_quarto,
    h.nome AS hospedes,
    h.email
FROM
    reservas r
RIGHT JOIN
    hospedes h ON r.id_hospede = h.id_hospede
LEFT JOIN
    quartos q ON r.id_quarto = q.id_quarto;
WHERE
    r.id_reserva IS NULL;