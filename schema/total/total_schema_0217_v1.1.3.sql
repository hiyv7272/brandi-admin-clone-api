
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
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('2', '2', 'seller1', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('3', '2', 'seller2', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('4', '2', 'seller3', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('5', '2', 'seller4', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('6', '2', 'seller5', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('7', '2', 'seller6', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('8', '2', 'seller7', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('9', '2', 'seller8', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('10', '2', 'seller9', '1234');
INSERT INTO accounts (id, authorities_id, account, password) VALUES ('11', '2', 'seller10', '1234');

-- menu Table Create SQL 
CREATE TABLE menu
(
    `id`          BIGINT          NOT NULL    AUTO_INCREMENT    COMMENT 'id', 
    `topmenu_id`  BIGINT          NULL                          COMMENT '상위메뉴_id', 
    `depth`       INT             NULL                          COMMENT '컴럼깊이', 
    `have_child`  TINYINT         NULL                          COMMENT '자식유무',
    `topmenu`     VARCHAR(45)     NULL                          COMMENT '상위메뉴',  
    `name`        VARCHAR(45)     NULL                          COMMENT '메뉴이름', 
    `url`         VARCHAR(100)    NULL                          COMMENT '메뉴url', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '메뉴 테이블';

ALTER TABLE menu
    ADD CONSTRAINT FK_menu_topmenu_id_menu_id FOREIGN KEY (topmenu_id)
        REFERENCES menu (id);
        
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('1', '1', '0', '1', '공지사항','', 'icon-speech');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('2', '1', '1', '0', '공지사항','브랜디 공지', '/brandi/notice/notice_lists');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('3', '1', '1', '0', '공지사항','기획전 상품 신청', '/brandi/events/join');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('4', '4', '0', '1', '통계','', 'icon-bar-chart');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('5', '4', '1', '0', '통계','시간단위분석', '/brandi/statistics/per_time');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('6', '4', '1', '0', '통계','KPI_커머스', '/brandi/cstatistics/kpi');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('7', '4', '1', '0', '통계','KPI_커뮤니티', '/brandi/statistics/kpi');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('8', '4', '1', '0', '통계','리텐션', '/brandi/statistics/retention');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('9', '4', '1', '0', '통계','판매분석(상품)', '/brandi/cstatistics/salesAnalysisProduct');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('10', '4', '1', '0', '통계','판매분석(셀러)', '/brandi/cstatistics/salesAnalysisSeller');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('11', '4', '1', '0', '통계','추세분석(상품)', '/brandi/cstatistics/trendAnalysisProduct');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('12', '4', '1', '0', '통계','추세분석(셀러)', '/brandi/cstatistics/trendAnalysisSeller');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('13', '13', '0', '1', '주문관리','', 'icon-basket-loaded');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('14', '13', '1', '0', '주문관리','전체주문 관리', '/brandi/order/masterAllOrderList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('15', '13', '1', '0', '주문관리','결제대기관리', '/brandi/order/masterPaymentWatingList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('16', '13', '1', '0', '주문관리','결제완료관리', '/brandi/order/masterPaymentCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('17', '13', '1', '0', '주문관리','상품준비관리', '/brandi/order/masterProductPrepareList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('18', '13', '1', '0', '주문관리','배송준비관리', '/brandi/order/masterDeliveryPrepareList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('19', '13', '1', '0', '주문관리','배송중관리', '/brandi/order/masterDeliveryList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('20', '13', '1', '0', '주문관리','배송완료관리', '/brandi/order/masterDeliveryCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('21', '13', '1', '0', '주문관리','구매확정관리', '/brandi/order/masterOrderConfirmList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('22', '22', '0', '1', '취소/환불 관리','', 'icon-basket');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('23', '22', '1', '0', '취소/환불 관리','환불요청관리', '/brandi/refund_order/masterRefundRequestList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('24', '22', '1', '0', '취소/환불 관리','반품진행관리', '/brandi/refund_order/masterRefundGoodsList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('25', '22', '1', '0', '취소/환불 관리','환불승인중관리', '/brandi/refund_order/masterRefundConfirmList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('26', '22', '1', '0', '취소/환불 관리','환불완료관리', '/brandi/refund_order/masterRefundCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('27', '22', '1', '0', '취소/환불 관리','주문취소중관리', '/brandi/refund_order/masterCancelConfirmList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('28', '22', '1', '0', '취소/환불 관리','주문취소완료관리', '/brandi/refund_order/masterCancelCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('29', '22', '1', '0', '취소/환불 관리','환불요청관리', '/brandi/refund_order/sellerRefundRequestList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('30', '22', '1', '0', '취소/환불 관리','반품진행관리', '/brandi/refund_order/sellerRefundGoodsList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('31', '22', '1', '0', '취소/환불 관리','환불승인중관리', '/brandi/refund_order/sellerRefundConfirmList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('32', '22', '1', '0', '취소/환불 관리','환불완료관리', '/brandi/refund_order/sellerRefundCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('33', '22', '1', '0', '취소/환불 관리','주문취소중관리', '/brandi/refund_order/sellerCancelConfirmList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('34', '22', '1', '0', '취소/환불 관리','주문취소완료관리', '/brandi/refund_order/sellerCancelCompleteList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('35', '35', '0', '1', '상품관리','', 'icon-handbag');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('36', '35', '1', '0', '상품관리','상품 관리', '/product/management');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('37', '35', '1', '0', '상품관리','상품 등록', '/product/registration');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('38', '35', '1', '0', '상품관리','럭키투데이 관리', '/brandi/cproduct/luckyTodayList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('39', '35', '1', '0', '상품관리','연동상품관리', '/connecti/product');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('40', '35', '1', '0', '상품관리','연동상품 카테고리관리', '/connecti/category');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('41', '41', '0', '1', '외부채널연동상품 관리','', 'icon-share');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('42', '41', '1', '0', '외부채널연동상품 관리','연동상품관리', '/connecti/external');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('43', '41', '1', '0', '외부채널연동상품 관리','수동연동관리', '/connecti/external/manual');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('44', '44', '0', '1', '고객응대관리','', 'icon-emoticon-smile');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('45', '44', '1', '0', '고객응대관리','CRM 관리 (고객)', '/brandi/crm/customer');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('46', '44', '1', '0', '고객응대관리','CRM 관리 (셀러)', '/brandi/crm/seller');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('47', '44', '1', '0', '고객응대관리','Q&A 관리', '/brandi/inquiry/inquiry_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('48', '44', '1', '0', '고객응대관리','텍스트 리뷰', '/brandi/review/textReviewList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('49', '44', '1', '0', '고객응대관리','포토 리뷰', '/brandi/review/photoReviewList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('50', '44', '1', '0', '고객응대관리','인증번호 관리', '/brandi/certificationCode/certificationCodeDetail');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('51', '45', '0', '1', '정산관리','', 'icon-calculator');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('52', '45', '1', '0', '정산관리','정산 관리', '/brandi/calculate/calculate_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('53', '45', '1', '0', '정산관리','정산요약', '/brandi/excclcOrder');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('54', '45', '1', '0', '정산관리','셀러별 정산요약', '/brandi/excclcOrderResult');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('55', '45', '1', '0', '정산관리','판매수수료 요약', '/brandi/excclc/excclc_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('56', '45', '1', '0', '정산관리','셀러별 판매수수료', '/brandi/excclcResult/excclcResult_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('57', '45', '1', '0', '정산관리','주문별 판매수수료', '/brandi/excclcResultDetail/excclcResultDetail_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('58', '45', '1', '0', '정산관리','서버 이용료 요약', '/brandi/excclc/serverFee_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('59', '45', '1', '0', '정산관리','셀러별 서버이용료', '/brandi/excclcResult/serverFeeResult_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('60', '45', '1', '0', '정산관리','상품수수료', '/brandi/productFeeGroup/productFeeGroup_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('61', '45', '1', '0', '정산관리','판매자수수료할인', '/brandi/mdFeeGroup/mdFeeGroup_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('62', '45', '1', '0', '정산관리','기본수수료관리', '/brandi/mdBasisFee/mdBasisFee_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('63', '45', '1', '0', '정산관리','헬피수수료관리', '/brandi/partnerFeeGroup/partnerFeeGrouplist');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('64', '45', '1', '0', '정산관리','광고수수료관리', '/settlement/fee/advFee');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('65', '45', '1', '0', '정산관리','서버비 면제 대상', '/brandi/serverRntfee');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('66', '45', '1', '0', '정산관리','정산제외대상', '/brandi/excclcExclusion/excclcExclusionList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('67', '45', '1', '0', '정산관리','판매회원등급관리', '/brandi/mdGrade/mdGrade_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('68', '68', '0', '1', '진열관리','', 'icon-eye');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('69', '68', '1', '0', '진열관리','(iOS) 홈 - 홈 탭 진열관리', '/brandi/exhibition/homeTabExhibition/iOS');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('70', '68', '1', '0', '진열관리','(AOS) 홈 - 홈 탭 진열관리', '/brandi/exhibition/homeTabExhibition/AOS');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('71', '68', '1', '0', '진열관리','홈 - 베스트 탭 진열관리', '/brandi/exhibition/bestTabExhibition');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('72', '68', '1', '0', '진열관리','(iOS) 홈 - 쇼핑몰·마켓 탭 진열관리', '/brandi/exhibition/trendTabExhibition/iOS');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('73', '68', '1', '0', '진열관리','(AOS) 홈 - 쇼핑몰·마켓 탭 진열관리', '/brandi/exhibition/trendTabExhibition/AOS');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('74', '68', '1', '0', '진열관리','홈 - 브랜드 탭 진열관리', '/brandi/exhibition/brandTabExhibition');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('75', '68', '1', '0', '진열관리','홈 - 뷰티 탭 진열관리', '/brandi/exhibition/beautyTabExhibition');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('76', '68', '1', '0', '진열관리','홈 - 특가 탭 진열관리', '/brandi/cproduct/spclpc');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('77', '68', '1', '0', '진열관리','카테고리 진열관리', '/brandi/exhibition/categoryExhibition');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('78', '68', '1', '0', '진열관리','스토어 진열 관리', '/brandi/seller/market_exhbi_mngr');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('79', '68', '1', '0', '진열관리','스플래시 이미지 관리', '/brandi/image_control');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('80', '68', '1', '0', '진열관리','스토어 상세 진열 관리', '/brandi/seller/market_detail_exhbi_mngr');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('81', '68', '1', '0', '진열관리','배너 관리', '/brandi/design/commerceBannerControl');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('82', '82', '0', '1', '기획전/쿠폰관리','', 'icon-present');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('83', '82', '1', '0', '기획전/쿠폰관리','기획전 관리', '/brandi/events');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('84', '82', '1', '0', '기획전/쿠폰관리','기획전 댓글 관리', '/brandi/events/event_answer_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('85', '82', '1', '0', '기획전/쿠폰관리','포인트 관리', '/brandi/coupon/coupon_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('86', '82', '1', '0', '기획전/쿠폰관리','쿠폰 관리', '/brandi/coupon/prduct_coupon_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('87', '82', '1', '0', '기획전/쿠폰관리','포인트 일괄 지급', '/brandi/coupon/pointProcess');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('88', '88', '0', '1', '푸시','', 'icon-bell');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('89', '88', '1', '0', '푸시','푸시 발송', '/brandi/push');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('90', '88', '1', '0', '푸시','푸시 메시지 목록', '/brandi/push/message');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('91', '91', '0', '1', '회원관리','', 'icon-user');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('92', '91', '1', '0', '회원관리','회원 관리_커뮤니티', '/brandi/member');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('93', '91', '1', '0', '회원관리','회원 관리_커머스', '/brandi/member/commerce_member');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('94', '91', '1', '0', '회원관리','회원 그룹 관리', '/brandi/member/group');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('95', '91', '1', '0', '회원관리','셀러 정보 관리', '/seller/information');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('96', '91', '1', '0', '회원관리','페널티 셀러 관리', '/brandi/sellerPenalty/penaltyList');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('97', '91', '1', '0', '회원관리','회원 탈퇴 관리', '/brandi/member/delete');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('98', '91', '1', '0', '회원관리','셀러 계정 관리', '/seller/management');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('99', '91', '1', '0', '회원관리','도매처 관리', '/brandi/wholesale');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('100', '100', '0', '1', '기타','', 'icon-equalizer');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('101', '100', '1', '0', '기타','단축 URL 공유', '/brandi/shorten');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('102', '100', '1', '0', '기타','서비스 로그 목록', '/brandi/service_log');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('103', '100', '1', '0', '기타','공휴일 관리', '/brandi/holiday');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('104', '100', '1', '0', '기타','메뉴 권한 관리', '/brandi/authorGroup');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('105', '100', '1', '0', '기타','브랜디 계정 관리', '/brandi/masterAccount');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('106', '100', '1', '0', '기타','관리 도구', '/brandi/manageTool');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('107', '107', '0', '1', '이전 버전 관리','', 'icon-settings');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('108', '107', '1', '0', '이전 버전 관리','스토리관리', '/brandi/story');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('109', '107', '1', '0', '이전 버전 관리','브랜드 관리', '/brandi/brand');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('110', '107', '1', '0', '이전 버전 관리','브랜드 신청 관리', '/brandi/brand_recommend');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('111', '107', '1', '0', '이전 버전 관리','아이템 관리', '/brandi/media');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('112', '107', '1', '0', '이전 버전 관리','신고 아이템 관리', '/brandi/media/statement_list');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('113', '107', '1', '0', '이전 버전 관리','댓글 관리', '/brandi/media/answer');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('114', '107', '1', '0', '이전 버전 관리','접속', '/brandi/statistics/access');
INSERT INTO menu (id, topmenu_id, depth, have_child, topmenu, name, url) VALUES ('115', '107', '1', '0', '이전 버전 관리','카테고리 관리', '/brandi/category');

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
    `profile_image`            VARCHAR(200)     NULL                        COMMENT '셀러_프로필', 
    `ceo_name`                 VARCHAR(100)     NULL                        COMMENT '대표자명', 
    `company_name`             VARCHAR(100)     NULL                        COMMENT '사업자명', 
    `company_code`             VARCHAR(100)     NULL                        COMMENT '사업자번호', 
    `company_certi_image`      VARCHAR(200)     NULL                        COMMENT '사업자등록증', 
    `mail_order_code`          VARCHAR(100)     NULL                        COMMENT '통신판매업번호', 
    `mail_order_image`         VARCHAR(200)     NULL                        COMMENT '통신판매업신고필증', 
    `bg_image`                 VARCHAR(200)     NULL                        COMMENT '셀러페이지_배경이미지', 
    `single_line_intro`        VARCHAR(100)     NULL                        COMMENT '셀러_한줄_소개', 
    `detailed_intro`           VARCHAR(2000)    NULL                        COMMENT '셀러_상세_소개', 
    `shopping_info`            VARCHAR(1000)    NULL                        COMMENT '배송정보', 
    `refund_info`              VARCHAR(1000)    NULL                        COMMENT '교환/환불정보', 
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
    ADD CONSTRAINT UC_site_url UNIQUE (site_url);

INSERT INTO sellers (
    id,
    accounts_id,
    seller_types_id,
    account,
    password,
    name_kr,
    name_en,
    mobile_number,
    cs_phone_number,
    site_url,
    is_used
) VALUES (
    1,
    (SELECT id from accounts WHERE id=2 LIMIT 1),
    (SELECT id from seller_types WHERE id=1 LIMIT 1),
    'seller1',
    1234,
    'seller1_이름',
    'seller1_name',
    01011111111,
    01011111111,
    'seller1_url',
    TRUE
),
(
    2,
    (SELECT id from accounts WHERE id=3 LIMIT 1),
    (SELECT id from seller_types WHERE id=2 LIMIT 1),
    'seller2',
    1234,
    'seller2_이름',
    'seller2_name',
    01022222222,
    01022222222,
    'seller2_url',
    TRUE   
),
(
    3,
    (SELECT id from accounts WHERE id=4 LIMIT 1),
    (SELECT id from seller_types WHERE id=3 LIMIT 1),
    'seller3',
    1234,
    'seller3_이름',
    'seller3_name',
    01033333333,
    01033333333,
    'seller3_url',
    TRUE   
),
(
    4,
    (SELECT id from accounts WHERE id=5 LIMIT 1),
    (SELECT id from seller_types WHERE id=4 LIMIT 1),
    'seller4',
    1234,
    'seller4_이름',
    'seller4_name',
    01044444444,
    01044444444,
    'seller4_url',
    TRUE   
),
(
    5,
    (SELECT id from accounts WHERE id=6 LIMIT 1),
    (SELECT id from seller_types WHERE id=5 LIMIT 1),
    'seller5',
    1234,
    'seller5_이름',
    'seller5_name',
    01055555555,
    01055555555,
    'seller5_url',
    TRUE   
),
(
    6,
    (SELECT id from accounts WHERE id=7 LIMIT 1),
    (SELECT id from seller_types WHERE id=1 LIMIT 1),
    'seller6',
    1234,
    'seller6_이름',
    'seller6_name',
    01066666666,
    01066666666,
    'seller6_url',
    TRUE   
),
(
    7,
    (SELECT id from accounts WHERE id=8 LIMIT 1),
    (SELECT id from seller_types WHERE id=2 LIMIT 1),
    'seller7',
    1234,
    'seller7_이름',
    'seller7_name',
    01077777777,
    01077777777,
    'seller7_url',
    TRUE   
),
(
    8,
    (SELECT id from accounts WHERE id=9 LIMIT 1),
    (SELECT id from seller_types WHERE id=3 LIMIT 1),
    'seller8',
    1234,
    'seller8_이름',
    'seller8_name',
    01088888888,
    01088888888,
    'seller8_url',
    TRUE   
),
(
    9,
    (SELECT id from accounts WHERE id=10 LIMIT 1),
    (SELECT id from seller_types WHERE id=4 LIMIT 1),
    'seller9',
    1234,
    'seller9_이름',
    'seller9_name',
    01099999999,
    01099999999,
    'seller9_url',
    TRUE   
),
(
    10,
    (SELECT id from accounts WHERE id=11 LIMIT 1),
    (SELECT id from seller_types WHERE id=5 LIMIT 1),
    'seller10',
    1234,
    'seller10_이름',
    'seller10_name',
    01010101010,
    01010101010,
    'seller10_url',
    TRUE   
)


;

-- seller_representative Table Create SQL
CREATE TABLE seller_representative
(
    `id`             BIGINT         NOT NULL    AUTO_INCREMENT  COMMENT 'id', 
    `sellers_id`     BIGINT         NULL                        COMMENT '셀러테이블_id FK', 
    `name`           VARCHAR(45)    NULL                        COMMENT '담당자명', 
    `mobile_number`  VARCHAR(11)    NULL                        COMMENT '담당자_핸드폰번호', 
    `email`          VARCHAR(45)    NULL                        COMMENT '담당자_이메일', 
    `is_used`        TINYINT        NULL                        COMMENT '사용여부', 
    `created_at`     DATETIME       NULL                        COMMENT '생성시간', 
    `updated_at`     DATETIME       NULL                        COMMENT '수정된시간', 
    PRIMARY KEY (id)
)ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '셀러_담당자 테이블';

ALTER TABLE seller_representative
    ADD CONSTRAINT FK_seller_representative_sellers_id FOREIGN KEY (sellers_id)
        REFERENCES sellers (id);


-- sellers_info_snapshot Table Create SQL
CREATE TABLE sellers_info_snapshot
(
    `id`                       BIGINT           NOT NULL    AUTO_INCREMENT  COMMENT 'id', 
    `seller_info_id`           BIGINT           NULL                        COMMENT '셀러_정보테이블_id FK', 
    `accounts_id`              BIGINT           NULL                        COMMENT '계정테이블_id FK', 
    `profile_image`            VARCHAR(200)     NULL                        COMMENT '셀러_프로필', 
    `ceo_name`                 VARCHAR(100)     NULL                        COMMENT '대표자명', 
    `company_name`             VARCHAR(100)     NULL                        COMMENT '사업자명', 
    `company_code`             VARCHAR(100)     NULL                        COMMENT '사업자번호', 
    `company_certi_image`      VARCHAR(200)     NULL                        COMMENT '사업자등록증', 
    `mail_order_code`          VARCHAR(100)     NULL                        COMMENT '통신판매업번호', 
    `mail_order_image`         VARCHAR(200)     NULL                        COMMENT '통신판매업신고필증', 
    `bg_image`                 VARCHAR(200)     NULL                        COMMENT '셀러페이지_배경이미지', 
    `single_line_intro`        VARCHAR(100)     NULL                        COMMENT '셀러_한줄_소개', 
    `detailed_intro`           VARCHAR(2000)    NULL                        COMMENT '셀러_상세_소개', 
    `shopping_info`            VARCHAR(1000)    NULL                        COMMENT '배송정보', 
    `refund_info`              VARCHAR(1000)    NULL                        COMMENT '교환환불정보', 
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
    `account`              VARCHAR(20)     NULL                         COMMENT '계정', 
    `password`             VARCHAR(300)    NULL                         COMMENT '비밀번호', 
    `name_kr`              VARCHAR(45)     NULL                         COMMENT '이름(한글)', 
    `name_en`              VARCHAR(45)     NULL                         COMMENT '이름(영문)', 
    `mobile_number`        VARCHAR(11)     NULL                         COMMENT '담당자_핸드폰번호', 
    `cs_phone_number`      VARCHAR(11)     NULL                         COMMENT '고객센터_전화번호', 
    `site_url`             VARCHAR(100)    NULL                         COMMENT '사이트_URL', 
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
    `is_used`                   TINYINT     NOT NULL                                COMMENT '사용여부',
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
),
(
    4,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    5,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    6,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    7,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    8,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    9,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    10,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    11,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    12,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    13,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    14,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    15,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    16,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    17,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    18,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    19,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    20,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    21,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    22,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    23,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    24,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    25,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    26,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    27,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    28,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    29,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    30,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    31,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    32,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    33,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    34,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    35,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    36,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    37,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    38,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    39,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    40,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    41,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    42,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    43,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    44,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    45,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    46,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    47,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    48,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    49,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    50,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    51,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    52,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    53,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    54,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    55,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    56,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    57,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    58,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    59,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    60,
    (SELECT id from option_types WHERE name='기본옵션' LIMIT 1),
    TRUE
),
(
    61,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    62,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    63,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    64,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    65,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    66,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    67,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    68,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    69,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    70,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    71,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    72,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    73,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    74,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    75,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    76,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    77,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    78,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    79,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    80,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    81,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    82,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    83,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    84,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    85,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    86,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    87,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    88,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    89,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    90,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    91,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    92,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    93,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    94,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    95,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    96,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    97,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    98,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    99,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
),
(
    100,
    (SELECT id from option_types WHERE name='옵션없음' LIMIT 1),
    TRUE
)




;

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

INSERT INTO basic_options (
    id,
    option_info_id,
    basic_options_colors_id,
    basic_options_sizes_id,
    is_stock_managed,
    stock_volume,
    is_used
) VALUES(
    1,
    (SELECT id from option_info WHERE id=1 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used
),
(
    2,
    (SELECT id from option_info WHERE id=41 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    3,
    (SELECT id from option_info WHERE id=41 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    4,
    (SELECT id from option_info WHERE id=41 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    5,
    (SELECT id from option_info WHERE id=42 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    6,
    (SELECT id from option_info WHERE id=42 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume 
    TRUE -- is_used   
),
(
    7,
    (SELECT id from option_info WHERE id=42 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    8,
    (SELECT id from option_info WHERE id=43 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    9,
    (SELECT id from option_info WHERE id=43 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    10,
    (SELECT id from option_info WHERE id=43 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    11,
    (SELECT id from option_info WHERE id=44 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    12,
    (SELECT id from option_info WHERE id=44 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    13,
    (SELECT id from option_info WHERE id=44 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    14,
    (SELECT id from option_info WHERE id=45 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    15,
    (SELECT id from option_info WHERE id=45 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    16,
    (SELECT id from option_info WHERE id=45 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    17,
    (SELECT id from option_info WHERE id=46 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    18,
    (SELECT id from option_info WHERE id=46 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    19,
    (SELECT id from option_info WHERE id=46 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    20,
    (SELECT id from option_info WHERE id=47 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    21,
    (SELECT id from option_info WHERE id=47 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    22,
    (SELECT id from option_info WHERE id=47 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    23,
    (SELECT id from option_info WHERE id=48 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    24,
    (SELECT id from option_info WHERE id=48 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    25,
    (SELECT id from option_info WHERE id=48 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    26,
    (SELECT id from option_info WHERE id=49 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    27,
    (SELECT id from option_info WHERE id=49 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    28,
    (SELECT id from option_info WHERE id=49 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    29,
    (SELECT id from option_info WHERE id=50 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    30,
    (SELECT id from option_info WHERE id=50 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    31,
    (SELECT id from option_info WHERE id=50 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    FALSE, -- is_stock_managed
    NULL, -- stock_volume
    TRUE -- is_used   
),
(
    32,
    (SELECT id from option_info WHERE id=51 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    33,
    (SELECT id from option_info WHERE id=51 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    34,
    (SELECT id from option_info WHERE id=51 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    35,
    (SELECT id from option_info WHERE id=52 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    36,
    (SELECT id from option_info WHERE id=52 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    37,
    (SELECT id from option_info WHERE id=52 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    38,
    (SELECT id from option_info WHERE id=53 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    39,
    (SELECT id from option_info WHERE id=53 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    40,
    (SELECT id from option_info WHERE id=53 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Navy' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    41,
    (SELECT id from option_info WHERE id=54 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    42,
    (SELECT id from option_info WHERE id=54 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    43,
    (SELECT id from option_info WHERE id=54 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Brown' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    44,
    (SELECT id from option_info WHERE id=55 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    45,
    (SELECT id from option_info WHERE id=55 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    46,
    (SELECT id from option_info WHERE id=55 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Wine' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    47,
    (SELECT id from option_info WHERE id=56 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    48,
    (SELECT id from option_info WHERE id=56 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    49,
    (SELECT id from option_info WHERE id=56 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Purple' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    50,
    (SELECT id from option_info WHERE id=57 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    51,
    (SELECT id from option_info WHERE id=57 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    52,
    (SELECT id from option_info WHERE id=57 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Black' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    53,
    (SELECT id from option_info WHERE id=58 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    54,
    (SELECT id from option_info WHERE id=58 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    55,
    (SELECT id from option_info WHERE id=58 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='White' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    56,
    (SELECT id from option_info WHERE id=59 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    57,
    (SELECT id from option_info WHERE id=59 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    58,
    (SELECT id from option_info WHERE id=59 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Gray' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
    TRUE -- is_used   
),
(
    59,
    (SELECT id from option_info WHERE id=60 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='Free' LIMIT 1),
    TRUE, -- is_stock_managed
    100, -- stock_volume
    TRUE -- is_used   
),
(
    60,
    (SELECT id from option_info WHERE id=60 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='XL' LIMIT 1),
    TRUE, -- is_stock_managed
    200, -- stock_volume
    TRUE -- is_used   
),
(
    61,
    (SELECT id from option_info WHERE id=60 LIMIT 1),
    (SELECT id from basic_options_colors WHERE name='Ivory' LIMIT 1),
    (SELECT id from basic_options_sizes WHERE name='L' LIMIT 1),
    TRUE, -- is_stock_managed
    300, -- stock_volume
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
    CONSTRAINT products_option_info_id_fkey FOREIGN KEY (option_info_id) REFERENCES option_info(id),
    CONSTRAINT products_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES accounts(id)
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
    created_at,
    updated_at,
    creator_id,
    changer_id
) VALUES (
    1, -- id 기본 선택
    '테스트1', -- name (required when registering)
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
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    'kim 테스트 상세정보', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=1 LIMIT 1), -- option_info_id (required when registering)
    1000, -- price
    10, -- discount_rate
    100, -- discount_price
    900, -- discounted_price
    NULL, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-01 01:01:01', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    2, -- id 자율/분리 선택
    '테스트2', -- name (required when registering)
    202, -- product_number
    'CV000000000000009077', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트1_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트1_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=2 LIMIT 1), -- option_info_id (required when registering)
    2000, -- price
    10, -- discount_rate
    200, -- discount_price
    1800, -- discounted_price
    NULL, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-02 01:02:02', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    3, -- id 자율/독립/할인 선택
    '테스트3', -- name (required when registering)
    3, -- product_number
    'CV00000000000000003', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트2_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트2_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=3 LIMIT 1), -- option_info_id (required when registering)
    3000, -- price
    10, -- discount_rate
    300, -- discount_price
    2700, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-03 01:03:03', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    4, -- id 자율/독립/할인 선택
    '테스트4', -- name (required when registering)
    4, -- product_number
    'CV00000000000000004', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트4_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트4_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=4 LIMIT 1), -- option_info_id (required when registering)
    4000, -- price
    10, -- discount_rate
    400, -- discount_price
    3600, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-04 01:04:04', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    5, -- id 자율/독립/할인 선택
    '테스트5', -- name (required when registering)
    5, -- product_number
    'CV00000000000000005', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트5_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트5_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=5 LIMIT 1), -- option_info_id (required when registering)
    5000, -- price
    10, -- discount_rate
    500, -- discount_price
    4500, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-05 01:05:05', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    6, -- id 자율/독립/할인 선택
    '테스트6', -- name (required when registering)
    6, -- product_number
    'CV00000000000000006', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트6_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트6_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=6 LIMIT 1), -- option_info_id (required when registering)
    6000, -- price
    10, -- discount_rate
    600, -- discount_price
    5400, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-06 01:06:06', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    7, -- id 자율/독립/할인 선택
    '테스트7', -- name (required when registering)
    7, -- product_number
    'CV00000000000000007', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트7_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트5_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=7 LIMIT 1), -- option_info_id (required when registering)
    7000, -- price
    10, -- discount_rate
    700, -- discount_price
    6300, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-07 01:07:07', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    8, -- id 자율/독립/할인 선택
    '테스트8', -- name (required when registering)
    8, -- product_number
    'CV00000000000000008', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트8_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트8_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=8 LIMIT 1), -- option_info_id (required when registering)
    8000, -- price
    10, -- discount_rate
    800, -- discount_price
    7200, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-08 01:08:08', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    9, -- id 자율/독립/할인 선택
    '테스트9', -- name (required when registering)
    9, -- product_number
    'CV00000000000000009', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트9_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트9_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=9 LIMIT 1), -- option_info_id (required when registering)
    9000, -- price
    10, -- discount_rate
    900, -- discount_price
    9100, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-09 01:09:09', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    10, -- id 자율/독립/할인 선택
    '테스트10', -- name (required when registering)
    10, -- product_number
    'CV00000000000000010', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트10_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트10_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=10 LIMIT 1), -- option_info_id (required when registering)
    10000, -- price
    10, -- discount_rate
    1000, -- discount_price
    9000, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-10 01:10:10', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    11, -- id 자율/독립/할인 선택
    '테스트11', -- name (required when registering)
    11, -- product_number
    'CV00000000000000011', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트11_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트11_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=11 LIMIT 1), -- option_info_id (required when registering)
    10000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-11 01:11:11', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    12, -- id 자율/독립/할인 선택
    '테스트12', -- name (required when registering)
    12, -- product_number
    'CV00000000000000012', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트12_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트12_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=12 LIMIT 1), -- option_info_id (required when registering)
    20000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-12 01:12:12', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    13, -- id 자율/독립/할인 선택
    '테스트13', -- name (required when registering)
    13, -- product_number
    'CV00000000000000013', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트13_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트13_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=13 LIMIT 1), -- option_info_id (required when registering)
    30000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-13 01:13:13', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    14, -- id 자율/독립/할인 선택
    '테스트14', -- name (required when registering)
    14, -- product_number
    'CV00000000000000014', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트14_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트14_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=14 LIMIT 1), -- option_info_id (required when registering)
    40000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-14 01:14:14', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    15, -- id 자율/독립/할인 선택
    '테스트15', -- name (required when registering)
    15, -- product_number
    'CV00000000000000015', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트15_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트15_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=15 LIMIT 1), -- option_info_id (required when registering)
    50000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-15 01:15:15', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    16, -- id 자율/독립/할인 선택
    '테스트16', -- name (required when registering)
    16, -- product_number
    'CV00000000000000016', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트16_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트16_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=16 LIMIT 1), -- option_info_id (required when registering)
    60000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-16 01:16:16', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    17, -- id 자율/독립/할인 선택
    '테스트17', -- name (required when registering)
    17, -- product_number
    'CV00000000000000017', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트17_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트17_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=17 LIMIT 1), -- option_info_id (required when registering)
    70000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-17 01:17:17', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    18, -- id 자율/독립/할인 선택
    '테스트18', -- name (required when registering)
    18, -- product_number
    'CV00000000000000018', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트18_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트18_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=18 LIMIT 1), -- option_info_id (required when registering)
    80000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-18 01:18:18', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    19, -- id 자율/독립/할인 선택
    '테스트19', -- name (required when registering)
    19, -- product_number
    'CV00000000000000019', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트19_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트19_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=19 LIMIT 1), -- option_info_id (required when registering)
    90000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-19 01:19:19', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    20, -- id 자율/독립/할인 선택
    '테스트20', -- name (required when registering)
    20, -- product_number
    'CV00000000000000020', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트20_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트20_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=20 LIMIT 1), -- option_info_id (required when registering)
    100000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-20 01:20:20', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=2 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    21, -- id 자율/독립/할인 선택
    '테스트21', -- name (required when registering)
    21, -- product_number
    'CV00000000000000021', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트21_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트21_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=21 LIMIT 1), -- option_info_id (required when registering)
    21000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-21 01:21:21', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    22, -- id 자율/독립/할인 선택
    '테스트22', -- name (required when registering)
    22, -- product_number
    'CV00000000000000022', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트22_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트22_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=22 LIMIT 1), -- option_info_id (required when registering)
    22000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-22 01:22:22', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    23, -- id 자율/독립/할인 선택
    '테스트23', -- name (required when registering)
    23, -- product_number
    'CV00000000000000023', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트23_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트23_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=23 LIMIT 1), -- option_info_id (required when registering)
    23000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-23 01:23:23', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    24, -- id 자율/독립/할인 선택
    '테스트24', -- name (required when registering)
    24, -- product_number
    'CV00000000000000024', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트24_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트24_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=24 LIMIT 1), -- option_info_id (required when registering)
    24000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-24 01:24:24', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    25, -- id 자율/독립/할인 선택
    '테스트25', -- name (required when registering)
    25, -- product_number
    'CV00000000000000025', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트25_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트25_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=25 LIMIT 1), -- option_info_id (required when registering)
    25000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-25 01:25:25', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    26, -- id 자율/독립/할인 선택
    '테스트26', -- name (required when registering)
    26, -- product_number
    'CV00000000000000026', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트26_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트26_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=26 LIMIT 1), -- option_info_id (required when registering)
    26000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-26 01:26:26', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    27, -- id 자율/독립/할인 선택
    '테스트27', -- name (required when registering)
    27, -- product_number
    'CV00000000000000027', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트27_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트27_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=27 LIMIT 1), -- option_info_id (required when registering)
    27000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-27 01:27:27', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    28, -- id 자율/독립/할인 선택
    '테스트28', -- name (required when registering)
    28, -- product_number
    'CV00000000000000028', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트28_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트28_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=28 LIMIT 1), -- option_info_id (required when registering)
    28000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-28 01:28:28', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    29, -- id 자율/독립/할인 선택
    '테스트29', -- name (required when registering)
    29, -- product_number
    'CV00000000000000029', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트29_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트29_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=29 LIMIT 1), -- option_info_id (required when registering)
    29000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-29 01:29:29', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    30, -- id 자율/독립/할인 선택
    '테스트30', -- name (required when registering)
    30, -- product_number
    'CV00000000000000030', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트30_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트30_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=30 LIMIT 1), -- option_info_id (required when registering)
    30000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-30 01:30:30', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    31, -- id 자율/독립/할인 선택
    '테스트31', -- name (required when registering)
    31, -- product_number
    'CV00000000000000031', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트31_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트31_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=31 LIMIT 1), -- option_info_id (required when registering)
    31000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-01-31 01:31:31', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    32, -- id 자율/독립/할인 선택
    '테스트32', -- name (required when registering)
    32, -- product_number
    'CV00000000000000032', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트32_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트32_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=32 LIMIT 1), -- option_info_id (required when registering)
    32000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-01 02:01:01', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    33, -- id 자율/독립/할인 선택
    '테스트33', -- name (required when registering)
    33, -- product_number
    'CV00000000000000033', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트33_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트33_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=33 LIMIT 1), -- option_info_id (required when registering)
    33000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-02 02:02:02', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    34, -- id 자율/독립/할인 선택
    '테스트34', -- name (required when registering)
    34, -- product_number
    'CV00000000000000034', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트34_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트34_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=34 LIMIT 1), -- option_info_id (required when registering)
    34000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-03 02:03:03', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    35, -- id 자율/독립/할인 선택
    '테스트35', -- name (required when registering)
    35, -- product_number
    'CV00000000000000035', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트35_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트35_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=35 LIMIT 1), -- option_info_id (required when registering)
    35000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-04 02:04:04', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    36, -- id 자율/독립/할인 선택
    '테스트36', -- name (required when registering)
    36, -- product_number
    'CV00000000000000036', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트36_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트36_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=36 LIMIT 1), -- option_info_id (required when registering)
    36000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-05 02:05:05', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    37, -- id 자율/독립/할인 선택
    '테스트37', -- name (required when registering)
    37, -- product_number
    'CV00000000000000037', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='가디건' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트37_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트37_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=37 LIMIT 1), -- option_info_id (required when registering)
    37000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-06 02:06:06', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    38, -- id 자율/독립/할인 선택
    '테스트38', -- name (required when registering)
    38, -- product_number
    'CV00000000000000038', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='코트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트38_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트38_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=38 LIMIT 1), -- option_info_id (required when registering)
    38000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-07 02:07:07', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    39, -- id 자율/독립/할인 선택
    '테스트39', -- name (required when registering)
    39, -- product_number
    'CV00000000000000039', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='점퍼' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트39_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트39_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=39 LIMIT 1), -- option_info_id (required when registering)
    39000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-08 02:08:08', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    40, -- id 자율/독립/할인 선택
    '테스트40', -- name (required when registering)
    40, -- product_number
    'CV00000000000000040', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='아우터' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='재킷' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트40_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트40_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=40 LIMIT 1), -- option_info_id (required when registering)
    40000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-09 02:09:09', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=3 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    41, -- id 자율/독립/할인 선택
    '테스트41', -- name (required when registering)
    41, -- product_number
    'CV00000000000000041', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='니트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트41_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트41_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=41 LIMIT 1), -- option_info_id (required when registering)
    41000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-10 02:10:10', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    42, -- id 자율/독립/할인 선택
    '테스트42', -- name (required when registering)
    42, -- product_number
    'CV00000000000000042', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트42_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트42_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=42 LIMIT 1), -- option_info_id (required when registering)
    42000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-11 02:11:11', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    43, -- id 자율/독립/할인 선택
    '테스트43', -- name (required when registering)
    43, -- product_number
    'CV00000000000000043', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='블라우스/셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트43_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트43_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=43 LIMIT 1), -- option_info_id (required when registering)
    43000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-12 02:12:12', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    44, -- id 자율/독립/할인 선택
    '테스트44', -- name (required when registering)
    44, -- product_number
    'CV00000000000000044', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='후드/맨투맨' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트44_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트44_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=44 LIMIT 1), -- option_info_id (required when registering)
    44000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-13 02:13:13', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    45, -- id 자율/독립/할인 선택
    '테스트45', -- name (required when registering)
    45, -- product_number
    'CV00000000000000045', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='베스트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트45_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트45_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=45 LIMIT 1), -- option_info_id (required when registering)
    45000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-14 02:14:14', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    46, -- id 자율/독립/할인 선택
    '테스트46', -- name (required when registering)
    46, -- product_number
    'CV00000000000000046', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='니트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트46_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트46_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=46 LIMIT 1), -- option_info_id (required when registering)
    46000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-15 02:15:15', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    47, -- id 자율/독립/할인 선택
    '테스트47', -- name (required when registering)
    47, -- product_number
    'CV00000000000000047', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트47_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트47_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=47 LIMIT 1), -- option_info_id (required when registering)
    47000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-16 02:16:16', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    48, -- id 자율/독립/할인 선택
    '테스트48', -- name (required when registering)
    48, -- product_number
    'CV00000000000000048', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='블라우스/셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트48_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트48_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=48 LIMIT 1), -- option_info_id (required when registering)
    48000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-17 02:17:17', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    49, -- id 자율/독립/할인 선택
    '테스트49', -- name (required when registering)
    49, -- product_number
    'CV00000000000000049', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='후드/맨투맨' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트49_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트49_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=49 LIMIT 1), -- option_info_id (required when registering)
    49000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-18 02:18:18', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    50, -- id 자율/독립/할인 선택
    '테스트50', -- name (required when registering)
    50, -- product_number
    'CV00000000000000050', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='베스트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트50_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트50_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=50 LIMIT 1), -- option_info_id (required when registering)
    50000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-19 02:19:19', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=4 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    51, -- id 자율/독립/할인 선택
    '테스트51', -- name (required when registering)
    51, -- product_number
    'CV00000000000000051', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='니트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트51_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트51_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=51 LIMIT 1), -- option_info_id (required when registering)
    51000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-20 02:20:20', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    52, -- id 자율/독립/할인 선택
    '테스트52', -- name (required when registering)
    52, -- product_number
    'CV00000000000000052', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트52_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트52_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=52 LIMIT 1), -- option_info_id (required when registering)
    52000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-21 02:21:21', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    53, -- id 자율/독립/할인 선택
    '테스트53', -- name (required when registering)
    53, -- product_number
    'CV00000000000000053', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='블라우스/셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트53_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트53_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=53 LIMIT 1), -- option_info_id (required when registering)
    53000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-22 02:22:22', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    54, -- id 자율/독립/할인 선택
    '테스트54', -- name (required when registering)
    54, -- product_number
    'CV00000000000000054', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='후드/맨투맨' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트54_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트54_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=54 LIMIT 1), -- option_info_id (required when registering)
    54000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-23 02:23:23', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    55, -- id 자율/독립/할인 선택
    '테스트55', -- name (required when registering)
    55, -- product_number
    'CV00000000000000055', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='베스트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트55_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트55_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=55 LIMIT 1), -- option_info_id (required when registering)
    55000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-24 02:24:24', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    56, -- id 자율/독립/할인 선택
    '테스트56', -- name (required when registering)
    56, -- product_number
    'CV00000000000000056', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='니트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트56_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트56_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=56 LIMIT 1), -- option_info_id (required when registering)
    56000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-25 02:25:25', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    57, -- id 자율/독립/할인 선택
    '테스트57', -- name (required when registering)
    57, -- product_number
    'CV00000000000000057', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='티셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트57_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트57_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=57 LIMIT 1), -- option_info_id (required when registering)
    57000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-26 02:26:26', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    58, -- id 자율/독립/할인 선택
    '테스트58', -- name (required when registering)
    58, -- product_number
    'CV00000000000000058', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='블라우스/셔츠' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트58_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트58_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=58 LIMIT 1), -- option_info_id (required when registering)
    58000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-27 02:27:27', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    59, -- id 자율/독립/할인 선택
    '테스트59', -- name (required when registering)
    59, -- product_number
    'CV00000000000000059', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='후드/맨투맨' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트59_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트59_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=59 LIMIT 1), -- option_info_id (required when registering)
    59000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-28 2:28:28', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
),
(
    60, -- id 자율/독립/할인 선택
    '테스트60', -- name (required when registering)
    60, -- product_number
    'CV00000000000000060', -- serial_number
    FALSE, -- is_temporary_save
    TRUE, -- is_sold
    TRUE, -- is_displayed
    TRUE, -- is_used
    (SELECT id from first_categories WHERE name='상의' LIMIT 1), -- first_categories_id (required when registering)
    (SELECT id from second_categories WHERE name='베스트' LIMIT 1), -- second_categories_id (required when registering)
    FALSE, -- information_notice_use
    NULL,-- information_notices_id
    '테스트60_한줄설명', -- one_line_description
    'https://s3-vugue-test.s3.ap-northeast-2.amazonaws.com/a440eb38-1b95-4256-bcfa-c768ed13bb72green_S.jpg', -- main_image (required when registering)
    NULL, -- image_1
    NULL, -- image_2
    NULL, -- image_3
    NULL, -- image_4
    '테스트60_상세설명', -- detailed_info (required when registering)
    NULL, -- youtube_url
    (SELECT id from option_info WHERE id=60 LIMIT 1), -- option_info_id (required when registering)
    60000, -- price
    NULL, -- discount_rate
    NULL, -- discount_price
    NULL, -- discounted_price
    TRUE, -- discount_infinite_period
    NULL, -- discount_start_period
    NULL, -- discount_end_period
    NULL, -- minimum_quantity
    NULL, -- maximum_quantity
    FALSE, -- product_tags_used
    '2020-02-29 2:29:29', -- created_at
    NULL, -- updated_at
    (SELECT id from accounts WHERE id=5 LIMIT 1), -- creator_id
    NULL -- changer_id
)
;

--
-- 18. products_counts
--
CREATE TABLE `products_counts` (
    `id`                BIGINT      NOT NULL    AUTO_INCREMENT,
    `is_used`           TINYINT     NOT NULL                        COMMENT '사용여부',
    PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '상품 개수';

INSERT INTO products_counts (id, is_used) VALUES (1, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (2, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (3, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (4, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (5, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (6, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (7, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (8, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (9, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (10, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (11, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (12, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (13, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (14, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (15, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (16, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (17, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (18, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (19, TRUE);
INSERT INTO products_counts (id, is_used) VALUES (20, TRUE);

--
-- 19. products_counts
--
CREATE TABLE `product_tags` (
    `id`                BIGINT      NOT NULL        AUTO_INCREMENT,
    `products_id`       BIGINT      NOT NULL                                                COMMENT '상품 id 외래키 (FK)',
    `name`                          VARCHAR(100)    NOT NULL                                COMMENT '태그명',
    `is_used`                       TINYINT         NOT NULL                                COMMENT '사용여부',    
    `created_at`                    DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP   COMMENT '생성시간',
    `updated_at`                    DATETIME        NULL                                    COMMENT '수정시간',
    `creator_id`                    BIGINT          NULL                                    COMMENT '생성자',
    `changer_id`                    BIGINT          NULL                                    COMMENT '수정자',
    PRIMARY KEY (id),
    CONSTRAINT product_tags_products_id_fkey FOREIGN KEY (products_id) REFERENCES products(id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '상품 개수';
