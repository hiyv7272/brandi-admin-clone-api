--
-- 1. first_categories
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
-- 2. second_categories
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
-- 3. total_categories
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
-- 4. origins
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
-- 5. information_notices
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
-- 6. color_filters
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
-- 7. style_filters
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

INSERT INTO style_filters (id, name, is_used) VALUES(1, '선택안함', TRUE);
INSERT INTO style_filters (id, name, is_used) VALUES(2, '심플베이직', TRUE);
INSERT INTO style_filters (id, name, is_used) VALUES(3, '러블리', TRUE);
INSERT INTO style_filters (id, name, is_used) VALUES(4, '페미닌', TRUE);
INSERT INTO style_filters (id, name, is_used) VALUES(5, '캐주얼', TRUE);
INSERT INTO style_filters (id, name, is_used) VALUES(6, '섹시글램', TRUE);

--
-- 8. basic_options_colors
--
CREATE TABLE `basic_options_colors` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '색상이름',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '기본옵션 색상';

INSERT INTO basic_options_colors (id, name, is_used) VALUES(1, 'Black', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(2, 'White', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(3, 'Gray', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(4, 'Ivory', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(5, 'Navy', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(6, 'Brown', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(7, 'Wine', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(8, 'Purple', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(9, 'Green', TRUE);
INSERT INTO basic_options_colors (id, name, is_used) VALUES(10, 'Blue', TRUE);

-- 
-- 9. basic_options_sizes
--
CREATE TABLE `basic_options_sizes` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '사이즈이름',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '기본옵션 사이즈';

INSERT INTO basic_options_sizes (id, name, is_used) VALUES(1, 'Free', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(2, 'XL', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(3, 'L', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(4, 'M', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(5, 'S', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(6, 'XS', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(7, '25', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(8, '26', TRUE);
INSERT INTO basic_options_sizes (id, name, is_used) VALUES(9, '27', TRUE);

--
-- 10. option_types
--
CREATE TABLE `option_types` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '옵션이름',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '옵션타입';

INSERT INTO option_types (id, name, is_used) VALUES(1, '기본옵션', TRUE);
INSERT INTO option_types (id, name, is_used) VALUES(2, '자율옵션', TRUE);
INSERT INTO option_types (id, name, is_used) VALUES(3, '옵션없음', TRUE);

--
-- 11. option_info
--
CREATE TABLE `option_info` (
    `id`                    BIGINT      NOT NULL    AUTO_INCREMENT,
    `option_types_id`       BIGINT      NOT NULL                                COMMENT '옵션타입 외래키 (FK)', 
    `is_used`               TINYINT     NOT NULL                                COMMENT '사용여부',
    `created_at`            DATETIME    NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`            DATETIME    NULL                                    COMMENT '수정시간',
    `creator_id`            BIGINT      NULL                                    COMMENT '생성자',
    `changer_id`            BIGINT      NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT option_types_id_fkey FOREIGN KEY (option_types_id) REFERENCES option_types(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '옵션정보';

INSERT INTO option_info (id, option_types_id, is_used) VALUES(
    1,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    2,
    (SELECT id from option_types WHERE name='자율옵션' LIMIT 1),
    TRUE
),
(
    3,
    (SELECT id from option_types WHERE name='자율옵션' LIMIT 1),
    TRUE
);

--
-- 12. basic_options
--
CREATE TABLE `basic_options` (
    `id`                        BIGINT      NOT NULL    AUTO_INCREMENT,
    `option_info_id`            BIGINT      NOT NULL                                COMMENT '옵션정보 외래키 (FK)',
    `basic_options_colors_id`   BIGINT      NOT NULL                                COMMENT '기본옵션 색상 외래키 (FK)',
    `basic_options_sizes_id`    BIGINT      NOT NULL                                COMMENT '기본옵션 사이즈 외래키 (FK)',
    `is_stock_managed`          TINYINT     NOT NULL                                COMMENT '재고관리여부',
    `stock_volume`              INT         NULL                                    COMMENT '재고수량',
    `is_used`                   TINYINT     NOT NULL                                COMMENT '사용여부',
    `created_at`                DATETIME    NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                DATETIME    NULL                                    COMMENT '수정시간',
    `creator_id`                BIGINT      NULL                                    COMMENT '생성자',
    `changer_id`                BIGINT      NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT basic_options_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id),
    CONSTRAINT basic_options_colors_id_fkey FOREIGN KEY (basic_options_colors_id) REFERENCES basic_options_colors(id),
    CONSTRAINT basic_options_sizes_id_fkey FOREIGN KEY (basic_options_sizes_id) REFERENCES basic_options_sizes(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '기본옵션';

INSERT INTO basic_options (id, option_info_id, basic_options_colors_id, basic_options_sizes_id, is_stock_managed, is_used) VALUES(
    1,
    (SELECT id from option_info WHERE id=1 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    TRUE -- is_used
);

--
-- 13. autonomous_options_types
--
CREATE TABLE `autonomous_options_types` (
    `id`            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(50)     NOT NULL    UNIQUE                      COMMENT '타입명',
    `is_used`       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '자율옵션 타입';

INSERT INTO autonomous_options_types (id, name, is_used) VALUES(1, '분리선택형', TRUE);
INSERT INTO autonomous_options_types (id, name, is_used) VALUES(2, '독립선택형', TRUE);

--
-- 14. autonomous_options
--
CREATE TABLE `autonomous_options` (
    `id`                            BIGINT          NOT NULL    AUTO_INCREMENT,
    `option_info_id`                BIGINT          NOT NULL                                COMMENT '옵션정보 외래키 (FK)',
    `autonomous_options_types_id`   BIGINT          NOT NULL                                COMMENT '자율옵션 타입 외래키 (FK)',
    `option_name`                   VARCHAR(100)    NOT NULL                                COMMENT '옵션명',               
    `option_value`                  VARCHAR(100)    NOT NULL                                COMMENT '옵션값',
    `option_order`                  INT             NOT NULL                                COMMENT '옵션순서',
    `is_option_required`            TINYINT         NULL                                    COMMENT '필수옵션여부',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT autonomous_options_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id),
    CONSTRAINT autonomous_options_types_id_fkey FOREIGN KEY (autonomous_options_types_id) REFERENCES autonomous_options_types(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '자율옵션';

INSERT INTO autonomous_options (
    id,
    option_info_id,
    autonomous_options_types_id,
    option_name,
    option_value,
    option_order,
    is_option_required,
    is_used
) VALUES(
    1,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1), -- autonomous_options_types_id
    '색상', -- option_name
    '빨강', -- option_value
    1, -- option_order
    NULL, -- is_option_required
    TRUE -- is_used
),
(
    2,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '색상', -- option_name
    '노랑', -- option_value
    1, -- option_order
    NULL, -- is_option_required
    TRUE -- is_used
),
(
    3,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '크기', -- option_name
    'XL', -- option_value
    2, -- option_order
    NULL, -- is_option_required
    TRUE -- is_used
),
(
    4,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '크기', -- option_name
    'L', -- option_value
    2, -- option_order
    NULL, -- is_option_required
    TRUE -- is_used
),

(
    5,
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (3)
    (SELECT id from autonomous_options_types WHERE name='독립선택형' LIMIT 1),
    '색상', -- option_name
    '노랑', -- option_value
    1, -- option_order
    TRUE, -- is_option_required
    TRUE -- is_used
),
(
    6,
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (3)
    (SELECT id from autonomous_options_types WHERE name='독립선택형' LIMIT 1),
    '크기', -- option_name
    'L', -- option_value
    2, -- option_order
    FALSE, -- is_option_required
    TRUE -- is_used
)
;   

--
-- 15. autonomous_options_combinations
--
CREATE TABLE `autonomous_options_combinations` (
    `id`                            BIGINT          NOT NULL    AUTO_INCREMENT,
    `option_info_id`                BIGINT          NOT NULL                                COMMENT '옵션정보 외래키(FK)',
    `autonomous_options_types_id`   BIGINT          NOT NULL                                COMMENT '자율옵션 타입 외래키(FK)',
    `full_option_name`              VARCHAR(100)    NOT NULL    UNIQUE                      COMMENT '전체 옵션명',
    `is_required`                   TINYINT         NOT NULL                                COMMENT '필수여부',
    `is_stock_managed`              TINYINT         NOT NULL                                COMMENT '일반재고관리여부',
    `stock_volume`                  INT             NULL                                    COMMENT '재고수량',
    `extra_price`                   INT             NOT NULL                                COMMENT '추가금액',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT autonomous_options_combinations_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id),
    CONSTRAINT autonomous_options_combinations_autonomous_options_types_id_fkey FOREIGN KEY (autonomous_options_types_id) REFERENCES autonomous_options_types(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '자율옵션 조합';

INSERT INTO autonomous_options_combinations (
    id,
    option_info_id,
    autonomous_options_types_id,
    full_option_name,
    is_required,
    is_stock_managed,
    stock_volume,
    extra_price,
    is_used
) VALUES (
    1,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '빨강/XL',
    TRUE, -- is_required
    TRUE, -- is_stock_managed
    1, -- stock_volume
    100, -- extra_price
    TRUE -- is_used
),
(
    2,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '빨강/L',
    TRUE, -- is_required
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    200, -- extra_price
    TRUE -- is_used 
),
(
    3,
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (2)
    (SELECT id from autonomous_options_types WHERE name='분리선택형' LIMIT 1),
    '노랑/XL',
    TRUE, -- is_required
    TRUE, -- is_stock_managed
    2, -- stock_volume
    300, -- extra_price
    TRUE -- is_used
),

(
    4,
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (3)
    (SELECT id from autonomous_options_types WHERE name='독립선택형' LIMIT 1),
    '노랑',
    TRUE, -- is_required
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    2000, -- extra_price
    TRUE -- is_used
),
(
    5,
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (3)
    (SELECT id from autonomous_options_types WHERE name='독립선택형' LIMIT 1),
    'L',
    FALSE, -- is_required
    TRUE, -- is_stock_managed
    3, -- stock_volume
    3000, -- extra_price
    TRUE -- is_used
),
(
    6,
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (3)
    (SELECT id from autonomous_options_types WHERE name='독립선택형' LIMIT 1),
    'S',
    FALSE, -- is_required
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    4000, -- extra_price
    TRUE -- is_used
);

--
-- 16. no_option
--
CREATE TABLE `no_option` (
    `id`                            BIGINT          NOT NULL    AUTO_INCREMENT,
    `option_info_id`                BIGINT          NOT NULL                                COMMENT '옵션정보 외래키(FK)',
    `is_stock_managed`              TINYINT         NOT NULL                                COMMENT '일반재고관리여부',
    `stock_volume`                  INT             NULL                                    COMMENT '재고수량',
    `stock_price`                   INT             NOT NULL                                COMMENT '추가금액',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT no_option_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '옵션없음';

--
-- 17. products
--
CREATE TABLE `products` (
    `id`                            BIGINT          NOT NULL    AUTO_INCREMENT,
    `name`                          VARCHAR(100)    NOT NULL                                COMMENT '상품명',
    `product_number`                BIGINT          NOT NULL    UNIQUE                      COMMENT '상품번호',
    `serial_number`                 VARCHAR(200)    NOT NULL    UNIQUE                      COMMENT '상품코드',
    `is_temporary_save`             TINYINT         NOT NULL                                COMMENT '임시저장 여부',
    `is_sold`                       TINYINT         NOT NULL                                COMMENT '판매여부',
    `is_displayed`                  TINYINT         NOT NULL                                COMMENT '진열여부',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',
    `first_categories_id`           BIGINT          NOT NULL                                COMMENT '1차 카테고리 외래키(FK)',
    `second_categories_id`          BIGINT          NOT NULL                                COMMENT '2차 카테고리 외래키(FK)',
    `information_notices_use`       TINYINT         NOT NULL                                COMMENT '상품정보 고시 사용여부',
    `information_notices_id`        BIGINT          NULL                                    COMMENT '상품정보 고시 외래키(FK)',
    `one_line_description`          VARCHAR(500)    NOT NULL                                COMMENT '한줄상품설명',
    `main_image`                    VARCHAR(200)    NOT NULL                                COMMENT '대표이미지',
    `image_1`                       VARCHAR(200)    NULL                                    COMMENT '이미지 1',
    `image_2`                       VARCHAR(200)    NULL                                    COMMENT '이미지 2',
    `image_3`                       VARCHAR(200)    NULL                                    COMMENT '이미지 3',
    `image_4`                       VARCHAR(200)    NULL                                    COMMENT '이미지 4',
    `color_filters_id`              BIGINT          NOT NULL                                COMMENT '색상필터 외래키(FK)',
    `style_filters_id`              BIGINT          NOT NULL                                COMMENT '스타일필터 외래키(FK)',
    `is_age_filter_input`           TINYINT         NOT NULL                                COMMENT '연령필터 입력여부',
    `detailed_info`                 LONGTEXT        NOT NULL                                COMMENT '상세상품정보',
    `youtube_url`                   VARCHAR(200)    NULL                                    COMMENT '유투브URL',
    `option_info_id`                BIGINT          NOT NULL    UNIQUE                      COMMENT '옵션정보 외래키(FK)',
    `price`                         INT             NOT NULL                                COMMENT '판매가',
    `discount_rate`                 INT             NULL                                    COMMENT '할인율',
    `discount_price`                INT             NULL                                    COMMENT '할인가',
    `discounted_price`              INT             NULL                                    COMMENT '할인판매가',
    `discount_infinite_period`      TINYINT         NULL                                    COMMENT '할인기간 무기한 여부',
    `discount_start_period`         DATETIME        NULL                                    COMMENT '할인기간(시작)',
    `discount_end_period`           DATETIME        NULL                                    COMMENT '할인기간(종료)',
    `minimum_quantity`              INT             NULL                                    COMMENT '최소판매수량',
    `maximum_quantity`              INT             NULL                                    COMMENT '최대판매수량',
    `product_tags_used`             TINYINT         NOT NULL                                COMMENT '상품태그 관리 사용여부',
    `coordinates_product_used`      TINYINT         NOT NULL                                COMMENT '코디상품 사용여부',
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT products_first_categories_id_fkey FOREIGN KEY (first_categories_id) REFERENCES first_categories(id),
    CONSTRAINT products_second_categories_id_fkey FOREIGN KEY (second_categories_id) REFERENCES second_categories(id),
    CONSTRAINT products_information_notices_id_fkey FOREIGN KEY (information_notices_id) REFERENCES information_notices(id),
    CONSTRAINT products_color_filters_id_fkey FOREIGN KEY (color_filters_id) REFERENCES color_filters(id),
    CONSTRAINT products_style_filters_id_fkey FOREIGN KEY (style_filters_id) REFERENCES style_filters(id),
    CONSTRAINT products_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '상품';

INSERT INTO products (
    id,
    name,
    product_number,
    serial_number,
    is_temporary_save,
    is_sold,
    is_displayed,
    is_used,
    first_categories_id,
    second_categories_id,
    information_notices_use,
    information_notices_id,
    one_line_description,
    main_image,
    image_1,
    image_2,
    image_3,
    image_4,
    color_filters_id,
    style_filters_id,
    is_age_filter_input,
    detailed_info,
    youtube_url,
    option_info_id,
    price,
    discount_rate,
    discount_price,
    discounted_price,
    discount_infinite_period,
    discount_start_period,
    discount_end_period,
    minimum_quantity,
    maximum_quantity,
    product_tags_used,
    coordinates_product_used,
--  created_at,
    updated_at,
    creator_id,
    changer_id
) VALUES (
    1, -- id 기본 선택
    'kim 테스트 (오늘출발)', -- name (required when registering)
    200, -- product_number
    'B000000000000000335', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    TRUE, -- information_notice_use
    (SELECT id from information_notices WHERE id=1 LIMIT 1),-- information_notices_id
    '한줄설명_1', -- one_line_description
    'image_url', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    (SELECT id from color_filters WHERE kr_name='빨강' LIMIT 1), -- color_filters_id (required when registering)
    (SELECT id from style_filters WHERE name='심플베이직' LIMIT 1), -- style_filters_id (required when registering)
    TRUE, -- is_age_filter_input (required when registering)
    'kim 테스트 상세정보', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=1 LIMIT 1), -- option_info_id (required when registering)
    10000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    NULL, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    FALSE, -- coordinates_product_used
    NULL, -- updated_at
    NULL, -- creator_id
    NULL -- changer_id
),
(
    2, -- id 자율/분리 선택
    '테스트1', -- name (required when registering)
    202, -- product_number
    'CV000000000000009077', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트1_한줄설명', -- one_line_description
    '테스트1_main_image_url', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    (SELECT id from color_filters WHERE kr_name='주황' LIMIT 1), -- color_filters_id (required when registering)
    (SELECT id from style_filters WHERE name='러블리' LIMIT 1), -- style_filters_id (required when registering)
    TRUE, -- is_age_filter_input (required when registering)
    '테스트1_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (required when registering)
    10000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    NULL, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    FALSE, -- coordinates_product_used
    NULL, -- updated_at
    NULL, -- creator_id
    NULL -- changer_id
),
(
    3, -- id 자율/독립/할인 선택
    '테스트2_', -- name (required when registering)
    203, -- product_number
    'CV000000000000000090', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='스커트' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='미니스커트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트2_한줄설명', -- one_line_description
    '테스트2_main_image_url', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    (SELECT id from color_filters WHERE kr_name='노랑' LIMIT 1), -- color_filters_id (required when registering)
    (SELECT id from style_filters WHERE name='페미닌' LIMIT 1), -- style_filters_id (required when registering)
    TRUE, -- is_age_filter_input (required when registering)
    '테스트2_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (required when registering)
    30000, -- price
    10, -- discount_rate
    3000, -- discount_price
    27000, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    FALSE, -- coordinates_product_used
    NULL, -- updated_at
    NULL, -- creator_id
    NULL -- changer_id
);

--
-- 18. age_filters
--
CREATE TABLE `age_filters` (
    `id`                            BIGINT          NOT NULL    AUTO_INCREMENT,
    `products_id`                   BIGINT          NOT NULL                                COMMENT '상품 외래키(FK)',
    `name`                          VARCHAR(50)     NOT NULL                                COMMENT '연령필터 이름',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT age_filters_products_id_fkey FOREIGN KEY (products_id) REFERENCES products(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '연령필터';

INSERT INTO age_filters (id, products_id, name, is_used) VALUES(
    1,
    (SELECT id from products WHERE id=1 LIMIT 1),
    '10대',
    TRUE
),
(
    2,
    (SELECT id from products WHERE id=2 LIMIT 1),
    '10대',
    TRUE
),
(
    3,
    (SELECT id from products WHERE id=3 LIMIT 1),
    '10대',
    TRUE
);
