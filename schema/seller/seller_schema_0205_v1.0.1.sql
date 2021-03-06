
-- authorities Table Create SQL
CREATE TABLE authorities
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NULL                         COMMENT '권한이름', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '권한 테이블';

INSERT INTO authorities (id, name) VALUES (1, '마스터');
INSERT INTO authorities (id, name) VALUES (2, '셀러');


-- accounts Table Create SQL
CREATE TABLE accounts
(
    `id`              BIGINT          NOT NULL    AUTO_INCREMENT    COMMENT 'id', 
    `authorities_id`  BIGINT          NOT NULL                      COMMENT '권한테이블_id FK', 
    `account`         VARCHAR(45)     NOT NULL                      COMMENT '계정', 
    `password`        VARCHAR(300)    NOT NULL                      COMMENT '비밀번호', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '계정 테이블';

ALTER TABLE accounts
    ADD CONSTRAINT FK_accounts_authorities_id FOREIGN KEY (authorities_id)
        REFERENCES authorities (id);

ALTER TABLE accounts
    ADD CONSTRAINT UC_account UNIQUE (account);

INSERT INTO accounts (id, authorities_id, account, password) VALUES ('1', '1', 'topuser', '1234');

-- menu Table Create SQL 
CREATE TABLE menu
(
    `id`       BIGINT          NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `topname`  VARCHAR(45)     NULL                         COMMENT '상위메뉴', 
    `name`     VARCHAR(45)     NULL                         COMMENT '메뉴이름', 
    `url`      VARCHAR(100)    NULL                         COMMENT '메뉴url', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '메뉴 테이블';


INSERT INTO menu (id, topname, name, url) VALUES ('1', '공지사항', '', 'icon-speech');
INSERT INTO menu (id, topname, name, url) VALUES ('2', '공지사항', '브랜디 공지', '/brandi/notice/notice_lists');
INSERT INTO menu (id, topname, name, url) VALUES ('3', '공지사항', '기획전 상품 신청', '/brandi/events/join');
INSERT INTO menu (id, topname, name, url) VALUES ('4', '통계', '', 'icon-bar-chart');
INSERT INTO menu (id, topname, name, url) VALUES ('5', '통계', '시간단위분석', '/brandi/statistics/per_time');
INSERT INTO menu (id, topname, name, url) VALUES ('6', '통계', 'KPI_커머스', '/brandi/cstatistics/kpi');
INSERT INTO menu (id, topname, name, url) VALUES ('7', '통계', 'KPI_커뮤니티', '/brandi/statistics/kpi');
INSERT INTO menu (id, topname, name, url) VALUES ('8', '통계', '리텐션', '/brandi/statistics/retention');
INSERT INTO menu (id, topname, name, url) VALUES ('9', '통계', '판매분석(상품)', '/brandi/cstatistics/salesAnalysisProduct');
INSERT INTO menu (id, topname, name, url) VALUES ('10', '통계', '판매분석(셀러)', '/brandi/cstatistics/salesAnalysisSeller');
INSERT INTO menu (id, topname, name, url) VALUES ('11', '통계', '추세분석(상품)', '/brandi/cstatistics/trendAnalysisProduct');
INSERT INTO menu (id, topname, name, url) VALUES ('12', '통계', '추세분석(셀러)', '/brandi/cstatistics/trendAnalysisSeller');
INSERT INTO menu (id, topname, name, url) VALUES ('13', '주문관리', '', 'icon-basket-loaded');
INSERT INTO menu (id, topname, name, url) VALUES ('14', '주문관리', '전체주문 관리', '/brandi/order/masterAllOrderList');
INSERT INTO menu (id, topname, name, url) VALUES ('15', '주문관리', '결제대기관리', '/brandi/order/masterPaymentWatingList');
INSERT INTO menu (id, topname, name, url) VALUES ('16', '주문관리', '결제완료관리', '/brandi/order/masterPaymentCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('17', '주문관리', '상품준비관리', '/brandi/order/masterProductPrepareList');
INSERT INTO menu (id, topname, name, url) VALUES ('18', '주문관리', '배송준비관리', '/brandi/order/masterDeliveryPrepareList');
INSERT INTO menu (id, topname, name, url) VALUES ('19', '주문관리', '배송중관리', '/brandi/order/masterDeliveryList');
INSERT INTO menu (id, topname, name, url) VALUES ('20', '주문관리', '배송완료관리', '/brandi/order/masterDeliveryCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('21', '주문관리', '구매확정관리', '/brandi/order/masterOrderConfirmList');
INSERT INTO menu (id, topname, name, url) VALUES ('22', '취소/환불 관리', '', 'icon-basket');
INSERT INTO menu (id, topname, name, url) VALUES ('23', '취소/환불 관리', '환불요청관리', '/brandi/refund_order/masterRefundRequestList');
INSERT INTO menu (id, topname, name, url) VALUES ('24', '취소/환불 관리', '반품진행관리', '/brandi/refund_order/masterRefundGoodsList');
INSERT INTO menu (id, topname, name, url) VALUES ('25', '취소/환불 관리', '환불승인중관리', '/brandi/refund_order/masterRefundConfirmList');
INSERT INTO menu (id, topname, name, url) VALUES ('26', '취소/환불 관리', '환불완료관리', '/brandi/refund_order/masterRefundCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('27', '취소/환불 관리', '주문취소중관리', '/brandi/refund_order/masterCancelConfirmList');
INSERT INTO menu (id, topname, name, url) VALUES ('28', '취소/환불 관리', '주문취소완료관리', '/brandi/refund_order/masterCancelCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('29', '취소/환불 관리', '환불요청관리', '/brandi/refund_order/sellerRefundRequestList');
INSERT INTO menu (id, topname, name, url) VALUES ('30', '취소/환불 관리', '반품진행관리', '/brandi/refund_order/sellerRefundGoodsList');
INSERT INTO menu (id, topname, name, url) VALUES ('31', '취소/환불 관리', '환불승인중관리', '/brandi/refund_order/sellerRefundConfirmList');
INSERT INTO menu (id, topname, name, url) VALUES ('32', '취소/환불 관리', '환불완료관리', '/brandi/refund_order/sellerRefundCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('33', '취소/환불 관리', '주문취소중관리', '/brandi/refund_order/sellerCancelConfirmList');
INSERT INTO menu (id, topname, name, url) VALUES ('34', '취소/환불 관리', '주문취소완료관리', '/brandi/refund_order/sellerCancelCompleteList');
INSERT INTO menu (id, topname, name, url) VALUES ('35', '상품관리', '', 'icon-handbag');
INSERT INTO menu (id, topname, name, url) VALUES ('36', '상품관리', '상품 관리', '/brandi/cproduct');
INSERT INTO menu (id, topname, name, url) VALUES ('37', '상품관리', '상품 등록', '/brandi/cproduct/productRegistPage');
INSERT INTO menu (id, topname, name, url) VALUES ('38', '상품관리', '럭키투데이 관리', '/brandi/cproduct/luckyTodayList');
INSERT INTO menu (id, topname, name, url) VALUES ('39', '상품관리', '연동상품관리', '/connecti/product');
INSERT INTO menu (id, topname, name, url) VALUES ('40', '상품관리', '연동상품 카테고리관리', '/connecti/category');
INSERT INTO menu (id, topname, name, url) VALUES ('41', '외부채널연동상품 관리', '', 'icon-share');
INSERT INTO menu (id, topname, name, url) VALUES ('42', '외부채널연동상품 관리', '연동상품관리', '/connecti/external');
INSERT INTO menu (id, topname, name, url) VALUES ('43', '외부채널연동상품 관리', '수동연동관리', '/connecti/external/manual');
INSERT INTO menu (id, topname, name, url) VALUES ('44', '고객응대관리', '', 'icon-emoticon-smile');
INSERT INTO menu (id, topname, name, url) VALUES ('45', '고객응대관리', 'CRM 관리 (고객)', '/brandi/crm/customer');
INSERT INTO menu (id, topname, name, url) VALUES ('46', '고객응대관리', 'CRM 관리 (셀러)', '/brandi/crm/seller');
INSERT INTO menu (id, topname, name, url) VALUES ('47', '고객응대관리', 'Q&A 관리', '/brandi/inquiry/inquiry_list');
INSERT INTO menu (id, topname, name, url) VALUES ('48', '고객응대관리', '텍스트 리뷰', '/brandi/review/textReviewList');
INSERT INTO menu (id, topname, name, url) VALUES ('49', '고객응대관리', '포토 리뷰', '/brandi/review/photoReviewList');
INSERT INTO menu (id, topname, name, url) VALUES ('50', '고객응대관리', '인증번호 관리', '/brandi/certificationCode/certificationCodeDetail');
INSERT INTO menu (id, topname, name, url) VALUES ('51', '정산관리', '', 'icon-calculator');
INSERT INTO menu (id, topname, name, url) VALUES ('52', '정산관리', '정산 관리', '/brandi/calculate/calculate_list');
INSERT INTO menu (id, topname, name, url) VALUES ('53', '정산관리', '정산요약', '/brandi/excclcOrder');
INSERT INTO menu (id, topname, name, url) VALUES ('54', '정산관리', '셀러별 정산요약', '/brandi/excclcOrderResult');
INSERT INTO menu (id, topname, name, url) VALUES ('55', '정산관리', '판매수수료 요약', '/brandi/excclc/excclc_list');
INSERT INTO menu (id, topname, name, url) VALUES ('56', '정산관리', '셀러별 판매수수료', '/brandi/excclcResult/excclcResult_list');
INSERT INTO menu (id, topname, name, url) VALUES ('57', '정산관리', '주문별 판매수수료', '/brandi/excclcResultDetail/excclcResultDetail_list');
INSERT INTO menu (id, topname, name, url) VALUES ('58', '정산관리', '서버 이용료 요약', '/brandi/excclc/serverFee_list');
INSERT INTO menu (id, topname, name, url) VALUES ('59', '정산관리', '셀러별 서버이용료', '/brandi/excclcResult/serverFeeResult_list');
INSERT INTO menu (id, topname, name, url) VALUES ('60', '정산관리', '상품수수료', '/brandi/productFeeGroup/productFeeGroup_list');
INSERT INTO menu (id, topname, name, url) VALUES ('61', '정산관리', '판매자수수료할인', '/brandi/mdFeeGroup/mdFeeGroup_list');
INSERT INTO menu (id, topname, name, url) VALUES ('62', '정산관리', '기본수수료관리', '/brandi/mdBasisFee/mdBasisFee_list');
INSERT INTO menu (id, topname, name, url) VALUES ('63', '정산관리', '헬피수수료관리', '/brandi/partnerFeeGroup/partnerFeeGrouplist');
INSERT INTO menu (id, topname, name, url) VALUES ('64', '정산관리', '광고수수료관리', '/settlement/fee/advFee');
INSERT INTO menu (id, topname, name, url) VALUES ('65', '정산관리', '서버비 면제 대상', '/brandi/serverRntfee');
INSERT INTO menu (id, topname, name, url) VALUES ('66', '정산관리', '정산제외대상', '/brandi/excclcExclusion/excclcExclusionList');
INSERT INTO menu (id, topname, name, url) VALUES ('67', '정산관리', '판매회원등급관리', '/brandi/mdGrade/mdGrade_list');
INSERT INTO menu (id, topname, name, url) VALUES ('68', '진열관리', '', 'icon-eye');
INSERT INTO menu (id, topname, name, url) VALUES ('69', '진열관리', '(iOS) 홈 - 홈 탭 진열관리', '/brandi/exhibition/homeTabExhibition/iOS');
INSERT INTO menu (id, topname, name, url) VALUES ('70', '진열관리', '(AOS) 홈 - 홈 탭 진열관리', '/brandi/exhibition/homeTabExhibition/AOS');
INSERT INTO menu (id, topname, name, url) VALUES ('71', '진열관리', '홈 - 베스트 탭 진열관리', '/brandi/exhibition/bestTabExhibition');
INSERT INTO menu (id, topname, name, url) VALUES ('72', '진열관리', '(iOS) 홈 - 쇼핑몰·마켓 탭 진열관리', '/brandi/exhibition/trendTabExhibition/iOS');
INSERT INTO menu (id, topname, name, url) VALUES ('73', '진열관리', '(AOS) 홈 - 쇼핑몰·마켓 탭 진열관리', '/brandi/exhibition/trendTabExhibition/AOS');
INSERT INTO menu (id, topname, name, url) VALUES ('74', '진열관리', '홈 - 브랜드 탭 진열관리', '/brandi/exhibition/brandTabExhibition');
INSERT INTO menu (id, topname, name, url) VALUES ('75', '진열관리', '홈 - 뷰티 탭 진열관리', '/brandi/exhibition/beautyTabExhibition');
INSERT INTO menu (id, topname, name, url) VALUES ('76', '진열관리', '홈 - 특가 탭 진열관리', '/brandi/cproduct/spclpc');
INSERT INTO menu (id, topname, name, url) VALUES ('77', '진열관리', '카테고리 진열관리', '/brandi/exhibition/categoryExhibition');
INSERT INTO menu (id, topname, name, url) VALUES ('78', '진열관리', '스토어 진열 관리', '/brandi/seller/market_exhbi_mngr');
INSERT INTO menu (id, topname, name, url) VALUES ('79', '진열관리', '스플래시 이미지 관리', '/brandi/image_control');
INSERT INTO menu (id, topname, name, url) VALUES ('80', '진열관리', '스토어 상세 진열 관리', '/brandi/seller/market_detail_exhbi_mngr');
INSERT INTO menu (id, topname, name, url) VALUES ('81', '진열관리', '배너 관리', '/brandi/design/commerceBannerControl');
INSERT INTO menu (id, topname, name, url) VALUES ('82', '기획전/쿠폰관리', '', 'icon-present');
INSERT INTO menu (id, topname, name, url) VALUES ('83', '기획전/쿠폰관리', '기획전 관리', '/brandi/events');
INSERT INTO menu (id, topname, name, url) VALUES ('84', '기획전/쿠폰관리', '기획전 댓글 관리', '/brandi/events/event_answer_list');
INSERT INTO menu (id, topname, name, url) VALUES ('85', '기획전/쿠폰관리', '포인트 관리', '/brandi/coupon/coupon_list');
INSERT INTO menu (id, topname, name, url) VALUES ('86', '기획전/쿠폰관리', '쿠폰 관리', '/brandi/coupon/prduct_coupon_list');
INSERT INTO menu (id, topname, name, url) VALUES ('87', '기획전/쿠폰관리', '포인트 일괄 지급', '/brandi/coupon/pointProcess');
INSERT INTO menu (id, topname, name, url) VALUES ('88', '푸시', '', 'icon-bell');
INSERT INTO menu (id, topname, name, url) VALUES ('89', '푸시', '푸시 발송', '/brandi/push');
INSERT INTO menu (id, topname, name, url) VALUES ('90', '푸시', '푸시 메시지 목록', '/brandi/push/message');
INSERT INTO menu (id, topname, name, url) VALUES ('91', '회원관리', '', 'icon-user');
INSERT INTO menu (id, topname, name, url) VALUES ('92', '회원관리', '회원 관리_커뮤니티', '/brandi/member');
INSERT INTO menu (id, topname, name, url) VALUES ('93', '회원관리', '회원 관리_커머스', '/brandi/member/commerce_member');
INSERT INTO menu (id, topname, name, url) VALUES ('94', '회원관리', '회원 그룹 관리', '/brandi/member/group');
INSERT INTO menu (id, topname, name, url) VALUES ('95', '회원관리', '셀러 정보 관리', '/brandi/seller/seller_my_page');
INSERT INTO menu (id, topname, name, url) VALUES ('96', '회원관리', '페널티 셀러 관리', '/brandi/sellerPenalty/penaltyList');
INSERT INTO menu (id, topname, name, url) VALUES ('97', '회원관리', '회원 탈퇴 관리', '/brandi/member/delete');
INSERT INTO menu (id, topname, name, url) VALUES ('98', '회원관리', '셀러 계정 관리', '/brandi/account');
INSERT INTO menu (id, topname, name, url) VALUES ('99', '회원관리', '도매처 관리', '/brandi/wholesale');
INSERT INTO menu (id, topname, name, url) VALUES ('100', '기타', '', 'icon-equalizer');
INSERT INTO menu (id, topname, name, url) VALUES ('101', '기타', '단축 URL 공유', '/brandi/shorten');
INSERT INTO menu (id, topname, name, url) VALUES ('102', '기타', '서비스 로그 목록', '/brandi/service_log');
INSERT INTO menu (id, topname, name, url) VALUES ('103', '기타', '공휴일 관리', '/brandi/holiday');
INSERT INTO menu (id, topname, name, url) VALUES ('104', '기타', '메뉴 권한 관리', '/brandi/authorGroup');
INSERT INTO menu (id, topname, name, url) VALUES ('105', '기타', '브랜디 계정 관리', '/brandi/masterAccount');
INSERT INTO menu (id, topname, name, url) VALUES ('106', '기타', '관리 도구', '/brandi/manageTool');
INSERT INTO menu (id, topname, name, url) VALUES ('107', '이전 버전 관리', '', 'icon-settings');
INSERT INTO menu (id, topname, name, url) VALUES ('108', '이전 버전 관리', '스토리관리', '/brandi/story');
INSERT INTO menu (id, topname, name, url) VALUES ('109', '이전 버전 관리', '브랜드 관리', '/brandi/brand');
INSERT INTO menu (id, topname, name, url) VALUES ('110', '이전 버전 관리', '브랜드 신청 관리', '/brandi/brand_recommend');
INSERT INTO menu (id, topname, name, url) VALUES ('111', '이전 버전 관리', '아이템 관리', '/brandi/media');
INSERT INTO menu (id, topname, name, url) VALUES ('112', '이전 버전 관리', '신고 아이템 관리', '/brandi/media/statement_list');
INSERT INTO menu (id, topname, name, url) VALUES ('113', '이전 버전 관리', '댓글 관리', '/brandi/media/answer');
INSERT INTO menu (id, topname, name, url) VALUES ('114', '이전 버전 관리', '접속', '/brandi/statistics/access');
INSERT INTO menu (id, topname, name, url) VALUES ('115', '이전 버전 관리', '카테고리 관리', '/brandi/category');

-- auth_groups Table Create SQL
CREATE TABLE auth_groups
(
    `id`           BIGINT         NOT NULL    AUTO_INCREMENT    COMMENT 'id', 
    `accounts_id`  BIGINT         NULL                          COMMENT '계정테이블_id FK', 
    `name`         VARCHAR(45)    NULL                          COMMENT '권한그룹명', 
    `is_used`      TINYINT        NULL                          COMMENT '사용여부', 
    `created_at`   DATETIME       NULL                          COMMENT '생성시간', 
    `updated_at`   DATETIME       NULL                          COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '권한그룹 테이블';

ALTER TABLE auth_groups
    ADD CONSTRAINT FK_auth_groups_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

INSERT INTO auth_groups (id, accounts_id, name, is_used) VALUES ('1', '1', '마스터 권한', TRUE);
INSERT INTO auth_groups (id, accounts_id, name, is_used) VALUES ('2', '1', '셀러 입점', TRUE);
INSERT INTO auth_groups (id, accounts_id, name, is_used) VALUES ('3', '1', '셀러 휴점,퇴점 대기', TRUE);


-- auth_groups_menu Table Create SQL
CREATE TABLE auth_groups_menu
(
    `id`              BIGINT      NOT NULL    AUTO_INCREMENT    COMMENT 'id', 
    `auth_groups_id`  BIGINT      NULL                          COMMENT '권한그룹_id FK', 
    `authorities_id`  BIGINT      NULL                          COMMENT '권한테이블_id FK', 
    `menu_id`         BIGINT      NULL                          COMMENT '메뉴테이블_id FK', 
    `can_read`        TINYINT     NULL                          COMMENT '읽기권한', 
    `can_write`       TINYINT     NULL                          COMMENT '쓰기권한', 
    `is_used`         TINYINT     NOT NULL                      COMMENT '사용여부', 
    `created_at`      DATETIME    NULL                          COMMENT '생성시간', 
    `updated_at`      DATETIME    NULL                          COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '권한그룹_메뉴 테이블';

ALTER TABLE auth_groups_menu
    ADD CONSTRAINT FK_auth_groups_menu_authorities_id FOREIGN KEY (authorities_id)
        REFERENCES authorities (id);

ALTER TABLE auth_groups_menu
    ADD CONSTRAINT FK_auth_groups_menu_menu_id FOREIGN KEY (menu_id)
        REFERENCES menu (id);

ALTER TABLE auth_groups_menu
    ADD CONSTRAINT FK_auth_groups_menu_auth_groups_id FOREIGN KEY (auth_groups_id)
        REFERENCES auth_groups (id);


-- masters Table Create SQL 
CREATE TABLE masters
(
    `id`                   BIGINT          NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `accounts_id`          BIGINT          NULL                         COMMENT '계정테이블_id FK', 
    `auth_groups_id`       BIGINT          NULL                         COMMENT '권한그룹 테이블_id FK', 
    `account`              VARCHAR(20)     NOT NULL                     COMMENT '계정', 
    `password`             VARCHAR(300)    NOT NULL                     COMMENT '비밀번호', 
    `name_kr`              VARCHAR(45)     NOT NULL                     COMMENT '이름(한글)', 
    `name_en`              VARCHAR(45)     NOT NULL                     COMMENT '이름(영문)', 
    `is_used`              TINYINT         NOT NULL                     COMMENT '사용여부', 
    `created_at`           DATETIME        NULL                         COMMENT '생성시간', 
    `updated_at`           DATETIME        NULL                         COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '마스터 테이블';

ALTER TABLE masters
    ADD CONSTRAINT FK_masters_auth_groups_id FOREIGN KEY (auth_groups_id)
        REFERENCES auth_groups (id);

ALTER TABLE masters
    ADD CONSTRAINT FK_masters_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE masters
    ADD CONSTRAINT UC_account UNIQUE (account);


-- sellers_info Table Create SQL
CREATE TABLE sellers_info
(
    `id`                       BIGINT           NOT NULL    AUTO_INCREMENT  COMMENT 'id', 
    `accounts_id`              BIGINT           NULL                        COMMENT '계정테이블_id FK', 
    `profile_image`            VARCHAR(200)     NOT NULL                    COMMENT '셀러_프로필', 
    `ceo_name`                 VARCHAR(100)     NOT NULL                    COMMENT '대표자명', 
    `company_name`             VARCHAR(100)     NOT NULL                    COMMENT '사업자명', 
    `company_code`             VARCHAR(100)     NOT NULL                    COMMENT '사업자번호', 
    `company_certi_image`      VARCHAR(200)     NOT NULL                    COMMENT '사업자등록증', 
    `mail_order_code`          VARCHAR(100)     NOT NULL                    COMMENT '통신판매업번호', 
    `mail_order_image`         VARCHAR(200)     NOT NULL                    COMMENT '통신판매업신고필증', 
    `bg_image`                 VARCHAR(200)     NULL                        COMMENT '셀러페이지_배경이미지', 
    `single_line_intro`        VARCHAR(100)     NOT NULL                    COMMENT '셀러_한줄_소개', 
    `detailed_intro`           VARCHAR(2000)    NULL                        COMMENT '셀러_상세_소개', 
    `delivery_postal_code`     VARCHAR(100)     NOT NULL                    COMMENT '택배주소_우편번호', 
    `delivery_address_main`    VARCHAR(100)     NOT NULL                    COMMENT '택배주소_일반주소', 
    `delivery_address_detail`  VARCHAR(100)     NOT NULL                    COMMENT '택배주소_상세주소', 
    `cs_time_weekday_start`    DATETIME         NOT NULL                    COMMENT '고객센터_운영시간(주중)_시작', 
    `cs_time_weekday_end`      DATETIME         NOT NULL                    COMMENT '고객센터_운영시간(주중)_종료', 
    `cs_time_weekend_start`    DATETIME         NULL                        COMMENT '고객센터_운영시간(주말)_시작', 
    `cs_time_weekend_end`      DATETIME         NULL                        COMMENT '고객센터_운영시간(주말)_종료', 
    `bank_name`                VARCHAR(100)     NOT NULL                    COMMENT '정산정보_은행명', 
    `bank_depositor`           VARCHAR(100)     NOT NULL                    COMMENT '정산정보_예금자명', 
    `bank_account`             VARCHAR(100)     NOT NULL                    COMMENT '정산정보_계좌번호', 
    `shopping_info`            VARCHAR(1000)    NOT NULL                    COMMENT '배송정보', 
    `refund_info`              VARCHAR(1000)    NOT NULL                    COMMENT '교환/환불정보', 
    `brand_info`               VARCHAR(100)     NULL                        COMMENT '관리브랜드정보', 
    `model_height`             INT              NULL                        COMMENT '셀러모델_키', 
    `model_tops_size`          INT              NULL                        COMMENT '셀러모델_상의사이즈', 
    `model_bottom_size`        INT              NULL                        COMMENT '셀러모델_하의사이즈', 
    `model_foot_size`          INT              NULL                        COMMENT '셀러모델_발사이즈', 
    `shopping_message`         VARCHAR(1000)    NOT NULL                    COMMENT '쇼핑피드_업데이트_메세지', 
    `created_at`               DATETIME         NULL                        COMMENT '생성시간', 
    `updated_at`               DATETIME         NULL                        COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_정보 테이블';

ALTER TABLE sellers_info
    ADD CONSTRAINT FK_sellers_info_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE sellers_info
    ADD CONSTRAINT UC_company_code UNIQUE (company_code);

ALTER TABLE sellers_info
    ADD CONSTRAINT UC_mail_order_code UNIQUE (mail_order_code);

ALTER TABLE sellers_info
    ADD CONSTRAINT UC_bank_account UNIQUE (bank_account);


-- seller_status Table Create SQL
CREATE TABLE seller_status
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NULL                         COMMENT '셀러_상태_이름', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_상태 테이블';

INSERT INTO seller_status (id, name) VALUES (1, '입점대기');
INSERT INTO seller_status (id, name) VALUES (2, '입점');
INSERT INTO seller_status (id, name) VALUES (3, '휴점');
INSERT INTO seller_status (id, name) VALUES (4, '휴점대기');


-- tag_ages Table Create SQL
CREATE TABLE tag_ages
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NULL                         COMMENT '태그_연령대_이름', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '태그_연령대 테이블';

INSERT INTO tag_ages (id, name) VALUES (1, '10대');
INSERT INTO tag_ages (id, name) VALUES (2, '20대 초반');
INSERT INTO tag_ages (id, name) VALUES (3, '20대 중반');
INSERT INTO tag_ages (id, name) VALUES (4, '20대 후반');
INSERT INTO tag_ages (id, name) VALUES (5, '30대');
INSERT INTO tag_ages (id, name) VALUES (6, '연령선택안함');


-- tag_styles Table Create SQL
CREATE TABLE tag_styles
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NULL                         COMMENT '태그_스타일_이름', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '태그_스타일 테이블';

INSERT INTO tag_styles (id, name) VALUES (1, '심플베이직');
INSERT INTO tag_styles (id, name) VALUES (2, '러블리');
INSERT INTO tag_styles (id, name) VALUES (3, '페미닌');
INSERT INTO tag_styles (id, name) VALUES (4, '캐주얼');
INSERT INTO tag_styles (id, name) VALUES (5, '섹시글램');
INSERT INTO tag_styles (id, name) VALUES (6, '스타일선택안함');


-- seller_types Table Create SQL
CREATE TABLE seller_types
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NULL                         COMMENT '셀러_정보_이름', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_타입 테이블';

INSERT INTO seller_types (id, name) VALUES (1, '쇼핑몰');
INSERT INTO seller_types (id, name) VALUES (2, '마켓');
INSERT INTO seller_types (id, name) VALUES (3, '로드샵');
INSERT INTO seller_types (id, name) VALUES (4, '디자이너브랜드');
INSERT INTO seller_types (id, name) VALUES (5, '제너럴브랜드');
INSERT INTO seller_types (id, name) VALUES (6, '내셔널브랜드');
INSERT INTO seller_types (id, name) VALUES (7, '뷰티');


-- fees Table Create SQL
CREATE TABLE fees
(
    `id`    BIGINT         NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `name`  VARCHAR(45)    NOT NULL                     COMMENT '수수료이름', 
    `fee`   INT            NOT NULL                     COMMENT '수수료', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '수수료 테이블';

ALTER TABLE fees
    ADD CONSTRAINT UC_name UNIQUE (name);

INSERT INTO fees (id, name, fee) VALUES (1, 'A안', 13);
INSERT INTO fees (id, name, fee) VALUES (2, 'C안', 15);
INSERT INTO fees (id, name, fee) VALUES (3, 'E안', 13);


-- sellers Table Create SQL
CREATE TABLE sellers
(
    `id`                   BIGINT          NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `accounts_id`          BIGINT          NULL                         COMMENT '계정테이블_id FK', 
    `auth_groups_id`       BIGINT          NULL                         COMMENT '권한그룹 테이블_id FK', 
    `seller_types_id`      BIGINT          NULL                         COMMENT '셀러_타입테이블_id FK', 
    `seller_status_id`     BIGINT          NULL                         COMMENT '셀러_상태테이블_id FK', 
    `seller_info_id`       BIGINT          NULL                         COMMENT '셀러_정보테이블_id FK', 
    `fees_id`              BIGINT          NULL                         COMMENT '수수료테이블_id FK', 
    `tag_ages_id`          BIGINT          NULL                         COMMENT '태그_연령대테이블_id FK', 
    `tag_styles_id`        BIGINT          NULL                         COMMENT '태그_스타일테이블_id FK', 
    `account`              VARCHAR(20)     NOT NULL                     COMMENT '계정', 
    `password`             VARCHAR(300)    NOT NULL                     COMMENT '비밀번호', 
    `name_kr`              VARCHAR(45)     NOT NULL                     COMMENT '이름(한글)', 
    `name_en`              VARCHAR(45)     NOT NULL                     COMMENT '이름(영문)', 
    `mobile_number`        VARCHAR(11)     NOT NULL                     COMMENT '담당자_핸드폰번호', 
    `cs_phone_number`      VARCHAR(11)     NOT NULL                     COMMENT '고객센터_전화번호', 
    `site_url`             VARCHAR(100)    NOT NULL                     COMMENT '사이트_URL', 
    `instagram_account`    VARCHAR(45)     NULL                         COMMENT '인스타그램_아이디', 
    `cs_kakao_account`     VARCHAR(45)     NULL                         COMMENT '카카오톡_아이디', 
    `cs_yellow_account`    VARCHAR(45)     NULL                         COMMENT '옐로우_아이디', 
    `tag_etc`              VARCHAR(45)     NULL                         COMMENT '태그_기타', 
    `is_used`              TINYINT         NOT NULL                     COMMENT '사용유무', 
    `created_at`           DATETIME        NULL                         COMMENT '생성시간', 
    `updated_at`           DATETIME        NULL                         COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러 테이블';

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_seller_types_id FOREIGN KEY (seller_types_id)
        REFERENCES seller_types (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_seller_status_id FOREIGN KEY (seller_status_id)
        REFERENCES seller_status (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_fees_id FOREIGN KEY (fees_id)
        REFERENCES fees (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_tag_ages_id FOREIGN KEY (tag_ages_id)
        REFERENCES tag_ages (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_tag_styles_id FOREIGN KEY (tag_styles_id)
        REFERENCES tag_styles (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_sellers_info_id FOREIGN KEY (seller_info_id)
        REFERENCES sellers_info (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_auth_groups_id FOREIGN KEY (auth_groups_id)
        REFERENCES auth_groups (id);

ALTER TABLE sellers
    ADD CONSTRAINT FK_sellers_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE sellers
    ADD CONSTRAINT UC_seller_info_id UNIQUE (seller_info_id);

ALTER TABLE sellers
    ADD CONSTRAINT UC_account UNIQUE (account);

ALTER TABLE sellers
    ADD CONSTRAINT UC_mobile_number UNIQUE (mobile_number);

ALTER TABLE sellers
    ADD CONSTRAINT UC_cs_phone_number UNIQUE (cs_phone_number);

ALTER TABLE sellers
    ADD CONSTRAINT UC_site_url UNIQUE (site_url);


-- seller_representative Table Create SQL
CREATE TABLE seller_representative
(
    `id`             BIGINT         NOT NULL    AUTO_INCREMENT  COMMENT 'id', 
    `sellers_id`     BIGINT         NULL                        COMMENT '셀러테이블_id FK', 
    `name`           VARCHAR(45)    NULL                        COMMENT '담당자명', 
    `mobile_number`  VARCHAR(11)    NULL                        COMMENT '담당자_핸드폰번호', 
    `email`          VARCHAR(45)    NULL                        COMMENT '담당자_이메일', 
    `is_used`        TINYINT        NOT NULL                    COMMENT '사용여부', 
    `created_at`     DATETIME       NULL                        COMMENT '생성시간', 
    `updated_at`     DATETIME       NULL                        COMMENT '수정된시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_담당자 테이블';

ALTER TABLE seller_representative
    ADD CONSTRAINT FK_seller_representative_sellers_id FOREIGN KEY (sellers_id)
        REFERENCES sellers (id);

ALTER TABLE seller_representative
    ADD CONSTRAINT UC_email UNIQUE (email);


-- seller_status_logs Table Create SQL
CREATE TABLE seller_status_logs
(
    `id`           BIGINT         NOT NULL    AUTO_INCREMENT    COMMENT 'id', 
    `accounts_id`  BIGINT         NULL                          COMMENT '계정테이블_id FK', 
    `update_time`  VARCHAR(45)    NULL                          COMMENT '셀러상태_변경_적용일시', 
    `status`       VARCHAR(45)    NULL                          COMMENT '셀러_상태', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_상태_로그 테이블';

ALTER TABLE seller_status_logs
    ADD CONSTRAINT FK_seller_status_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);


-- sellers_info_snapshot Table Create SQL
CREATE TABLE sellers_info_snapshot
(
    `id`                       BIGINT           NOT NULL    AUTO_INCREMENT  COMMENT 'id', 
    `seller_info_id`           BIGINT           NULL                        COMMENT '셀러_정보테이블_id FK', 
    `accounts_id`              BIGINT           NULL                        COMMENT '계정테이블_id FK', 
    `profile_image`            VARCHAR(200)     NOT NULL                    COMMENT '셀러_프로필', 
    `ceo_name`                 VARCHAR(100)     NOT NULL                    COMMENT '대표자명', 
    `company_name`             VARCHAR(100)     NOT NULL                    COMMENT '사업자명', 
    `company_code`             VARCHAR(100)     NOT NULL                    COMMENT '사업자번호', 
    `company_certi_image`      VARCHAR(200)     NOT NULL                    COMMENT '사업자등록증', 
    `mail_order_code`          VARCHAR(100)     NOT NULL                    COMMENT '통신판매업번호', 
    `mail_order_image`         VARCHAR(200)     NOT NULL                    COMMENT '통신판매업신고필증', 
    `bg_image`                 VARCHAR(200)     NULL                        COMMENT '셀러페이지_배경이미지', 
    `single_line_intro`        VARCHAR(100)     NOT NULL                    COMMENT '셀러_한줄_소개', 
    `detailed_intro`           VARCHAR(2000)    NULL                        COMMENT '셀러_상세_소개', 
    `delivery_postal_code`     VARCHAR(100)     NOT NULL                    COMMENT '택배주소_우편번호', 
    `delivery_address_main`    VARCHAR(100)     NOT NULL                    COMMENT '택배주소_일반주소', 
    `delivery_address_detail`  VARCHAR(100)     NOT NULL                    COMMENT '택배주소_상세주소', 
    `cs_time_weekday_start`    DATETIME         NOT NULL                    COMMENT '고객센터_운영시간(주중)_시작', 
    `cs_time_weekday_end`      DATETIME         NOT NULL                    COMMENT '고객센터_운영시간(주중)_종료', 
    `cs_time_weekend_start`    DATETIME         NULL                        COMMENT '고객센터_운영시간(주말)_시작', 
    `cs_time_weekend_end`      DATETIME         NULL                        COMMENT '고객센터_운영시간(주말)_종료', 
    `bank_name`                VARCHAR(100)     NOT NULL                    COMMENT '정산정보_은행명', 
    `bank_depositor`           VARCHAR(100)     NOT NULL                    COMMENT '정산정보_예금자명', 
    `bank_account`             VARCHAR(100)     NOT NULL                    COMMENT '정산정보_계좌번호', 
    `shopping_info`            VARCHAR(1000)    NOT NULL                    COMMENT '배송정보', 
    `refund_info`              VARCHAR(1000)    NOT NULL                    COMMENT '교환환불정보', 
    `brand_info`               VARCHAR(100)     NULL                        COMMENT '관리브랜드정보', 
    `model_height`             INT              NULL                        COMMENT '셀러모델_키', 
    `model_tops_size`          INT              NULL                        COMMENT '셀러모델_상의사이즈', 
    `model_bottom_size`        INT              NULL                        COMMENT '셀러모델_하의사이즈', 
    `model_foot_size`          INT              NULL                        COMMENT '셀러모델_발사이즈', 
    `shopping_message`         VARCHAR(1000)    NOT NULL                    COMMENT '쇼핑피드_업데이트_메세지', 
    `created_at`               DATETIME         NULL                        COMMENT '생성시간', 
    `updated_at`               DATETIME         NULL                        COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_정보_스냅샷 테이블';

ALTER TABLE sellers_info_snapshot
    ADD CONSTRAINT FK_sellers_info_snapshot_sellers_info_id FOREIGN KEY (seller_info_id)
        REFERENCES sellers_info (id);

ALTER TABLE sellers_info_snapshot
    ADD CONSTRAINT FK_sellers_info_snapshot_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE sellers_info_snapshot
    ADD CONSTRAINT UC_company_name UNIQUE (company_name);

ALTER TABLE sellers_info_snapshot
    ADD CONSTRAINT UC_company_certi_image UNIQUE (company_certi_image);

ALTER TABLE sellers_info_snapshot
    ADD CONSTRAINT UC_bank_account UNIQUE (bank_account);


-- masters_snapshot Table Create SQL
CREATE TABLE masters_snapshot
(
    `id`                   BIGINT          NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `accounts_id`          BIGINT          NULL                         COMMENT '계정테이블_id FK', 
    `auth_groups_id`       BIGINT          NULL                         COMMENT '권한그룹 테이블_id FK', 
    `account`              VARCHAR(20)     NOT NULL                     COMMENT '계정', 
    `password`             VARCHAR(300)    NOT NULL                     COMMENT '비밀번호', 
    `name_kr`              VARCHAR(45)     NOT NULL                     COMMENT '이름(한글)', 
    `name_en`              VARCHAR(45)     NOT NULL                     COMMENT '이름(영문)', 
    `is_used`              TINYINT         NOT NULL                     COMMENT '사용여부', 
    `created_at`           DATETIME        NULL                         COMMENT '생성시간', 
    `updated_at`           DATETIME        NULL                         COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '마스터 테이블_스냅샷';

ALTER TABLE masters_snapshot
    ADD CONSTRAINT FK_masters_snapshot_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE masters_snapshot
    ADD CONSTRAINT FK_masters_snapshot_auth_groups_id FOREIGN KEY (auth_groups_id)
        REFERENCES auth_groups (id);

ALTER TABLE masters_snapshot
    ADD CONSTRAINT UC_account UNIQUE (account);


-- sellers_snapshot Table Create SQL
CREATE TABLE sellers_snapshot
(
    `id`                   BIGINT          NOT NULL    AUTO_INCREMENT   COMMENT 'id', 
    `accounts_id`          BIGINT          NULL                         COMMENT '계정테이블_id FK', 
    `auth_groups_id`       BIGINT          NULL                         COMMENT '권한그룹 테이블_id FK', 
    `seller_types_id`      BIGINT          NULL                         COMMENT '셀러_타입테이블_id FK', 
    `seller_status_id`     BIGINT          NULL                         COMMENT '셀러_상태테이블_id FK', 
    `seller_info_id`       BIGINT          NULL                         COMMENT '셀러_정보테이블_id FK', 
    `fees_id`              BIGINT          NULL                         COMMENT '수수료테이블_id FK', 
    `tag_ages_id`          BIGINT          NULL                         COMMENT '태그_연령대테이블_id FK', 
    `tag_styles_id`        BIGINT          NULL                         COMMENT '태그_스타일테이블_id FK', 
    `account`              VARCHAR(20)     NOT NULL                     COMMENT '계정', 
    `password`             VARCHAR(300)    NOT NULL                     COMMENT '비밀번호', 
    `name_kr`              VARCHAR(45)     NOT NULL                     COMMENT '이름(한글)', 
    `name_en`              VARCHAR(45)     NOT NULL                     COMMENT '이름(영문)', 
    `mobile_number`        VARCHAR(11)     NOT NULL                     COMMENT '담당자_핸드폰번호', 
    `cs_phone_number`      VARCHAR(11)     NOT NULL                     COMMENT '고객센터_전화번호', 
    `site_url`             VARCHAR(100)    NOT NULL                     COMMENT '사이트_URL', 
    `instagram_account`    VARCHAR(45)     NULL                         COMMENT '인스타그램_아이디', 
    `cs_kakao_account`     VARCHAR(45)     NULL                         COMMENT '카카오톡_아이디', 
    `cs_yellow_account`    VARCHAR(45)     NULL                         COMMENT '옐로우_아이디', 
    `tag_etc`              VARCHAR(45)     NULL                         COMMENT '태그_기타', 
    `is_used`              TINYINT         NOT NULL                     COMMENT '사용유무', 
    `created_at`           DATETIME        NULL                         COMMENT '생성시간', 
    `updated_at`           DATETIME        NULL                         COMMENT '수정시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러 테이블_스냅샷';

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_accounts_id FOREIGN KEY (accounts_id)
        REFERENCES accounts (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_auth_groups_id FOREIGN KEY (auth_groups_id)
        REFERENCES auth_groups (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_seller_types_id FOREIGN KEY (seller_types_id)
        REFERENCES seller_types (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_seller_status_id FOREIGN KEY (seller_status_id)
        REFERENCES seller_status (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_fees_id FOREIGN KEY (fees_id)
        REFERENCES fees (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_tag_ages_id FOREIGN KEY (tag_ages_id)
        REFERENCES tag_ages (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_tag_styles_id_tag_styles_id FOREIGN KEY (tag_styles_id)
        REFERENCES tag_styles (id) ;

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT FK_sellers_snapshot_sellers_info_id FOREIGN KEY (seller_info_id)
        REFERENCES sellers_info (id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT UC_seller_info_id UNIQUE (seller_info_id);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT UC_account UNIQUE (account);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT UC_mobile_number UNIQUE (mobile_number);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT UC_cs_phone_number UNIQUE (cs_phone_number);

ALTER TABLE sellers_snapshot
    ADD CONSTRAINT UC_site_url UNIQUE (site_url);