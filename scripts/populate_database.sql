INSERT INTO cliente (cpfcli,nome,endereco,telefone,email,senha) VALUES
('94719006873','João Alves','Rua qualquer, n 103, chapecó, sc','988015676','joao@gmail.com','joao123'),
('10684620798','José Alves','Rua comum, n 765, chapecó, sc','988016578','jose@gmail.com','jose123'),
('85068625441','Mateus Silva','Rua qualquer, n 345, chapecó, sc','988011287','mateus@gmail.com','mateus123'),
('07901231587','Fábio Santos','Rua qualquer, n 986, chapecó, sc','988010990','fabio@gmail.com','fabio123'),
('96500855671','Pedro Oliveira','Rua comum, n 432, chapecó, sc','988014565','pedro@gmail.com','pedro123'),
('11326787992','Lucas Almeida','Avenida poucoimporta, n 15, chapecó, sc','988018655','lucas@gmail.com','lucas123'),
('67402135789','Daniel Souza','Rua imaginária, n 987, chapecó, sc','988011010','daniel@gmail.com','daniel123'),
('54870127805','Arthur Ferreira','Rua qualquer, n 123, chapecó, sc','988015555','arthur@gmail.com','arthur123'),
('06494321867','Victor Pereira','Rua imaginária, n 876, chapecó, sc','988012213','victor@gmail.com','victor123'),
('32209637682','Gabriel Lima','Avenida poucoimporta, n 56, chapecó, sc','988011750','gabriel@gmail.com','gabriel123'),
('42584197352','Marcelo Ribeiro','Avenida poucoimporta, n 466, chapecó, sc','988019931','marcelo@gmail.com','marcelo123'),
('22530471852','Eduardo Martins','Rua imaginária, n 109, chapecó, sc','988010134','bernardo@gmail.com','bernardo123');

INSERT INTO profissional (nome,taxa,salario) VALUES
('Flávio Silva','0.07','3500,00'),
('Paulo Oliveira','0.03','2500,00'),
('Larissa Almeida','0.05','2000,00'),
('Juliana Ferreira','0.1','1750,00');

INSERT INTO servico (nome,preco) VALUES
('Corte Cabelo','50,00'),
('Corte Barba','30,00'),
('Tintura Cabelo','70,00'),
('Manicure/Podologia','40,00'),
('Depilação','65,00'),
('Massagem','80,00'),
('Limpeza Facial','90,00');

-- O campo 'detalhes' da tabela 'horario' serve mais para os profissionais do
-- estabelecimento registrarem informações sobre o serviço prestado caso
-- precisem lembrar para repetir o serviço em um novo horário. Isso poderá ser
-- feito através de um UPDATE na tupla correspondente. No caso desses inserts abaixo,
-- as informações não serão necessárias.
INSERT INTO horario (cpfcli,pfid,svid,data_hora) VALUES
('94719006873','1','1','2022-09-01 08:00'),
('94719006873','2','1','2022-09-01 08:00'),
('94719006873','3','6','2022-09-08 14:00'),
('10684620798','1','2','2022-09-15 16:00'),
('10684620798','1','2','2022-10-15 10:30'),
('85068625441','4','3','2022-08-31 17:00'),
('07901231587','1','1','2022-09-03 09:30'),
('96500855671','1','3','2022-09-11 15:30'),
('11326787992','2','1','2022-09-12 11:00'),
('42584197352','2','3','2022-09-24 09:00'),
('42584197352','1','2','2022-09-29 13:30'),
('67402135789','3','4','2022-09-18 17:30'),
('67402135789','3','5','2022-09-17 08:30'),
('67402135789','1','2','2022-09-15 10:00'),
('54870127805','3','7','2022-09-05 14:30'),
('06494321867','4','6','2022-09-30 15:00'),
('06494321867','4','4','2022-09-01 15:30'),
('32209637682','2','1','2022-09-07 16:30'),
('22530471852','4','5','2022-09-19 14:00'),
('22530471852','2','2','2022-09-14 09:00');

-- Lançamentos no estoque serão feitos por intermédio de UPDATES, ao cadastrar
-- o produto o estoque iniciará zerado.
INSERT INTO produto (nome,peso,preco,custo,estoque,prct_imposto,cod_ncm) VALUES
('Pomada modeladora 1','300','120,00','85,00','0','0.10','86490132'),
('Pomada modeladora 2','250','105,00','70,00','0','0.10','86490132'),
('Spray Fixador 1','800','70,00','45,00','0','0.10','86310543'),
('Spray Fixador 2','1000','75,00','45,00','0','0.10','86310543'),
('Shampoo 1','650','45,00','30,00','0','0.10','81013222'),
('Shampoo 2','1000','60,00','40,00','0','0.10','81013222'),
('Condicionador 1','500','50,00','35,00','0','0.10','81014970'),
('Tintura Preta','1000','40,00','25,00','0','0.10','75402030'),
('Cera p/ depilar','2000','45,00','25,00','0','0.10','60329015');

INSERT INTO nf_venda (data_hora) VALUES
('2022-08-31 11:43'),
('2022-09-10 14:32'),
('2022-09-17 17:56'),
('2022-10-21 08:18');

INSERT INTO prod_venda (nfvid,pdid,qtd) VALUES
('1','1','1'),
('1','2','1'),
('1','5','2'),
('2','6','1'),
('3','9','1'),
('4','7','1'),
('4','5','1');

-- O estoque do produto correspondente seria subtraído pela aplicação, por meio de UPDATE.
INSERT INTO despesa_prod (pdid,data_hora) VALUES
('1','2022-08-10 10:55'),
('3','2022-08-15 14:35'),
('5','2022-08-21 08:12'),
('8','2022-08-25 11:34'),
('9','2022-08-07 17:41');


-- Os códigos dos tipos determinam a que grupo essa despesa pertence.
-- Esses códigos seriam controlados pela aplicação. Por exemplo,
-- os códigos abaixo representam: 1 - impostos, 2 - Despesas de operação,
-- 3 - Despesas gerais
INSERT INTO despesa_geral (descr,valor,tipo,data_hora) VALUES
('Guia de imposto estadual','1500,00','1','2022-09-14 14:56'),
('Guia de imposto federal','1200,00','1','2022-09-17 11:40'),
('Máquina de cortar cabelo','200,00','2','2022-09-05 10:21'),
('Formatação Computador','65,00','3','2022-09-30 09:30'),
('Conta de energia','500,00','2','2022-09-21 15:10'),
('Publicidade','300,00','3','2022-09-12 19:15');