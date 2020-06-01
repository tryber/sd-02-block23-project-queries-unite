/* Desafio 8 - VIEW revenue_report
 Crie uma nova VIEW chamada revenue_report, que deve exibir um relatório de lucros com as seguintes informações:
 
 lowest_revenue: Menor lucro, individual, obtido com um pacote de viagens;
 
 biggest_revenue: Lucro máximo, individual, obtido com um pacote de viagens;
 
 average_revenue: Lucro médio obtido com todos os pacotes de viagens;
 
 total_revenue: Lucro total obtido com todos os pacotes de viagens.
 
 Dica: Recomenda-se fazer uso de subquery para resolver este desafio. */

CREATE VIEW revenue_report AS
SELECT
  MIN(revenue_table) AS lowest_revenue,
  MAX(revenue_table) AS biggest_revenue,
  AVG(revenue_table) AS average_revenue,
  SUM(revenue_table) AS total_revenue
FROM
  (
    SELECT
      COUNT(pur.travel_package) * tp.total_coast AS revenue_table
    FROM
      queries_unite.travel_packages AS tp
      INNER JOIN queries_unite.purchase AS pur ON tp.id = pur.travel_package
    GROUP BY
      tp.id
  ) AS from_table;
