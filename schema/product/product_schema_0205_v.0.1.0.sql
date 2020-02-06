--
-- Create first_categories table
--
CREATE TABLE `first_categories` (
    `id`                BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`              VARCHAR(50)     NOT NULL                                COMMENT '1차 카테고리 이름',
    `managed_order`     INTEGER         NOT NULL                                COMMENT '관리순서',
    `is_used`           TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`        DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`        DATETIME        NULL                                    COMMENT '수정시간',
    `changer_id`        BIGINT          NULL                                    COMMENT '생성자',
    `creator_id`        BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '1차 카테고리';

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
    `id`                BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`              VARCHAR(50)     NOT NULL                                COMMENT '2차 카테고리 이름',
    `managed_order`     INTEGER         NULL                                    COMMENT '관리순서',
    `is_used`           TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`        DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`        DATETIME        NULL                                    COMMENT '수정시간',
    `changer_id`        BIGINT          NULL                                    COMMENT '생성자',
    `creator_id`        BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '2차 카테고리';

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
    `id`                        BIGINT      NOT NULL    AUTO_INCREMENT,
    `first_categories_id`       BIGINT      NULL                                    COMMENT '1차 카테고리 외래키',
    `second_categories_id`      BIGINT      NULL                                    COMMENT '2차 카테고리 외래키',
    `is_used`                   bool        NOT NULL                                COMMENT '사용여부',
    `created_at`                DATETIME    NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                DATETIME    NULL                                    COMMENT '수정시간',
    `changer_id`                BIGINT      NULL                                    COMMENT '생성자',
    `creator_id`                BIGINT      NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT first_categories_id_fkey FOREIGN KEY (first_categories_id) REFERENCES first_categories(id),
    CONSTRAINT second_categories_id_fkey FOREIGN KEY (second_categories_id) REFERENCES second_categories(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '전체 카테고리';

INSERT INTO total_categories (id, first_categories_id, second_categories_id, is_used) VALUES
(
    1,
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1),
    (SELECT id from second_categories WHERE name='코트' LIMIT 1),
    TRUE
),
(
    2,
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1),
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1),
    TRUE
),
(
    3,
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1),
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1),
    TRUE
),
(
    4,
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1),
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1),
    TRUE
),
(
    5,
    (SELECT id from first_categories WHERE name='상의' LIMIT 1),
    (SELECT id from second_categories WHERE name='니트' LIMIT 1),
    TRUE
),
(
    6,
    (SELECT id from first_categories WHERE name='상의' LIMIT 1),
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1),
    TRUE
),
(
    7,
    (SELECT id from first_categories WHERE name='상의' LIMIT 1),
    (SELECT id from second_categories WHERE name='블라우스/셔츠' LIMIT 1),
    TRUE
),
(
    8,
    (SELECT id from first_categories WHERE name='상의' LIMIT 1),
    (SELECT id from second_categories WHERE name='후드/맨투맨' LIMIT 1),
    TRUE
),
(
    9,
    (SELECT id from first_categories WHERE name='상의' LIMIT 1),
    (SELECT id from second_categories WHERE name='베스트' LIMIT 1),
    TRUE
);

--
-- Create origins
--
CREATE TABLE `origins` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(100)    NOT NULL    UNIQUE                      COMMENT '원산지명',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `changer_id`    BIGINT          NULL                                    COMMENT '생성자',
    `creator_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '원산지';

INSERT INTO origins (id, name, is_used) VALUES(1, '한국', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(2, '중국', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(3, '베트남', TRUE);
INSERT INTO origins (id, name, is_used) VALUES(4, '기타', TRUE);

--
-- Create information_notices
--
CREATE TABLE `information_notices` (
    `id`                    BIGINT          NOT NULL    AUTO_INCREMENT,
    `manufacturer`          VARCHAR(100)    NOT NULL                                COMMENT '제조사(수입사)',
    `manufacturing_date`    DATETIME        NOT NULL                                COMMENT '제조일자',
    `origins_id`            BIGINT          NOT NULL                                COMMENT '원산지',
    `is_used`               TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`            DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`            DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`            BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`            BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT origins_id_fkey FOREIGN KEY (origins_id) REFERENCES origins(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '상품정보 고시';

INSERT INTO information_notices (id, manufacturer, manufacturing_date, origins_id, is_used) VALUES(
    1,
    '나이카',
    '2020-02-05 02:05:00',
    (SELECT id from origins WHERE name='한국' LIMIT 1),
    TRUE
);

--
-- Create color_filters
--
CREATE TABLE `color_filters` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `kr_name`       VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '한글색상이름',
    `en_name`       VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '영어색상이름',
    `color_value`   VARCHAR(10)     NOT NULL                                COMMENT '색상값',
    `image_url`     VARCHAR(200)    NOT NULL                                COMMENT '색상 이미지',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '색상필터';

INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(1, '빨강', '(Red)', '#FF0000', '/color_filter/red.png', TRUE);
INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(2, '주황', '(Orange)', '#FF4500', '/color_filter/orange.png', TRUE);
INSERT INTO color_filters (id, kr_name, en_name, color_value, image_url, is_used) VALUES(3, '노랑', '(Yellow)', '#FFFF00', '/color_filter/yellow.png', TRUE);

--
-- Create style_filters
--
CREATE TABLE `style_filters` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(50)     NOT NULL                                COMMENT '필터이름',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '스타일필터';

INSERT INTO style_filters (id, name, is_used) VALUES(
    1,
    '선택안함',
    TRUE
),
(
    2,
    '심플베이직',
    TRUE
),
(
    3,
    '러블리',
    TRUE
),
(
    4,
    '페미닌',
    TRUE
),
(
    5,
    '캐주얼',
    TRUE
),
(
    6,
    '섹시글램',
    TRUE
);
