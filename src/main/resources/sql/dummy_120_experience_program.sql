-- ============================================================
-- 체험 프로그램 더미데이터 120건
-- 기존 기업(tbl_corp) ID를 순환 참조하여 생성
-- ============================================================

SET foreign_key_checks = 0;

-- 기존 기업 ID 목록 조회 (최대 10개 순환 사용)
SET @corp1 = (SELECT id FROM tbl_corp ORDER BY id LIMIT 1);
SET @corp2 = (SELECT id FROM tbl_corp ORDER BY id LIMIT 1 OFFSET 1);
SET @corp3 = (SELECT id FROM tbl_corp ORDER BY id LIMIT 1 OFFSET 2);

-- corp2, corp3이 NULL이면 corp1로 대체
SET @corp2 = IFNULL(@corp2, @corp1);
SET @corp3 = IFNULL(@corp3, @corp1);

-- ============================================================
-- 기존 더미 데이터 삭제 (재실행 시 중복 방지)
-- ============================================================
DELETE FROM tbl_experience_program
WHERE experience_program_title LIKE '[더미]%';

-- ============================================================
-- 체험 프로그램 120건 INSERT
-- ============================================================
INSERT INTO tbl_experience_program (
    corp_id,
    experience_program_title,
    experience_program_description,
    experience_program_level,
    experience_program_recruitment_count,
    experience_program_work_days,
    experience_program_work_hours,
    experience_program_deadline,
    experience_program_status,
    experience_program_view_count,
    experience_program_job
)
SELECT
    ELT(1 + MOD(n - 1, 3), @corp1, @corp2, @corp3),

    CONCAT('[더미] ',
        ELT(1 + MOD(n - 1, 30),
            'Spring Boot 백엔드 개발 체험',
            'React 프론트엔드 실무 체험',
            'AWS 클라우드 인프라 구축 체험',
            'Flutter 모바일 앱 개발 체험',
            'Python 데이터 분석 체험',
            'UI/UX 디자인 실무 체험',
            'DevOps CI/CD 파이프라인 구축',
            'Java 풀스택 웹 개발 체험',
            'Node.js API 서버 개발 체험',
            'MySQL 데이터베이스 설계 체험',
            'Docker & Kubernetes 실습',
            'AI 챗봇 서비스 개발 체험',
            'Vue.js SPA 개발 체험',
            '마케팅 데이터 분석 체험',
            '그래픽 디자인 포트폴리오 체험',
            'iOS Swift 앱 개발 체험',
            'TypeScript 풀스택 체험',
            '정보보안 실무 체험',
            'QA 테스트 자동화 체험',
            '프로젝트 매니지먼트 실습',
            'Figma 프로토타이핑 체험',
            'SEO 마케팅 전략 체험',
            '블록체인 DApp 개발 체험',
            'Unity 게임 개발 체험',
            'Angular 엔터프라이즈 웹 체험',
            '빅데이터 ETL 파이프라인 체험',
            'GraphQL API 설계 체험',
            '네트워크 엔지니어링 체험',
            '임베디드 시스템 개발 체험',
            'ERP 시스템 운영 체험'
        ),
        ' ', n, '기'
    ),

    CONCAT('<div class="program-description"><h3>프로그램 소개</h3><p>',
        ELT(1 + MOD(n - 1, 10),
            '실무 프로젝트에 참여하며 백엔드 개발 역량을 키울 수 있는 체험 프로그램입니다. Spring Boot와 JPA를 활용한 REST API 개발을 경험합니다.',
            '최신 프론트엔드 기술 스택을 활용하여 실제 서비스를 개발해보는 프로그램입니다. React와 TypeScript를 중심으로 진행됩니다.',
            '클라우드 환경에서의 인프라 구축과 운영을 체험합니다. EC2, S3, RDS 등 주요 AWS 서비스를 직접 다뤄봅니다.',
            '크로스 플랫폼 모바일 앱 개발을 체험합니다. Flutter와 Dart를 사용하여 iOS/Android 앱을 동시에 개발합니다.',
            'Python과 Pandas, NumPy를 활용한 데이터 분석 실무를 체험합니다. 실제 비즈니스 데이터를 다룹니다.',
            '사용자 중심의 UI/UX 디자인 프로세스를 체험합니다. 리서치부터 프로토타이핑까지 전 과정을 경험합니다.',
            'Jenkins, GitHub Actions를 활용한 CI/CD 파이프라인을 직접 구축해보는 프로그램입니다.',
            '프론트엔드부터 백엔드까지 전 과정을 아우르는 풀스택 개발 체험 프로그램입니다.',
            'Node.js와 Express를 활용하여 확장 가능한 API 서버를 설계하고 구축하는 체험입니다.',
            '데이터베이스 모델링부터 최적화까지 실무에서 필요한 DB 역량을 기를 수 있는 프로그램입니다.'
        ),
    '</p></div>'),

    ELT(1 + MOD(n - 1, 5), 'a', 'b', 'c', 'd', 'e'),

    ELT(1 + MOD(n - 1, 6), 3, 5, 8, 10, 15, 20),

    ELT(1 + MOD(n - 1, 4), '월~금', '월,수,금', '화,목', '월~토'),

    ELT(1 + MOD(n - 1, 4), '09:00~18:00', '10:00~19:00', '10:00~17:00', '09:00~15:00'),

    DATE_ADD('2026-04-01', INTERVAL MOD(n - 1, 90) DAY),

    ELT(1 + MOD(n - 1, 4), 'recruiting', 'recruiting', 'recruiting', 'draft'),

    FLOOR(RAND(n) * 500),

    ELT(1 + MOD(n - 1, 15),
        '백엔드 개발', '프론트엔드 개발', '클라우드 엔지니어', '모바일 개발', '데이터 분석',
        'UI/UX 디자인', 'DevOps', '풀스택 개발', '서버 개발', 'DBA',
        'AI/ML 엔지니어', '마케팅', '그래픽 디자인', 'QA 엔지니어', 'PM'
    )

FROM (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
    HAVING n <= 120
    ORDER BY n
) nums;

SET foreign_key_checks = 1;

-- ============================================================
-- 검증 쿼리
-- ============================================================
SELECT '체험 프로그램 더미 데이터 건수' AS label, COUNT(*) AS cnt
FROM tbl_experience_program
WHERE experience_program_title LIKE '[더미]%';

SELECT experience_program_status, COUNT(*) AS cnt
FROM tbl_experience_program
WHERE experience_program_title LIKE '[더미]%'
GROUP BY experience_program_status;
