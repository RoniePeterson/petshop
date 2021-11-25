# Limpando tabelas. Excluindo registros
delete from `petshop_db`.`ordemservicoitens`;
delete from `petshop_db`.`ordemservicos`;

delete from `petshop_db`.`servicos`;
delete from `petshop_db`.`funcionarios`;
delete from `petshop_db`.`categorias`;

delete from `petshop_db`.`pets`;
delete from `petshop_db`.`tutores`;
delete from `petshop_db`.`racas`;
delete from `petshop_db`.`especies`;

# Inserindo dados na tabela de especies
INSERT INTO `petshop_db`.`especies` (EspecieID, EspecieNome) VALUES 
(1000, 'Caninos'),
(1001, 'Felinos'),
(1002, 'Aves'),
(1003, 'Peixes'),
(1004, 'Répteis'),
(1005, 'Roedores');

# Inserindo dados na tabela de raças
# http://www.guiaderacas.com.br/
# https://www.petvale.com.br/peixes/especies/
# https://www.zooplus.pt/magazine/repteis/especies-repteis
INSERT INTO `petshop_db`.`racas` (RacaID, RacaNome, EspecieID) VALUES 
(100, 'SRD - Sem Raça Definida', 1000),
(101, 'Yorkshire Terrier', 1000),
(102, 'Pastor Alemão', 1000),
(103, 'Pastor Belga', 1000),
(104, 'Bulldog', 1000),
(105, 'Dobermann', 1000),
(106, 'Fila Brasileiro', 1000),
(107, 'Rottweiler', 1000),
(108, 'São Bernardo', 1000),
(109, 'Schnauzer Miniatura', 1000),
(110, 'Chow Chow', 1000),
(111, 'Husky Siberiano', 1000),
(112, 'Lulu da Pomerânia', 1000),
(113, 'Spitz Alemão', 1000),
(114, 'Basset Fulvo', 1000),
(115, 'Beagle', 1000),
(116, 'Dálmata', 1000),
(117, 'Cocker Spaniel Inglês', 1000),
(118, 'Golden Retriever', 1000),
(119, 'Labrador Retriever', 1000),
(120, 'Buldogue Francês', 1000),
(121, 'Maltês', 1000),
(122, 'Pequinês', 1000),
(123, 'Poodle', 1000),
(124, 'Pug', 1000),
(125, 'Shih Tzu', 1000),
(126, 'Chihuahua', 1000),
(127, 'American Pit Bull Terrier', 1000),
(128, 'Bulldog Campeiro', 1000),
(200, 'SRD - Sem Raça Definida', 1001),
(201, 'Siamês', 1001),
(202, 'Sphynx', 1001),
(203, 'Savannah', 1001),
(204, 'Siamês', 1001),
(205, 'Persa', 1001),
(206, 'Oriental', 1001),
(207, 'Munchkin', 1001),
(208, 'European Shorthair', 1001),
(300, 'SRD - Sem Raça Definida', 1003),
(301, 'Colisa', 1003),
(302, 'Arco-Íris Boesemani ', 1003),
(303, 'Aurora', 1003),
(304, 'Tetra neon', 1003),
(305, 'Peixe arco-íris', 1003),
(306, 'Mato grosso', 1003),
(307, 'Amphiprion ocellaris', 1003),
(308, 'Betta splendens', 1003),
(400, 'SRD - Sem Raça Definida', 1004),
(401, 'Tartaruga', 1004),
(402, 'Cágado de carapaça estriada ', 1004),
(403, 'Camaleões', 1004),
(500, 'SRD - Sem Raça Definida', 1005),
(501, 'Coelhos', 1005),
(502, 'Hamster', 1005),
(503, 'Porquinho-da-índia', 1005);

# Inserindo dados na tabela de tutores
INSERT INTO `petshop_db`.`tutores` (TutorID, TutorNome, TutorEmail, 
TutorPassword, TutorTelefone) VALUES 
(1000, 'João Pedro Oliveira', 'jpo@yahoo.com.br', md5(123), '9984671100'),
(1001, 'Maria Silva', 'maria.silva@gmail.com.br', md5(123), '9987542233'),
(1002, 'Fernanda Castro', 'fernanda.castro@yahoo.com.br', md5(123), '999999999'),
(1003, 'Julina Aguiar', 'juliana.aguiar@gmail.com.br', md5(123), '997213344'),
(1004, 'Marta Souza', 'marta.souza@outlook.com.br', md5(123), '998765432'),
(1005, 'Rubens Aguiar', 'rubens.aguiar@outlook.com.br', md5(123), '999885511'),
(1006, 'Jaciara Teles', 'jaciara.teles@gmail.com.br', md5(123), '997742233');

