import os  # OSの環境変数を取得するため
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse

# -------------------------------
# サーバオブジェクト作成
app = FastAPI()
# -------------------------------

# -------------------------------
# クラス定義
class User:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

    def greet(self) -> str:
        if self.age >= 20:
            return f"こんにちは、{self.name}さん！大人ですね。"
        else:
            return f"こんにちは、{self.name}さん！若いですね。"
# -------------------------------

# -------------------------------
# データ構造（メモリ上）
users = [
    User("太郎", 25),
    User("花子", 17),
]
# -------------------------------

# -------------------------------
# ルートエンドポイント
@app.get("/greet")
async def greet(request: Request):
    # -------------------------------
    # OSの環境変数からデフォルトユーザー名を取得
    # 環境変数 'DEFAULT_USER' が存在すれば使用、なければ "ゲスト"
    default_name = os.environ.get("DEFAULT_USER", "ゲスト")
    # -------------------------------

    # クライアントからのリクエストパラメータがあればそちらを優先
    name = request.query_params.get("name", default_name)

    # -------------------------------
    # CPUが条件分岐と繰り返しを実行
    user = next((u for u in users if u.name == name), None)
    if user:
        message = user.greet()
    else:
        message = f"こんにちは、{name}さん！初めまして。"
    # -------------------------------

    return JSONResponse(content={"message": message})
# -------------------------------