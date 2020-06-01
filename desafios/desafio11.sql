/* Desafio 11 - TRIGGER increment_travel_package_purchases Você deve criar um TRIGGER chamado
increment_travel_package_purchases, que será disparado a cada nova compra de um pacote de viagens.
Quando disparado,
esse TRIGGER deve incrementar em um a quantidade de compras do pacote definida na coluna purchase_count. */

USE queries_unite;

DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages SET purchase_count = purchase_count + 1
WHERE id = NEW.travel_package;
END $$

DELIMITER ;

SELECT id, purchase_count FROM queries_unite.travel_packages;