# Inserindo dados na tabela de pets
INSERT INTO `petshop_db`.`pets` (PetID, PetNome, PetSexo, PetPeso, 
PetDataNascimento, PetFoto, TutorID, RacaID) VALUES
(100, 'Bob', 'M', 4.0, '2015-05-12', NULL, 1000, 101),  
(101, 'Chico', 'M', 1.0, '2020-03-18', NULL, 1006, 101),  
(102, 'Amora', 'F', 3.84, '2018-12-12', NULL, 1000, 125),  
(103, 'Rex', 'M', 5.3, '2014-01-03', NULL, 1001, 100),  
(104, 'Adamastor', 'M', 4.2, '2020-08-03', NULL, 1002, 100),  
(105, 'Tigrinho', 'M', 1.3, '2016-02-28', NULL, 1004, 207),  
(106, 'Amarelo', 'M', 2.0, '2018-09-10', NULL, 1004, 207),  
(107, 'Rickson', 'M', 6.2, '2016-11-11', NULL, 1003, 124),  
(108, 'Dorinha', 'M', 3.88, '2017-06-06', NULL, 1003, 125),  
(109, 'Maju', 'F', 6.1, '2019-05-12', NULL, 1005, 100),  
(110, 'Balboa', 'M', 1.35, '2018-06-22', NULL, 1005, 119);  

# Inserindo dados na tabela de funcionarios
INSERT INTO `petshop_db`.`funcionarios` (FuncionarioID, FuncionarioNome, 
FuncionarioEmail, FuncionarioPassword, FuncionarioTelefone,
FuncionarioTipo, FuncionarioStatus) VALUES 
(100, 'Admin', 'adm@petshop.com.br', md5(321), '984670000', 'ADMINISTRADOR', 'ATIVO'),
(101, 'secretaria', 'secretaria@petshop.com.br', md5(123), '984661111', 'FUNCIONARIO', 'ATIVO'),
(102, 'funcionario01', 'funcionario01@petshop.com.br', md5(123), '984660000', 'FUNCIONARIO', 'ATIVO'),
(103, 'Carol Silva', 'carol.silva@petshop.com.br', md5(123), '984662222', 'FUNCIONARIO', 'ATIVO'),
(104, 'Pedro Castro', 'pedor.castro@petshop.com.br', md5(123), '984665533', 'FUNCIONARIO', 'ATIVO');


# Inserindo dados na tabela de categorias
INSERT INTO `petshop_db`.`categorias` (CategoriaID, CategoriaNome, 
CategoriaStatus) VALUES
(1000, 'Outros', 'Ativo'),
(1001, 'Banho e Tosa', 'Ativo'),
(1002, 'Transporte', 'Ativo'),
(1003, 'Consulta', 'Ativo'),
(1004, 'Vacina', 'Ativo');
  

# Inserindo dados na tabela de servicos
INSERT INTO `petshop_db`.`servicos` (ServicoID, ServicoNome, 
ServicoDescricao, ServicoPreco, ServicoStatus, CategoriaID) VALUES 
(1000, 'Banho P', 'Banho em cachorros tamanho pequeno', 30.0, 'ATIVO', 1001),
(1001, 'Banho M', 'Banho em cachorros tamanho médio', 35.0, 'ATIVO', 1001),
(1002, 'Banho G', 'Banho em cachorros tamanho grande', 50.0, 'ATIVO', 1001),
(1003, 'Banho e Tosa P', 'Banho e Tosa em cachorros tamanho pequeno', 40.0, 'ATIVO', 1001),
(1004, 'Banho e Tosa M', 'Banho e Tosa em cachorros tamanho médio', 50.0, 'ATIVO', 1001),
(1005, 'Banho e Tosa G', 'Banho e Tosa em cachorros tamanho grande', 70.0, 'ATIVO', 1001),
(1006, 'Taxi Dog categoria 1', 'Buscar pets em casa até 10 km', 20.0, 'ATIVO', 1002),
(1007, 'Taxi Dog categoria 2', 'Buscar pets em casa até 20 km', 30.0, 'ATIVO', 1002),
(1008, 'Taxi Dog categoria 3', 'Buscar pets em casa até 30 km', 40.0, 'ATIVO', 1002),
(2000, 'Banho felinos', 'Banho em felinos', 30.0, 'ATIVO', 1001),
(2001, 'Banho e tosa em felinos ', 'Banho e tosa em felinos', 50.0, 'ATIVO', 1001);

# Inserindo dados na tabela de ordemservicos
INSERT INTO `petshop_db`.`ordemservicos` (OrdemServicoID, 
OrdemServicoData, OrdemServicoNumero, OrdemServicoStatus, 
OrdemServicoObservacao, PetID, FuncionarioID) VALUES
(1, '2021-01-20', '2021010001', 'CONCLUIDA', NULL, 100, 102),
(2, '2021-01-20', '2021010002', 'CONCLUIDA', 'Transporte de dois cachorros.', 110, 102),
(3, '2021-01-21', '2021010003', 'CONCLUIDA', NULL, 109, 102),
(4, '2021-01-21', '2021010004', 'CANCELADA', 'Tutor teve um imprevisto.', 100, 102),
(5, '2021-01-21', '2021010005', 'CONCLUIDA', NULL, 101, 102);

# Inserindo dados na tabela de OrdemServicoItens
INSERT INTO `petshop_db`.`ordemservicoitens` (
OrdemServicoItemQuantidade, OrdemServicoItemValor, 
OrdemServicoID, ServicoID) VALUES
(1, 30, 1, 1000),
(1, 40, 2, 1001),
(1, 20, 2, 1006),
(1, 40, 3, 1001),
(1, 30, 5, 1000);
