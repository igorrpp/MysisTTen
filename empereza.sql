-- Em modo de desenvolvimento
DROP DATABASE IF EXISTS intranet;
CREATE DATABASE intranet CHARACTER SET utf8 COLLATE utf8_general_ci;
USE intranet;

CREATE TABLE authors (
    aut_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aut_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    aut_avatar VARCHAR(255) NOT NULL,
    aut_name VARCHAR(127) NOT NULL,
    aut_link VARCHAR(255) NOT NULL,
    status ENUM ('ativo', 'inativo') DEFAULT 'ativo'
);

CREATE TABLE content (
   /**** ALTER TABLE content ADD cont_imgBanner VARCHAR(255) NULL;****/
    cont_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cont_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cont_image VARCHAR(255) NOT NULL,
    cont_title VARCHAR(127) NOT NULL,
    cont_preview VARCHAR(255) NOT NULL,
    cont_text LONGTEXT NOT NULL,
    cont_author INT NOT NULL,
    cont_status ENUM ('ativo', 'inativo') DEFAULT 'ativo',
    FOREIGN KEY (cont_author) REFERENCES authors (aut_id)
);

CREATE TABLE contacts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    status ENUM ('não lida','lida','respondida','apagada') DEFAULT 'Não lida'
);

CREATE TABLE config (
    cfg_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    variable VARCHAR(63) NOT NULL,
    value TEXT NOT NULL
);

CREATE TABLE about (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    slug VARCHAR(63) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image VARCHAR(255) NOT NULL,
    title VARCHAR(127) NOT NULL,
    preview VARCHAR(255) NOT NULL,
    text LONGTEXT NOT NULL,
    status ENUM ('ativo', 'inativo') DEFAULT 'ativo'
);

-- Insere dados nas tabelas

INSERT INTO config (variable, value) VALUES 
('siteName', 'Empereza'),
('siteSlogan', 'Construindo para você'),
('siteLogo', '/img/logo03.png'),
('pageTitle', ''),
('pageCSS', ''),
('pageJS', ''),
('facebook', 'https://facebok.com/empereza'),
('youtube', 'https://youtube.com/empereza'),
('twitter', 'https://twitter.com/empereza'),
('instagram', 'https://instagram.com/empereza'),
('copyright', '&copy; Copyright 2021 André Luferat');

INSERT INTO authors (aut_id, aut_avatar, aut_name, aut_link) VALUES
('1', 'https://randomuser.me/api/portraits/lego/5.jpg', 'André Luferat', 'http://luferat.net/'),
('2', 'https://randomuser.me/api/portraits/lego/7.jpg', 'Joca da Silva', 'http://catcocomum.tk/'),
('3', 'https://randomuser.me/api/portraits/women/56.jpg', 'Setembrina Trocatapas', 'http://catcocomum.tk/');

INSERT INTO content (cont_date, cont_image, cont_title, cont_preview, cont_text, cont_author) VALUES
(
    '2021-02-01 17:35:18',
    'https://picsum.photos/200',
    'Primeiro Artigo',
    'Este é nosso primeiro artigo do site....',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '1'
),
(
    '2021-02-02 19:50:10',
    'https://picsum.photos/201',
    'Reunião Geral de Páscoa',
    'Assista à gravação da nossa primeira reunão empresarial do segundo semestre.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '3'
),
(
    '2021-01-28 11:20:19',
    'https://picsum.photos/199',
    'Como usar a máscara de forma correta',
    'Veja as formas corretas de usar, manipular, descartar e reciclar suas máscaras.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '2'
);

INSERT INTO content (cont_date, cont_image, cont_title, cont_preview, cont_text, cont_author) VALUES 
(
    '2021-02-03 19:44:00',
    'https://picsum.photos/198',
    'Como o PHP ajudou a curar minha depressão',
    'O PHP é uma das linguagens mais usadas no mundo e pode te salvar de um suicídio ou te matar de vez.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '2'
);

INSERT INTO about (image, title, preview, text) VALUES
(
    'https://picsum.photos/301',
    'Sobre agente',
    'Saiba mais sobre o {{siteName}}.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>'
),
(
    'https://picsum.photos/299',
    'Sobre este site',
    'Saiba mais sobre este site de {{siteName}}.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>'
),
(
    'https://picsum.photos/298',
    'Políticas de privacidade',
    'Saiba como cuidados das suas informações.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>'
),
(
    'https://picsum.photos/302',
    'Sobre os Cookies',
    'Biscoitos são importantes para a Internet.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>'
),
(
    'https://picsum.photos/297',
    'Sobre o autor.',
    'Conheça aqui, quem fez este site.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>'
);

