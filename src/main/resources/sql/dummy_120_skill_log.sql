-- ============================================================
-- 스킬로그 더미데이터 120건 + 태그 데이터
-- 기존 개인회원(tbl_individual_member) ID를 순환 참조하여 생성
-- ============================================================

SET foreign_key_checks = 0;

-- ============================================================
-- 기존 더미 데이터 삭제 (재실행 시 중복 방지)
-- ============================================================
DELETE FROM tbl_tag
WHERE skill_log_id IN (
    SELECT id FROM tbl_skill_log WHERE skill_log_title LIKE '[더미]%'
);

DELETE FROM tbl_skill_log
WHERE skill_log_title LIKE '[더미]%';

-- ============================================================
-- 스킬로그 120건 INSERT
-- ============================================================
INSERT INTO tbl_skill_log (
    member_id,
    experience_program_id,
    skill_log_title,
    skill_log_content,
    skill_log_view_count,
    skill_log_status,
    created_datetime
)
SELECT
    4,

    NULL,

    CONCAT('[더미] ',
        ELT(1 + MOD(n - 1, 40),
            'Spring Boot 3.x 마이그레이션 후기',
            'React 18 동시성 렌더링 정리',
            'AWS EC2에서 Docker 컨테이너 배포하기',
            'Flutter 상태관리 비교: Provider vs Riverpod',
            'Python Pandas로 데이터 전처리 실습',
            'Figma Auto Layout 마스터하기',
            'GitHub Actions으로 CI/CD 구축한 경험',
            'JPA N+1 문제 해결 방법 총정리',
            'Express.js 미들웨어 패턴 이해하기',
            'MySQL 인덱스 최적화 실전 가이드',
            'Kubernetes Pod 스케줄링 이해하기',
            'ChatGPT API로 챗봇 서비스 만들기',
            'Vue 3 Composition API 완벽 가이드',
            'Google Analytics 4 마케팅 데이터 분석',
            'Photoshop에서 Figma로 전환 후기',
            'SwiftUI로 iOS 앱 만들어본 경험',
            'TypeScript 제네릭 심화 학습',
            'OWASP Top 10 보안 취약점 분석',
            'Selenium으로 E2E 테스트 자동화하기',
            'Jira와 Confluence로 프로젝트 관리하기',
            'Tailwind CSS 실무 적용 후기',
            'SEO 최적화 핵심 전략 정리',
            'Solidity로 스마트 컨트랙트 작성하기',
            'Unity C# 기초부터 2D 게임 만들기',
            'Angular 의존성 주입 패턴 이해',
            'Apache Spark 대용량 데이터 처리',
            'GraphQL vs REST API 비교 분석',
            'Nginx 리버스 프록시 설정 가이드',
            'Raspberry Pi로 IoT 프로젝트 만들기',
            'SAP ERP 모듈 이해하기',
            'Redis 캐시 전략 실무 적용기',
            'WebSocket으로 실시간 채팅 구현하기',
            'Terraform으로 인프라 코드화하기',
            'Spring Security JWT 인증 구현',
            'Next.js SSR vs SSG 비교 정리',
            'PostgreSQL JSONB 활용법',
            'RabbitMQ 메시지 큐 도입 경험',
            'Jest로 React 컴포넌트 테스트하기',
            'MyBatis 동적 SQL 작성 팁',
            'Linux 서버 관리 기본기 정리'
        ),
        ' #', n
    ),

    CONCAT('<div class="skill-log-content">',
        '<h2>',
        ELT(1 + MOD(n - 1, 10),
            '개요', '학습 배경', '프로젝트 소개', '기술 스택 선택 이유', '시작하며',
            '들어가며', '학습 동기', '문제 상황', '도입 배경', '시작'
        ),
        '</h2>',
        '<p>',
        ELT(1 + MOD(n - 1, 10),
            '이번 체험 프로그램에서 Spring Boot 3.x 마이그레이션 작업에 참여했습니다. 기존 2.x 버전에서 3.x로 업그레이드하면서 javax에서 jakarta로의 네임스페이스 변경, Spring Security 설정 방식 변화 등 다양한 이슈를 경험했습니다. 특히 auto-configuration 관련 변경사항이 가장 까다로웠는데, 이 글에서 해결 과정을 공유합니다.',
            'React 18에서 도입된 동시성 렌더링(Concurrent Rendering) 개념을 학습하고 정리했습니다. Suspense와 useTransition, useDeferredValue 같은 새로운 훅들의 사용법과 실제 성능 개선 사례를 다룹니다. 특히 대규모 리스트 렌더링에서 체감할 수 있는 차이가 인상적이었습니다.',
            'AWS EC2 인스턴스에 Docker를 설치하고 컨테이너 기반으로 애플리케이션을 배포한 과정을 기록합니다. Docker Compose를 활용하여 Spring Boot 앱과 MySQL을 함께 구성했으며, 보안 그룹 설정과 HTTPS 적용까지 전체 과정을 다룹니다.',
            'Flutter 앱 개발 시 가장 중요한 상태관리 라이브러리를 비교 분석했습니다. Provider, Riverpod, Bloc, GetX 각각의 장단점과 프로젝트 규모에 따른 추천 사항을 정리했습니다. 실제 프로젝트에서 Riverpod을 적용한 경험을 토대로 작성했습니다.',
            'Pandas를 활용한 데이터 전처리 실습 내용을 정리합니다. 결측치 처리, 이상치 탐지, 데이터 타입 변환, 그룹화 및 피벗 등 실무에서 자주 사용하는 기법들을 예제 코드와 함께 설명합니다.',
            'Figma의 Auto Layout 기능을 깊이 있게 학습했습니다. 패딩, 갭, 정렬 방식 등 기본 개념부터 반응형 디자인 구현까지 다양한 활용법을 정리합니다. 실제 모바일 앱 UI를 Auto Layout으로 구성한 예시도 포함했습니다.',
            'GitHub Actions를 사용하여 프로젝트의 CI/CD 파이프라인을 구축한 경험을 공유합니다. 빌드, 테스트, 린팅, 배포 자동화까지 전체 워크플로우를 yaml 파일 기반으로 설정한 과정을 기록합니다.',
            'JPA를 사용하면서 가장 빈번하게 마주치는 N+1 문제의 원인과 해결 방법을 정리합니다. Fetch Join, EntityGraph, BatchSize 등 다양한 해결 전략과 각각의 장단점을 실제 쿼리 로그를 통해 비교 분석합니다.',
            'Express.js의 미들웨어 패턴을 깊이 있게 이해하기 위해 학습한 내용을 정리합니다. 에러 핸들링 미들웨어, 인증 미들웨어, 로깅 미들웨어 등 실무에서 자주 사용하는 패턴들을 예제와 함께 설명합니다.',
            'MySQL에서 쿼리 성능을 개선하기 위한 인덱스 최적화 방법을 정리합니다. 실행 계획(EXPLAIN) 분석, 복합 인덱스 설계, 커버링 인덱스 활용 등 실무에서 바로 적용할 수 있는 기법들을 다룹니다.'
        ),
        '</p>',
        '<h2>핵심 내용</h2>',
        '<p>',
        ELT(1 + MOD(n - 1, 5),
            '실습을 통해 이론적으로만 알고 있던 개념을 체험적으로 이해할 수 있었습니다. 특히 디버깅 과정에서 예상치 못한 문제들을 만나면서 문제 해결 능력이 크게 향상되었습니다.',
            '기존 방식과 새로운 방식을 비교하면서 각각의 장단점을 파악할 수 있었습니다. 팀원들과의 코드 리뷰를 통해 더 나은 코드 작성법도 배울 수 있었습니다.',
            '직접 코드를 작성하고 배포까지 해보니 전체적인 개발 플로우를 이해하는 데 큰 도움이 되었습니다. 아키텍처 설계의 중요성을 다시 한번 느꼈습니다.',
            '성능 최적화에 대한 고민을 하면서 단순히 동작하는 코드를 넘어 효율적인 코드를 작성하는 방법을 배울 수 있었습니다.',
            '테스트 코드를 함께 작성하면서 코드의 안정성과 유지보수성에 대해 깊이 생각해볼 수 있었습니다. TDD 방법론의 장점을 체감했습니다.'
        ),
        '</p>',
        '</div>'
    ),

    FLOOR(RAND(n) * 500),

    'published',

    DATE_SUB(NOW(), INTERVAL FLOOR(RAND(n) * 180) DAY)

