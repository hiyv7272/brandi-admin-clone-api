--
-- Create first_categories table
--
CREATE TABLE `first_categories` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `managed_order` integer NOT NULL,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `changer_id` bigint NULL,
    `creator_id` bigint NULL,
    PRIMARY KEY (id)
);

INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(1, '아우터', 1, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(2, '상의', 2, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(3, '스커트', 3, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(4, '바지', 4, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(5, '원피스', 5, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(6, '신발', 6, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(7, '가방', 7, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(8, '잡화', 8, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(9, '주얼리', 9, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(10, '라이프웨어', 10, TRUE);
INSERT INTO first_categories (id, name, managed_order, is_used) VALUES(11, '빅사이즈', 11, TRUE);

--
-- Create second_categories table
--
CREATE TABLE `second_categories` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `managed_order` integer NULL,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `changer_id` bigint NULL,
    `creator_id` bigint NULL,
    PRIMARY KEY (id)
);

INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(1, '코트', 1, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(2, '점퍼', 2, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(3, '재킷', 3, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(4, '가디건', 4, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(5, '니트', 5, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(6, '티셔츠', 6, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(7, '블라우스/셔츠', 7, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(8, '후드/맨투맨', 8, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(9, '베스트', 9, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(10, '미니스커트', 10, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(11, '롱스커트', 11, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(12, '청바지', 12, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(13, '슬랙스', 13, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(14, '반바지', 14, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(15, '레깅스', 15, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(16, '스니커즈', 16, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(17, '부츠', 17, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(18, '힐', 18, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(19, '플랫/로퍼', 19, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(20, '샌들', 20, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(21, '크로스백', 21, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(22, '클러치', 22, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(23, '숄더백', 23, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(24, '토트백', 24, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(25, '백팩', 25, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(26, '휴대폰케이스', 26, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(27, '지갑/파우치', 27, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(28, '스카프/머플러', 28, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(29, '모자', 29, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(30, '양말', 30, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(31, '시계', 31, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(32, '아이웨어', 32, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(33, '기타', 33, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(34, '귀걸이', 34, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(35, '목걸이/팔찌', 35, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(36, '반지', 36, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(37, '언더웨어', 37, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(38, '홈웨어', 38, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(39, '스윔웨어', 39, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(40, '아우터', 40, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(41, '상의', 41, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(42, '스커트', 42, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(43, '바지', 43, TRUE);
INSERT INTO second_categories (id, name, managed_order, is_used) VALUES(44, '드레스', 44, TRUE);

--
-- Create total_categories table
--
CREATE TABLE `total_categories` (
    `id` bigint NOT NULL AUTO_INCREMENT, 
    `first_categories_id` bigint NULL,
    `second_categories_id` bigint NULL,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `changer_id` bigint NULL,
    `creator_id` bigint NULL,
    PRIMARY KEY (id),
    CONSTRAINT first_categories_id_fkey FOREIGN KEY (first_categories_id) REFERENCES first_categories(id),
    CONSTRAINT second_categories_id_fkey FOREIGN KEY (second_categories_id) REFERENCES second_categories(id)
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    1,
    (SELECT id from first_categories WHERE name='아우터'),
    (SELECT id from second_categories WHERE name='코트'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    2,
    (SELECT id from first_categories WHERE name='아우터'),
    (SELECT id from second_categories WHERE name='점퍼'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    3,
    (SELECT id from first_categories WHERE name='아우터'),
    (SELECT id from second_categories WHERE name='재킷'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    4,
    (SELECT id from first_categories WHERE name='아우터'),
    (SELECT id from second_categories WHERE name='가디건'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    5,
    (SELECT id from first_categories WHERE name='상의'),
    (SELECT id from second_categories WHERE name='니트'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    6,
    (SELECT id from first_categories WHERE name='상의'),
    (SELECT id from second_categories WHERE name='티셔츠'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    7,
    (SELECT id from first_categories WHERE name='상의'),
    (SELECT id from second_categories WHERE name='블라우스/셔츠'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    8,
    (SELECT id from first_categories WHERE name='상의'),
    (SELECT id from second_categories WHERE name='후드/맨투맨'),
    TRUE
);

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES(
    9,
    (SELECT id from first_categories WHERE name='상의'),
    (SELECT id from second_categories WHERE name='베스트'),
    TRUE
);

--
-- Create origins
--
CREATE TABLE `origins` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL UNIQUE,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `changer_id` bigint NULL,
    `creator_id` bigint NULL,
    PRIMARY KEY (id)
);

INSERT INTO origins (id, name, is_used) VALUES(1, '한국', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(2, '중국', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(3, '베트남', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(4, '기타', TRUE);

--
-- Create information_notices
--
CREATE TABLE `information_notices` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `manufacturer` varchar(100) NOT NULL,
    `manufacturing_date` datetime NOT NULL,
    `origins_id` bigint NOT NULL,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `creator_id` bigint NULL,
    `changer_id` bigint NULL,
    PRIMARY KEY (id),
    CONSTRAINT origins_id_fkey FOREIGN KEY (origins_id) REFERENCES origins(id)
);

INSERT INTO information_notices (id, manufacturer, manufacturing_date, origins_id, is_used) VALUES(
    1,
    '나이카',
    '2020-02-05 02:05:00',
    (SELECT id from origins WHERE name='한국'),
    TRUE
);

--
-- Create color_filters
--
CREATE TABLE `color_filters` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `kr_name` varchar(50) NOT NULL UNIQUE,
    `en_name` varchar(50) NOT NULL UNIQUE,
    `color_value` varchar(10) NOT NULL,
    `image_url` varchar(200) NOT NULL,
    `is_used` bool NOT NULL,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NULL,
    `creator_id` bigint NULL,
    `changer_id` bigint NULL,
    PRIMARY KEY (id)
);

INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(1, '빨강', '(Red)', '#FF0000', '/color_filter/red.png', TRUE);
INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(2, '주황', '(Orange)', '#FF4500', '/color_filter/orange.png', TRUE);
INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(3, '노랑', '(Yellow)', '#FFFF00', '/color_filter/yellow.png', TRUE);
