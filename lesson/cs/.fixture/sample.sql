-- -------------------------------
-- データ構造（テーブル）
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- -------------------------------
-- データ操作（変数的に値を保持し、CPUで計算）
INSERT INTO users (name, age) VALUES ('太郎', 25);
INSERT INTO users (name, age) VALUES ('花子', 22);

-- 条件分岐的な処理（WHERE）
SELECT * FROM users WHERE age >= 23;

-- 繰り返し的処理（集計）
SELECT COUNT(*) FROM users;