FROM (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
    HAVING n <= 120
    ORDER BY n
) nums;

-- ============================================================
-- 스킬로그 태그 데이터 (스킬로그당 1~3개 태그)
-- ============================================================
-- 첫 번째 삽입된 스킬로그 ID 저장
SET @first_sl_id = (SELECT MIN(id) FROM tbl_skill_log WHERE skill_log_title LIKE '[더미]%');

-- 태그 1: 모든 스킬로그에 기술 분야 태그
INSERT INTO tbl_tag (tag_name, skill_log_id)
SELECT
    ELT(1 + MOD(n - 1, 20),
        'Spring', 'React', 'AWS', 'Flutter', 'Python',
        'Figma', 'CI/CD', 'JPA', 'Node.js', 'MySQL',
        'Kubernetes', 'AI', 'Vue.js', '마케팅', '디자인',
        'Swift', 'TypeScript', '보안', '테스트', 'PM'
    ),
    @first_sl_id + (n - 1)
FROM (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
    HAVING n <= 120
    ORDER BY n
) nums;

-- 태그 2: 짝수번 스킬로그에 추가 태그
INSERT INTO tbl_tag (tag_name, skill_log_id)
SELECT
    ELT(1 + MOD(n - 1, 10),
        '백엔드', '프론트엔드', '클라우드', '모바일', '데이터분석',
        'UX', 'DevOps', 'ORM', 'API', '데이터베이스'
    ),
    @first_sl_id + (n - 1)
FROM (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
    HAVING n <= 120
    ORDER BY n
) nums
WHERE MOD(n, 2) = 0;

-- 태그 3: 3의 배수번 스킬로그에 추가 태그
INSERT INTO tbl_tag (tag_name, skill_log_id)
SELECT
    ELT(1 + MOD(n - 1, 10),
        '포트폴리오', '실무', '취업', '학습기록', '회고',
        '트러블슈팅', '성능최적화', '리팩토링', '설계', '배포'
    ),
    @first_sl_id + (n - 1)
FROM (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
    HAVING n <= 120
    ORDER BY n
) nums
WHERE MOD(n, 3) = 0;

SET foreign_key_checks = 1;

-- ============================================================
-- 검증 쿼리
-- ============================================================
SELECT '스킬로그 더미 데이터 건수' AS label, COUNT(*) AS cnt
FROM tbl_skill_log
WHERE skill_log_title LIKE '[더미]%';

SELECT '태그 더미 데이터 건수' AS label, COUNT(*) AS cnt
FROM tbl_tag
WHERE skill_log_id >= @first_sl_id;

SELECT tag_name, COUNT(*) AS cnt
FROM tbl_tag
WHERE skill_log_id IN (SELECT id FROM tbl_skill_log WHERE skill_log_title LIKE '[더미]%')
GROUP BY tag_name
ORDER BY cnt DESC
LIMIT 20;
