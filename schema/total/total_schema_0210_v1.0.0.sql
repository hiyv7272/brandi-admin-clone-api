
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
    `created_at`      DATETIME        NULL                          COMMENT '생성시간', 
    `updated_at`      DATETIME        NULL                          COMMENT '수정시간', 
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

-- 마스터권한_메뉴 데이터 INSERT
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('1', '1', '1', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('2', '1', '2', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('3', '1', '3', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('4', '1', '4', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('5', '1', '5', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('6', '1', '6', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('7', '1', '7', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('8', '1', '8', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('9', '1', '9', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('10', '1', '10', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('11', '1', '11', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('12', '1', '12', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('13', '1', '13', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('14', '1', '14', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('15', '1', '15', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('16', '1', '16', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('17', '1', '17', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('18', '1', '18', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('19', '1', '19', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('20', '1', '20', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('21', '1', '21', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('22', '1', '22', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('23', '1', '23', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('24', '1', '24', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('25', '1', '25', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('26', '1', '26', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('27', '1', '27', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('28', '1', '28', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('29', '1', '29', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('30', '1', '30', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('31', '1', '31', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('32', '1', '32', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('33', '1', '33', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('34', '1', '34', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('35', '1', '35', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('36', '1', '36', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('37', '1', '37', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('38', '1', '38', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('39', '1', '39', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('40', '1', '40', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('41', '1', '41', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('42', '1', '42', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('43', '1', '43', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('44', '1', '44', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('45', '1', '45', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('46', '1', '46', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('47', '1', '47', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('48', '1', '48', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('49', '1', '49', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('50', '1', '50', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('51', '1', '51', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('52', '1', '52', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('53', '1', '53', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('54', '1', '54', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('55', '1', '55', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('56', '1', '56', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('57', '1', '57', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('58', '1', '58', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('59', '1', '59', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('60', '1', '60', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('61', '1', '61', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('62', '1', '62', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('63', '1', '63', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('64', '1', '64', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('65', '1', '65', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('66', '1', '66', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('67', '1', '67', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('68', '1', '68', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('69', '1', '69', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('70', '1', '70', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('71', '1', '71', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('72', '1', '72', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('73', '1', '73', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('74', '1', '74', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('75', '1', '75', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('76', '1', '76', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('77', '1', '77', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('78', '1', '78', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('79', '1', '79', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('80', '1', '80', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('81', '1', '81', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('82', '1', '82', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('83', '1', '83', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('84', '1', '84', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('85', '1', '85', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('86', '1', '86', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('87', '1', '87', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('88', '1', '88', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('89', '1', '89', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('90', '1', '90', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('91', '1', '91', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('92', '1', '92', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('93', '1', '93', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('94', '1', '94', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('95', '1', '95', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('96', '1', '96', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('97', '1', '97', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('98', '1', '98', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('99', '1', '99', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('100', '1', '100', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('101', '1', '101', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('102', '1', '102', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('103', '1', '103', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('104', '1', '104', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('105', '1', '105', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('106', '1', '106', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('107', '1', '107', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('108', '1', '108', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('109', '1', '109', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('110', '1', '110', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('111', '1', '111', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('112', '1', '112', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('113', '1', '113', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('114', '1', '114', '1', TRUE, TRUE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('115', '1', '115', '1', TRUE, TRUE, TRUE);

-- 셀러 입점_메뉴 데이터 INSERT INTO
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('116', '2', '1', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('117', '2', '2', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('118', '2', '3', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('119', '2', '4', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('120', '2', '10', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('121', '2', '11', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('122', '2', '12', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('123', '2', '13', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('124', '2', '14', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('125', '2', '17', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('126', '2', '18', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('127', '2', '19', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('128', '2', '20', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('129', '2', '21', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('130', '2', '22', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('131', '2', '29', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('132', '2', '30', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('133', '2', '31', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('134', '2', '32', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('135', '2', '33', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('136', '2', '34', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('137', '2', '35', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('138', '2', '36', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('139', '2', '37', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('140', '2', '39', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('141', '2', '40', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('142', '2', '44', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('143', '2', '47', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('144', '2', '48', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('145', '2', '49', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('146', '2', '51', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('147', '2', '52', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('148', '2', '54', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('149', '2', '56', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('150', '2', '57', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('151', '2', '59', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('152', '2', '68', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('153', '2', '78', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('154', '2', '91', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('155', '2', '95', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('156', '2', '96', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('157', '2', '99', '2', TRUE, FALSE, TRUE);


-- 셀러 휴점,퇴점 대기_메뉴 데이터 INSERT INTO
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('158', '3', '1', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('159', '3', '2', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('160', '3', '3', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('161', '3', '4', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('162', '3', '10', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('163', '3', '11', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('164', '3', '12', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('165', '3', '13', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('166', '3', '14', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('167', '3', '17', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('168', '3', '18', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('169', '3', '19', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('170', '3', '20', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('171', '3', '21', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('172', '3', '22', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('173', '3', '29', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('174', '3', '30', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('175', '3', '31', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('176', '3', '32', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('177', '3', '33', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('178', '3', '34', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('179', '3', '35', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('180', '3', '36', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('181', '3', '37', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('182', '3', '39', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('183', '3', '40', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('184', '3', '44', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('185', '3', '47', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('186', '3', '48', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('187', '3', '49', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('188', '3', '51', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('189', '3', '52', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('190', '3', '54', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('191', '3', '56', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('192', '3', '57', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('193', '3', '59', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('194', '3', '68', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('195', '3', '78', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('196', '3', '91', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('197', '3', '95', '2', TRUE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('198', '3', '96', '2', FALSE, FALSE, TRUE);
INSERT INTO auth_groups_menu (id, auth_groups_id, menu_id, authorities_id, can_read, can_write, is_used) VALUES ('199', '3', '99', '2', FALSE, FALSE, TRUE);

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

-- product schema
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
);   

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
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT products_first_categories_id_fkey FOREIGN KEY (first_categories_id) REFERENCES first_categories(id),
    CONSTRAINT products_second_categories_id_fkey FOREIGN KEY (second_categories_id) REFERENCES second_categories(id),
    CONSTRAINT products_information_notices_id_fkey FOREIGN KEY (information_notices_id) REFERENCES information_notices(id),
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
    NULL, -- updated_at
    NULL, -- creator_id
    NULL -- changer_id
);
