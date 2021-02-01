-- Em modo de desenvolvimento
DROP DATABASE IF EXISTS mysistten;
CREATE DATABASE mysistten CHARACTER SET utf8 COLLATE utf8_general_ci;
USE mysistten;

CREATE TABLE authors (
    aut_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aut_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    aut_avatar VARCHAR(255) NOT NULL,
    aut_name VARCHAR(127) NOT NULL,
    aut_link VARCHAR(255) NOT NULL,
    status ENUM ('ativo', 'inativo') DEFAULT 'ativo'
);

CREATE TABLE content (
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
    status ENUM ('Não lida','lida','respondida','apagada') DEFAULT 'Não lida'
);

CREATE TABLE config (
    cfg_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    variable VARCHAR(63) NOT NULL,
    value TEXT NOT NULL
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
('instagram', 'https://instagram.com/empereza');

INSERT INTO authors (aut_avatar, aut_name, aut_link) VALUES
('https://randomuser.me/api/portraits/lego/5.jpg', 'André Luferat', 'http://luferat.net/'),
('https://randomuser.me/api/portraits/lego/7.jpg', 'Joca da Silva', 'http://catcocomum.tk/'),
('https://randomuser.me/api/portraits/women/56.jpg', 'Setembrina Trocatapas', 'http://catcocomum.tk/');

INSERT INTO content (cont_image, cont_title, cont_preview, cont_text, cont_author) VALUES
(
    'https://picsum.photos/200',
    'Primeiro Artigo',
    'Este é nosso primeiro artigo do site....',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '1'
),
(
    'https://picsum.photos/201',
    'Reunião Geral de Páscoa',
    'Assista à gravação da nossa primeira reunão empresarial do segundo semestre.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '3'
),
(
    'https://picsum.photos/199',
    'Como usar a máscara de forma correta',
    'Veja as formas corretas de usar, manipular, descartar e reciclar suas máscaras.',
    '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi hic, error tenetur obcaecati sapiente earum ab rem quod magnam, voluptatum laudantium praesentium! Repudiandae nostrum ad obcaecati dolores nulla delectus nemo!</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea veniam odit consectetur nulla nisi quisquam blanditiis quis expedita, a quod deserunt ullam eligendi illo similique aliquid provident, ipsum dicta ipsam?</p><p><img src="https://picsum.photos/400/300" alt="Imagem aleatória"></p><p><a href="http://luferat.net/">Site do fessô</a></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos harum, laudantium nesciunt id explicabo quia. Quidem non obcaecati placeat necessitatibus tempora. Autem quam earum labore provident, minus omnis perferendis dolorem!</p>',
    '2'
);