-- 데이터베이스 생성 및 설정
-- CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

-- root 사용자 생성 및 권한 부여
-- CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;

CREATE SCHEMA IF NOT EXISTS `krampoline`;

-- 'krampoline' 스키마 선택
USE krampoline;

-- User 테이블 생성
CREATE TABLE IF NOT EXISTS UserEntity (
    id VARCHAR(36) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    createdAt DATETIME,
    CONSTRAINT UC_User UNIQUE (email)
);

-- Resume 테이블 생성
CREATE TABLE IF NOT EXISTS Resume (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    createdAt DATETIME,
    user_id VARCHAR(36),
    FOREIGN KEY (user_id) REFERENCES UserEntity(id) ON DELETE CASCADE
);

-- Award 테이블 생성
CREATE TABLE IF NOT EXISTS Award (
    id INT AUTO_INCREMENT PRIMARY KEY,
    awardName VARCHAR(255),
    awardingInstitution VARCHAR(255),
    date VARCHAR(255),
    description TEXT,
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);

-- Language 테이블 생성
CREATE TABLE IF NOT EXISTS Language (
    id INT AUTO_INCREMENT PRIMARY KEY,
    language VARCHAR(255),
    testName VARCHAR(255),
    score VARCHAR(255),
    date VARCHAR(255),
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);

-- Certificate 테이블 생성
CREATE TABLE IF NOT EXISTS Certificate (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certificateName VARCHAR(255),
    issuer VARCHAR(255),
    issueDate VARCHAR(255),
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);

-- Skill 테이블 생성
CREATE TABLE IF NOT EXISTS Skill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    techStack VARCHAR(255),
    description TEXT,
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);

-- Career 테이블 생성
CREATE TABLE IF NOT EXISTS Career (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company VARCHAR(255),
    department VARCHAR(255),
    startDate VARCHAR(255),
    endDate VARCHAR(255),
    isCurrent BOOLEAN,
    techStack VARCHAR(255),
    description TEXT,
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);

-- Project 테이블 생성
CREATE TABLE IF NOT EXISTS Project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    startDate VARCHAR(255),
    endDate VARCHAR(255),
    isCurrent BOOLEAN,
    intro TEXT,
    techStack VARCHAR(255),
    description TEXT,
    resume_id INT,
    FOREIGN KEY (resume_id) REFERENCES Resume(id) ON DELETE CASCADE
);