# hsr-ime-dic

『崩壊：スターレイル』の固有名詞を中心にした、日本語入力用のユーザー辞書です。  
Microsoft IME 形式（`utf8/main.txt`）を元データとして、macOS・Gboard・ATOK向けの辞書データも `Makefile` から生成できます。

このリポジトリは [Umichang/nijisanji-ime-dic](https://github.com/Umichang/nijisanji-ime-dic) の構成を参考にしています。

## 配布ファイル

`build/` には以下の辞書ファイルを同梱しています。

- `main.txt` : Microsoft IME（UTF-16）
- `main.plist` : macOS ユーザ辞書
- `main.zip` : Gboard（Android）インポート用
- `main.atok.txt` : ATOK 用テキスト

必要な形式のファイルをダウンロードして利用してください。

## 使い方

### Microsoft IME（Windows）

1. `build/main.txt` を用意
2. Microsoft IME の辞書ツールを開く
3. 「ツール」→「テキストファイルからの登録」で `main.txt` を指定

### macOS（日本語入力）

1. `build/main.plist` を用意
2. macOS のユーザ辞書にインポート

### Gboard（Android）

1. `build/main.zip` を端末に保存
2. Gboard の辞書インポート機能から読み込み

### ATOK

1. `build/main.atok.txt` を用意
2. ATOK の辞書ユーティリティからテキスト辞書として登録

## 自分でビルドする

### 必要環境

- `nkf`
- `zip`
- 以下のどちらか
  - `userdic-py`（推奨）
  - `userdic-ng`

関連ツール:

- https://github.com/Umichang/userdic-py
- https://github.com/Umichang/userdic-ng

### ビルド

```bash
make
```

`utf8/*.txt` をもとに `build/` へ各形式の辞書を生成します。

### クリーン

```bash
make clean
```

## 収録内容について

- 主にキャラクター名・地名・用語など、変換しづらい固有名詞を収録
- 一部、誤読しやすい語や入力しづらい語の補助読みも含みます
- 更新履歴は `utf8/main.txt` 冒頭コメントに記載

## ライセンス

MIT License です。詳細は [LICENSE](./LICENSE) を参照してください。
